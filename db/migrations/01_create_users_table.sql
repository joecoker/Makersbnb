CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(60) UNIQUE, password VARCHAR(15), email VARCHAR(60) UNIQUE);
CREATE TABLE spaces (id SERIAL PRIMARY KEY, owner INT REFERENCES users(id), spacename VARCHAR, description VARCHAR, price DECIMAL(6,2));
CREATE TABLE comments (id SERIAL PRIMARY KEY, space INTEGER REFERENCES spaces(id), commenter INTEGER REFERENCES users(id), commenttext VARCHAR(50));
CREATE TABLE availability(id SERIAL PRIMARY KEY, space INTEGER REFERENCES spaces(id), availabledate DATE, unavailable BOOLEAN DEFAULT FALSE);
