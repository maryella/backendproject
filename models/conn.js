const pgp = require("pg-promise")({
  query: function(e) {
    console.log("QUERY:", e.query);
  }
});

//options for local operation
const options = {
  host: "localhost",
  database: "winery_reviews"
};

const db = pgp(options);

module.exports = db;

//options & notes for connecting to db
// const options = {
//     host: 'winery-db.chhx1qhlsjau.us-east-2.rds.amazonaws.com',
//     database: 'winerydb',
//     user: "winery_master",
//     password: "PYWMRqjlnRFgo72eShp0",
// };
// psql -H winery-db.chhx1qhlsjau.us-east-2.rds.amazonaws.com -U winery_master

// psql -h winery-db.chhx1qhlsjau.us-east-2.rds.amazonaws.com -U winery_master

// psql -f winery.sql --host winery-db.chhx1qhlsjau.us-east-2.rds.amazonaws.com --username winery_master --dbname winerydb
