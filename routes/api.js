const express = require('express');
const router = express.Router();
const mysqlconnect = require('../Database/DbConnect.js');



router.get('/login',(req, res) =>{

mysqlconnect.connect();
res.send('db connected');



});


module.exports = router;