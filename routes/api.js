const express = require('express');
const router = express.Router();
const mysqlconnect = require('../Database/DbConnect.js');
const { ensureAuth , ensureGuest } = require('../middleware/authenticate'); // destructing and calling 2 exports [0 ,1]



router.get('/login', (req, res) => {
    res.send('db connected');

});

router.get('/dashboard',ensureAuth,(req, res) => {
    res.render('dashboard');
});


module.exports = router;