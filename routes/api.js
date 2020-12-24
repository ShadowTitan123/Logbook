const express = require('express');
const router = express.Router();
const mysqlconnect = require('../Database/DbConnect.js');
const { ensureAuth , ensureGuest } = require('../middleware/authenticate'); // destructing and calling 2 exports [0 ,1]





router.post('/login', (req, res) => {
   
  
    const email = req.body.email;
    const password = req.body.password;
    console.log(email + password);
    //Check if User Exists 
    const checkUser = "Select * from `tbl_admin` where admin_email =  ? and admin_password = ? limit 1 ";
    mysqlconnect.query(checkUser, [email,password], function (err, rows, fields) {
        if (err) throw err
        else if (rows.length > 0){
            req.session.user = email;
            req.session.save();
           res.redirect('/dashboard');
        }else{
          const message = {
              message: "Wrong Credentials/User Not Found",
              status: false
          }
          res.json(message);
       
        }
    })

});



router.post('/storeWorkOrder', (req, res) => {
   
  
    const workOrder = req.body.workOrder;
    const json_work = JSON.parse(workOrder);
    console.log(json_work);



    //Store Data to DB


   //Send Response to client 
    res.json(json_work);
   
});




router.get('/dashboard',ensureAuth,(req, res) => {
    res.render('dashboard',{ admin_name : req.session.user || req.user.firstName});  // req.session contains local login session user ,req.user contains from google passportjs auth session
});


module.exports = router;