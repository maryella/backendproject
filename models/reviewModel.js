
const db = require("./conn")

class Review {
    constructor(score, content){
        this.score = score,
        this.content = content
        }

    static async getAllReviews() {
        try {
            const response = await db.any(`SELECT * FROM reviews;`);
            console.log("response:", response)
            return response; 
        } catch(error){
            return error.message
        }
    }
    async addNewReview() {
        try {
            const response = await db.result(`INSERT INTO reviews (score, content) VALUES ($1, $2);`, [this.score, this.content])
            console.log("addResponse:", response)
            return response;
        } catch(error){
            return error.message
        }
    }
    }



module.exports = Review;