const db = require('./conn');

class User {
    constructor(name, email, password, city, state, picture) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.city = city;
        this.state = state
        this.picture =  picture;
    }
    static async getAll () {
        try{
            const response = await db.any(`SELECT * FROM winery_reviews;`);
            console.log('response', response);
            return response;
        }catch(error){
            return error.message
        }
    }
}
module.exports = User;