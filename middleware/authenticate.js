module.exports = {

ensureAuth: function (req, res, next) { // all these reqs coming from the route in server.js

    if(req.isAuthenticated()){  // isAuthenticated Method is set by password js after successful login (if set to true)
        return next(); // same as continue , but no loop 
    }else{
        res.redirect('/');
    }

},

ensureGuest: function(req, res, next){   // if user accesses home route , we dont have to show login page since he is authenticated , use this for dashboard route

    if(req.isAuthenticated()){ 
        res.redirect('/');
    }else{
        return next();
    }
}

}


// Exporting 2 middleware functions 