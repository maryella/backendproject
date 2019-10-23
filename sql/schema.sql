--CREATE DATABASE winery_reviews

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    city VARCHAR(200),
    state VARCHAR(50),
    picture VARCHAR(500)
);

CREATE TABLE wineries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) UNIQUE NOT NULL,
    address VARCHAR(200),
    street VARCHAR(200),
    city VARCHAR(200),
    state VARCHAR(50),
    zip INTEGER(10), --added later
    primary_vine VARCHAR(50),
    picture VARCHAR(500)
);

create table reviews (
    id SERIAL PRIMARY KEY,
    score INTEGER CHECK (score >= 0 AND score <= 100) ,
    content VARCHAR(1000) NOT NULL,
    -- a single review belongs to a single restaurant
    winery_id INTEGER REFERENCES wineries(id),
    -- a single review belongs to a single user
    user_id INTEGER REFERENCES users(id)
);
