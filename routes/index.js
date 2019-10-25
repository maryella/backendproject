var express = require('express');
var router = express.Router();
const wineryModel = require("../models/wineryModel")

router.get("/", async function (req, res, next) {
    const wineryData = await wineryModel.getAll();
  
    res.render("template", {
          locals: {
              title: "Wine Reviews",
              data: wineryData
          },
          partials: {
              partial: "partial-index"
          }
          }
      )
})


router.get("/new_winery", async function (req, res, next) {

    res.render("template", {
          locals: {
              title: "Add Winery",
            
          },
          partials: {
              partial: "partial-addwinery"
          }
          }
      )
})

module.exports = router;
