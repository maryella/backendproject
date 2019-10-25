var express = require('express');
var router = express.Router();
const reviewModel = require("../models/reviewModel")

router.get("/", async function (req, res, next) {
    const reviewData = await reviewModel.getAllReviews();
  
    res.render("template", {
          locals: {
              title: "Reviews",
              data: reviewData
          },
          partials: {
              partial: "partial-review"
          }
          }
      )
})

router.get("/newreview", async function (req, res, next) {

    res.render("template", {
          locals: {
              title: "Add Reviews",
            
          },
          partials: {
              partial: "partial-reviewentry"
          }
          }
      )
})

router.post("/addreview", async (req, res) => {
    const{ review_score, review_content } = req.body;


    const new_review = new reviewModel(review_score, review_content)
    const addReview = await new_review.addNewReview();

    if (addReview){
        res.status(200).redirect("/index");
    }
    else {
        res.sendStatus(500);
    }
})

module.exports = router;