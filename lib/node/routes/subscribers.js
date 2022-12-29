const express = require('express')
 const route = express.Router()
 const Subscriber =require('../model/subscriber')
 //get all
 route.get('/',async(req,res)=>{
    try {
        const subs= await Subscriber.find()
        res.json(subs)
    } catch (error) {
        res.status(500).json({message:error.message})
    }    
 })
 //get one
 route.get('/:id', getSubscriber, (req,res)=>{
    res.json(res.subscriber)
})
 //create one
 route.post('/',async(req,res)=>{
    const subscriber =new Subscriber({
        name: req.body.name,
        followers: req.body.followers,
        date: req.body.date
    })
    try {
        const newSubscriber =await subscriber.save()
        res.status(201).json(newSubscriber)
    } catch (error) {
        res.status(400).json({
            message: error.message
        })
    }
})
 //update one
 route.patch('/:id',getSubscriber,async(req,res)=>{
    if (req.body.name!=null) {
        res.subscriber.name=req.body.name
    }
    if (req.body.followers!=null) {
        res.subscriber.followers=req.body.followers
    }
    try {
        const updateUser = await res.subscriber.save()
        res.json(updateUser)
    } catch (error) {
        res.status(400).json({message:error.message})
    }
})
 //delete one
 route.delete('/:id',getSubscriber,async(req,res)=>{
    try {
        await res.subscriber.remove()
        res.json({message:'Deleted successfully'})
    } catch (error) {
        res.status(500).json({message:error.message})
    } 
})

async function getSubscriber(req,res,next){
    let subscriber
    try {
        subscriber= await Subscriber.findById(req.params.id)
        if(subscriber==null){
            return res.status(404).json({message:"Couldn't find the User!" })
        }
    } catch (error) {
      res.status(500).json(error.message)  
    }
    res.subscriber= subscriber
    next()
}

 module.exports =route