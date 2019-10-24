const db = require('./');

class Winery {
    constructor( name, address, street, city, state, zip, primary_vine, picture) {
        this.name = name;
        this.address = address;
        this.street = street;
        this. city = city;
        this. state = state;
        this.zip = zip;
        this.primary_vine = primary_vine;
        this.picture = picture;
    }
    static async getAll() {
        try {
            const response = await db.any (`SELECT * FROM winery_reviews;`);
            console.log ('response', response);
            return response;
        } catch(error){
            return error.message
        }
    }
    
}
module.exports = Winery;