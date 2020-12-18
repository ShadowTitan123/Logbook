const express = require('express');
const app = express();
const dotenv = require('dotenv');
const port = process.env.PORT || 3000;
const path = require('path');
const mysqlconnect = require('./Database/DbConnect.js');


//Define Static Folder 
app.use(express.static(path.join(__dirname, 'public')));

//Routes 

app.get('/login', require('./routes/api'))




app.listen(port,()=>{
    console.log(`LogBook App Running on port ${port}`);
});