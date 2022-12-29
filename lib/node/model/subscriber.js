const mongoose= require('mongoose')

const debugSchema = new mongoose.Schema({
    name:{
        type: String,
        required: true
    },
    followers:{
        type: Number,
        required: true
    },
    date:{
        type: Date,
        required: true,
        default: Date.now
    },
})


module.exports = mongoose.model('Subscriber',debugSchema)