const express = require('express');
const router = express.Router();
const mysqlconnect = require('../Database/DbConnect.js');



router.get('/login', (req, res) => {

   
    res.send('db connected');

});

router.get('/dashboard', (req, res) => {


    res.send('dashboard');

});


module.exports = router;