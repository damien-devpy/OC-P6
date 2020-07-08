CREATE DATABASE oc_pizza
USE oc_pizza

CREATE TABLE user (
    id INT NOT NULL AUTO_INCREMENT PRIMAY KEY
    location_id INT NOT NULL
    name VARCHAR(50) NOT NULL
    surname VARCHAR(50) NOT NULL
    phone_number VARCHAR(10) NOT NULL
    mail VARCHAR(100) NOT NULL
    CONSTRAINT fk_location_id FOREIGN KEY location_id REFERENCES location(id)
)

CREATE TABLE employe (
    user_id INT NOT NULL PRIMARY KEY
    rank_id INT NOT NULL
    restaurant_id INT NOT NULL
    login VARCHAR (50) NOT NULL
    password VARCHAR(200) NOT NULL
    CONSTRAINT fk_user_id FOREIGN KEY user_id REFERENCES user(id)
    CONSTRAINT fk_rank_id FOREIGN KEY rank_id REFERENCES rank(id)
    CONSTRAINT fk_restaurant_id FOREIGN KEY restaurant_id REFERENCES restaurant(id)
)

CREATE TABLE rank (
    id INT NOT NULL PRIMARY KEY
    rank VARCHAR(100) NOT NULL)
)

CREATE TABLE unidentified_client (
    user_id INT NOT NULL PRIMARY KEY
    CONSTRAINT fk_user_id FOREIGN KEY user_id REFERENCES user(id)
)

CREATE TABLE client (
    user_id INT NOT NULL PRIMARY KEY
    login VARCHAR (50) NOT NULL
    password VARCHAR(200) NOT NULL
)

CREATE TABLE recipe (
    id INT NOT NULL PRIMARY KEY
    name VARCHAR(100) NOT NULL
    price NUMERIC NOT NULL
)

CREATE TABLE note ( /* Liaison table between client table and recipe table */
    user_id INT NOT NULL
    recipe_id INT NOT NULL
    PRIMARY KEY (user_id, recipe_id)
    note SMALLINT NOT NULL
    comment VARCHAR(500) NOT NULL
    CONSTRAINT fk_user_id FOREIGN KEY user_id REFERENCES user(id)
    CONSTRAINT fk_recipe_id FOREIGN KEY recipe_id REFERENCES recipe(id)
)

CREATE TABLE ingredient (
    id INT NOT NULL PRIMARY KEY
    name VARCHAR(50)
    price NUMERIC NOT NULL

)

CREATE TABLE ingredient_recipe ( /* Liaison table between ingredient table and recipe table */
    ingredient_id INT NOT NULL
    recipe_id INT NOT NULL
    PRIMARY KEY (ingredient_id, recipe_id)
    CONSTRAINT fk_ingredient_id FOREIGN KEY ingredient_id REFERENCES ingredient(id)
    CONSTRAINT fk_recipe_id FOREIGN KEY recipe_id REFERENCES recipe(id)
)

CREATE TABLE restaurant (
    id INT NOT NULL PRIMARY KEY
    name VARCHAR(100) NOT NULL
    location_id INT NOT NULL
    CONSTRAINT fk_location_id FOREIGN KEY location_id REFERENCES location(id)
)

CREATE TABLE stock (
    restaurant_id INT NOT NULL
    ingredient_id INT NOT NULL
    PRIMARY KEY (restaurant_id, ingredient_id)
    CONSTRAINT fk_restaurant_id FOREIGN KEY restaurant_id REFERENCES restaurant(id)
    CONSTRAINT fk_ingredient_id FOREIGN KEY ingredient_id REFERENCES ingredient(id)

)

CREATE TABLE order (
    id INT NOT NULL PRIMARY KEY
    total NUMERIC NOT NULL
    restaurant_id INT NOT NULL
    CONSTRAINT fk_restaurant_id FOREIGN KEY restaurant_id REFERENCES restaurant(id)
)

CREATE TABLE cart (
    order_id INT NOT NULL
    recipe_id INT NOT NULL
    quantity INT NOT NULL
    PRIMARY KEY (order_id, recipe_id)
    CONSTRAINT fk_order_id FOREIGN KEY order_id REFERENCES order(id)
    CONSTRAINT fk_recipe_id FOREIGN KEY recipe_id REFERENCES recipe(id) 
)

CREATE TABLE status (
    user_id INT NOT NULL
    order_id INT NOT NULL
    day DATE NOT NULL
    hour TIME NOT NULL
    state VARCHAR(50) NOT NULL
)




