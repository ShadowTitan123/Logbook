const express = require('express');
const app = express();
const dotenv = require('dotenv').config();
const port = process.env.PORT || 3000;
const path = require('path');
const passport = require('passport');
const session = require('express-session')
const ejs = require('ejs');
const cookieParser = require('cookie-parser');
const mysqlconnect = require('./Database/DbConnect.js');
var MySQLStore = require('express-mysql-session')(session); // Store session data stored in db to retrieve after server restart
const { isAuth , isGuest } = require('./middleware/authenticate.js'); // destructing and calling 2 exports [0 ,1]


// Passport config to add google strategy
require('./config/passport')(passport)


//Connect To Database
mysqlconnect.connect();

// Body parser
app.use(express.urlencoded({ extended: false }))
app.use(express.json())


var options = {
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'ajlogbook'
};

var sessionStore = new MySQLStore(options);

app.use(cookieParser('session_cookie_secret')); // any string ex: 'keyboard cat'

app.use(session({
  secret: "session_secret",
  resave: true,
  saveUninitialized: true,
  cookie: {
    maxAge: 24 * 60 * 60 * 1000
  },
  store: sessionStore,
}))


  // Passport middleware , initialize and use express session with passport
app.use(passport.initialize())
app.use(passport.session())

//Define Static Folder 
app.use(express.static(path.join(__dirname, 'public')));


app.set('view engine','ejs');



//Routes 
app.post('/login', require('./routes/api'))
app.get('/dashboard', require('./routes/api'))
app.get('/logout', require('./auth/auth'))

app.get('/google/auth', require('./auth/auth'))
app.get('/google/callback', require('./auth/auth'))

//Ejs routes

app.get('/ejs',(req, res)=>{
  res.render('test');
})





app.listen(port,()=>{
    console.log(`LogBook App Running on port ${port}`);
});