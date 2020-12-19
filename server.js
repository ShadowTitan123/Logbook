const express = require('express');
const app = express();
const dotenv = require('dotenv').config();
const port = process.env.PORT || 3000;
const path = require('path');
const passport = require('passport');
const session = require('express-session')
const mysqlconnect = require('./Database/DbConnect.js');


// Passport config
require('./config/passport')(passport)


//Connect To Database
mysqlconnect.connect();

// Body parser
app.use(express.urlencoded({ extended: false }))
app.use(express.json())


// Sessions
app.use(session({
      secret: 'keyboard cat',
      resave: false,
      saveUninitialized: false,
    })
  )


  // Passport middleware , initialize and use express session with passport
app.use(passport.initialize())
app.use(passport.session())

//Define Static Folder 
app.use(express.static(path.join(__dirname, 'public')));

//Routes 
app.get('/login', require('./routes/api'))
app.get('/dashboard', require('./routes/api'))
app.get('/logout', require('./routes/api'))
app.get('/google/auth', require('./auth/auth'))

app.get('/google/callback', require('./auth/auth'))




app.listen(port,()=>{
    console.log(`LogBook App Running on port ${port}`);
});