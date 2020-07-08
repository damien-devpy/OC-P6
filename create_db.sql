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
CREATE TABLE user (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    location_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    mail VARCHAR(100) NOT NULL,
    CONSTRAINT fk_user_location_id FOREIGN KEY (location_id) REFERENCES location(id)
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
    user_id INT NOT NULL PRIMARY KEY,
    rank_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    login VARCHAR (50) NOT NULL,
    password VARCHAR(200) NOT NULL,
    CONSTRAINT fk__emp_user_id FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT fk_rank_id FOREIGN KEY (rank_id) REFERENCES rank_employe(id),
    CONSTRAINT fk_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);
CREATE TABLE unidentified_client (
    user_id INT NOT NULL PRIMARY KEY,
    CONSTRAINT fk_un_client_user_id FOREIGN KEY (user_id) REFERENCES user(id)
);
CREATE TABLE client (
    user_id INT NOT NULL PRIMARY KEY,
    login VARCHAR (50) NOT NULL,
    password VARCHAR(200) NOT NULL,
    CONSTRAINT fk_client_user_id FOREIGN KEY (user_id) REFERENCES user(id)
);
CREATE TABLE recipe (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC NOT NULL
);
CREATE TABLE note ( /* Liaison table between client table and recipe table */
    user_id INT NOT NULL,
    recipe_id INT NOT NULL,
    PRIMARY KEY (user_id, recipe_id),
    note SMALLINT NOT NULL,
    comment VARCHAR(500) NOT NULL,
    CONSTRAINT fk_note_user_id FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT fk_note_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipe(id)
);
CREATE TABLE ingredient (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price NUMERIC NOT NULL

);
CREATE TABLE ingredient_recipe ( /* Liaison table between ingredient table and recipe table */
    ingredient_id INT NOT NULL,
    recipe_id INT NOT NULL,
    PRIMARY KEY (ingredient_id, recipe_id),
    CONSTRAINT fk_recipe_ingredient_id FOREIGN KEY (ingredient_id) REFERENCES ingredient(id),
    CONSTRAINT fk_ingredient_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipe(id)
);
CREATE TABLE stock (
    restaurant_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    quantity SMALLINT NOT NULL,
    PRIMARY KEY (restaurant_id, ingredient_id),
    CONSTRAINT fk_stock_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES restaurant(id),
    CONSTRAINT fk_stock_ingredient_id FOREIGN KEY (ingredient_id) REFERENCES ingredient(id)

);
CREATE TABLE order_made (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    total NUMERIC NOT NULL,
    restaurant_id INT NOT NULL,
    CONSTRAINT fk_order_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);
CREATE TABLE cart (
    order_made_id INT NOT NULL,
    recipe_id INT NOT NULL,
    quantity SMALLINT NOT NULL,
    PRIMARY KEY (order_made_id, recipe_id),
    CONSTRAINT fk_order_id FOREIGN KEY (order_made_id) REFERENCES order_made(id),
    CONSTRAINT fk_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipe(id) 
);
CREATE TABLE define_status (
    id SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(100) NOT NULL
);
CREATE TABLE status (
    user_id INT NOT NULL,
    order_id INT NOT NULL,
    status_id SMALLINT NOT NULL,
    PRIMARY KEY (user_id, order_id, status_id),
    day DATE NOT NULL,
    hour TIME NOT NULL,
    CONSTRAINT fk_status_user_id FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT fk_status_order_id FOREIGN KEY (order_id) REFERENCES order_made(id),
    CONSTRAINT fk_define_status_id FOREIGN KEY (status_id) REFERENCES define_status(id)
);
INSERT INTO rank_employe(rank_emp) VALUES
    ('Director'),
    ('Manager'),
    ('Cook'),
    ('Deliverer'),
    ('Paymaster');
INSERT INTO define_status(status) VALUES
    ('Ordered'),
    ('Processing'),
    ('Ready'),
    ('Delivering'),
    ('Take away'),
    ('Delivered'),
    ('Paid'),
    ('Cancelled');