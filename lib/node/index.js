require('dotenv').config()

const express = require('express')

const app = express()

const mongoose =require('mongoose')
mongoose.connect(process.env.DB_Url)
const db = mongoose.connection

  db.on('error',(error)=>console.error(error))
  db.once('open',()=>console.log('Successfully connecteddd!!!!'))

app.use(express.json())
const subRoutes = require('./routes/subscribers')
app.use('/subscribers', subRoutes)


app.listen(3000, () => console.log("Hello, World "));