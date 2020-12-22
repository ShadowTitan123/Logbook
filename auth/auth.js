const express = require('express');
const router = express.Router();
const passport = require('passport');



// @desc    Auth with Google
router.get('/google/auth', passport.authenticate('google', { scope: ['profile','email'] }))



// @desc    Google auth callback
router.get('/google/callback', passport.authenticate('google', { failureRedirect: '/' }),
  (req, res) => {
    res.redirect('/dashboard')
  }
)


// @desc Logout Route 

router.get('/logout',(req, res)=>{
  req.session.destroy();
  req.logout();
  res.redirect('/');
})

module.exports = router;