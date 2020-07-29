DROP DATABASE oc_pizza;
CREATE DATABASE oc_pizza;
USE oc_pizza;
CREATE TABLE location (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    number SMALLINT NOT NULL,
    street VARCHAR(200) NOT NULL,
    zip_code MEDIUMINT NOT NULL,
    city VARCHAR(200) NOT NULL
);
CREATE TABLE rank_employe (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rank_emp VARCHAR(100) NOT NULL
);
CREATE TABLE restaurant (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location_id INT NOT NULL,
    CONSTRAINT fk_rest_location_id FOREIGN KEY (location_id) REFERENCES location(id)
);
CREATE TABLE employe (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rank_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    login VARCHAR (50) NOT NULL,
    password VARCHAR(200) NOT NULL,
    mail VARCHAR(100),
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    CONSTRAINT fk_rank_id FOREIGN KEY (rank_id) REFERENCES rank_employe(id),
    CONSTRAINT fk_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);
CREATE TABLE unidentified_client (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    location_id INT,
    CONSTRAINT fk_unident_location_id FOREIGN KEY (location_id) REFERENCES location(id)
);
CREATE TABLE client (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR (50) NOT NULL,
    password VARCHAR(200) NOT NULL,
    mail VARCHAR(100),
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    location_id INT,
    CONSTRAINT fk_client_location_id FOREIGN KEY (location_id) REFERENCES location(id)
);
CREATE TABLE recipe (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(4, 2) NOT NULL
);
CREATE TABLE ingredient (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL

);
CREATE TABLE composition (
    recipe_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (recipe_id, ingredient_id),
    CONSTRAINT fk_ingredient_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipe(id) ON DELETE CASCADE,
    CONSTRAINT fk_recipe_ingredient_id FOREIGN KEY (ingredient_id) REFERENCES ingredient(id) ON DELETE CASCADE
);
CREATE TABLE note (
    client_id INT NOT NULL,
    recipe_id INT NOT NULL,
    PRIMARY KEY (client_id, recipe_id),
    note SMALLINT NOT NULL,
    comment VARCHAR(500) NOT NULL,
    CONSTRAINT fk_note_client_id FOREIGN KEY (client_id) REFERENCES client(id),
    CONSTRAINT fk_note_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipe(id)
);
CREATE TABLE stock (
    restaurant_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    quantity SMALLINT NOT NULL,
    PRIMARY KEY (restaurant_id, ingredient_id),
    CONSTRAINT fk_stock_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES restaurant(id) ON DELETE CASCADE,
    CONSTRAINT fk_stock_ingredient_id FOREIGN KEY (ingredient_id) REFERENCES ingredient(id) ON DELETE CASCADE

);
CREATE TABLE state (
    id SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE order_made (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    state_id SMALLINT NOT NULL,
    unidentified_client_id INT,
    client_id INT,
    restaurant_id INT NOT NULL,
    location_id INT,
    checkout BOOLEAN NOT NULL,
    CONSTRAINT fk_state_id FOREIGN KEY (state_id) REFERENCES state(id),
    CONSTRAINT fk_unidentifier_client_id FOREIGN KEY (unidentified_client_id) REFERENCES unidentified_client(id),
    CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES client(id),
    CONSTRAINT fk_order_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES restaurant(id),
    CONSTRAINT fk_order_location_id FOREIGN KEY (location_id) REFERENCES location(id)
);
CREATE TABLE cart (
    order_made_id INT NOT NULL,
    recipe_id INT NOT NULL,
    quantity SMALLINT NOT NULL,
    price_recipe NUMERIC(4, 2),
    PRIMARY KEY (order_made_id, recipe_id),
    CONSTRAINT fk_order_id FOREIGN KEY (order_made_id) REFERENCES order_made(id) ON DELETE CASCADE,
    CONSTRAINT fk_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipe(id) ON DELETE CASCADE
);