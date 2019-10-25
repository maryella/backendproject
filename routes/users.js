const express = require('express');
const router = express.Router();
const userModel = require('../models/userModels')
const bcrypt = require('bcryptjs');

/* GET users listing. */
router.get('/signup', async(req, res, next)  => {
  res.render('template', {
    locals: {
      title: 'Sign Up'
    },
    partials: {
      partial: 'partial-signup'
    }
  });
});
router.post('/signup', async (req, res, next) => {
  console.log(req.body);
  const { name, email, password, city, state} = req.body;
  const salt = bcrypt.genSaltSync(10);
  const hash = bcrypt.hashSync(req.body.password, salt);

  const user = new userModel (name, email, hash, city, state,);
  const addUser = await user.save();
  if (addUser){
    res.status(200).redirect("/users/login");
  }
  else {
    res.status(500);
  }
  
});

router.get('/login', async(req, res, next) => {
  res.render('template', {
    locals: {
      title: "Login"
    },
    partials: {
      partial: 'partial-login'
    }
  });
});
// the post sends information to the right place, which is the database



  router.post("/login", async (req, res, next) => {
    const { email, password } = req.body;
  
    const user = new userModel(null, email, password);
  
    const response = await user.login();
    console.log(response);
  
    if (!!response.isValid) {
        const { id, name } = response;
        // req.session.is_logged_in = true;
        // req.session.first_name = first_name;
        // req.session.last_name = last_name;
        // req.session.user_id = id;
        res.status(200).redirect("/users/signup");
    } else {
        res.sendStatus(401);
    }
  });




  

  
module.exports = router;
