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
INSERT INTO location VALUES
    (NULL, 79, 'avenue de Leleu', 33032, 'Leblanc'),
    (NULL, 34, 'rue Charpentier', 75559, 'Pruvost-la-Forêt'),
    (NULL, 23, 'chemin Lebreton', 36276, 'Simon'),
    (NULL, 5, 'rue Victor Joubert', 45826, 'Roussel-sur-Mer'),
    (NULL, 43, 'avenue Barbe', 86012, 'Dupuis')
;
CREATE TABLE user (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    location_id INT,
    mail VARCHAR(100),
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    CONSTRAINT fk_user_location_id FOREIGN KEY (location_id) REFERENCES location(id)
);
INSERT INTO user VALUES
    (NULL, NULL, 'arthur.delorme@oc_pizza.com', 'Arthur', '0635119496', 'Delorme'),
    (NULL, NULL, 'alexandrie.bazin@oc_pizza.com', 'Alexandrie', '0651049233', 'Bazin'),
    (NULL, NULL, 'lucy.aubry@oc_pizza.com', 'Lucy', '0626652108', 'Aubry'),
    (NULL, NULL, 'théophile.diaz@oc_pizza.com', 'Théophile', '0682174956', 'Diaz'),
    (NULL, NULL, 'bernard.dijoux@oc_pizza.com', 'Bernard', '0638735580', 'Dijoux'),
    (NULL, NULL, 'aimée.gerard@oc_pizza.com', 'Aimée', '0600359345', 'Gerard'),
    (NULL, NULL, 'luc.fischer@oc_pizza.com', 'Luc', '0611037245', 'Fischer'),
    (NULL, NULL, 'augustin-frédéric.fontaine@oc_pizza.com', 'Augustin-Frédéric', '0683201009', 'Fontaine'),
    (NULL, NULL, 'aurélie.seguin@oc_pizza.com', 'Aurélie', '0689276074', 'Seguin'),
    (NULL, NULL, 'thomas-alain.mary@oc_pizza.com', 'Thomas-Alain', '0639349756', 'Mary'),
    (NULL, NULL, 'manon.de@oc_pizza.com', 'Manon', '0643633967', 'De'),
    (NULL, NULL, 'raymond.perrin@oc_pizza.com', 'Raymond', '0619462095', 'Perrin'),
    (NULL, NULL, 'frédéric.de@oc_pizza.com', 'Frédéric', '0629743436', 'de'),
    (NULL, NULL, 'antoinette.gautier@oc_pizza.com', 'Antoinette', '0610039579', 'Gautier'),
    (NULL, NULL, 'constance.du@oc_pizza.com', 'Constance', '0680310217', 'du'),
    (NULL, NULL, 'eugène-guillaume.lefebvre@oc_pizza.com', 'Eugène-Guillaume', '0680602554', 'Lefebvre'),
    (NULL, NULL, 'xavier-joseph.denis@oc_pizza.com', 'Xavier-Joseph', '0685527604', 'Denis'),
    (NULL, NULL, 'timothée.du@oc_pizza.com', 'Timothée', '0689804182', 'du'),
    (NULL, NULL, 'guillaume-robert.ledoux@oc_pizza.com', 'Guillaume-Robert', '0617819436', 'Ledoux'),
    (NULL, NULL, 'colette-marcelle.raymond@oc_pizza.com', 'Colette-Marcelle', '0662199222', 'Raymond'),
    (NULL, NULL, 'jeannine.duval@oc_pizza.com', 'Jeannine', '0668004458', 'Duval'),
    (NULL, NULL, 'adrien.ribeiro@oc_pizza.com', 'Adrien', '0689616093', 'Ribeiro'),
    (NULL, NULL, 'lorraine.le@oc_pizza.com', 'Lorraine', '0646633306', 'Le'),
    (NULL, NULL, 'isaac.munoz@oc_pizza.com', 'Isaac', '0660970514', 'Munoz'),
    (NULL, NULL, 'honoré.texier@oc_pizza.com', 'Honoré', '0639868532', 'Texier')
;
CREATE TABLE rank_employe (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rank_emp VARCHAR(100) NOT NULL
);
INSERT INTO rank_employe VALUES
    (NULL, 'Director'),
    (NULL, 'Manager'),
    (NULL, 'Deliverer'),
    (NULL, 'Cook'),
    (NULL, 'Paymaster')
;
CREATE TABLE restaurant (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location_id INT NOT NULL,
    CONSTRAINT fk_rest_location_id FOREIGN KEY (location_id) REFERENCES location(id)
);
INSERT INTO restaurant VALUES
    (NULL, 'Le Leu', 1),
    (NULL, 'Le Charpentier', 2),
    (NULL, 'Le Breton', 3),
    (NULL, 'Le Joubert', 4),
    (NULL, 'Le Barbe', 5)
;
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
INSERT INTO employe (
    (1, 1, 1),
    (2, 2, 1),
    (3, 3, 1),
    (4, 4, 1),
    (5, 5, 1),
    (6, 1, 2),
    (7, 2, 2),
    (8, 3, 2),
    (9, 4, 2),
    (10, 5, 2),
    (11, 1, 3),
    (12, 2, 3),
    (13, 3, 3),
    (14, 4, 3),
    (15, 5, 3),
    (16, 1, 4),
    (17, 2, 4),
    (18, 3, 4),
    (19, 4, 4),
    (20, 5, 4),
    (21, 1, 5),
    (22, 2, 5),
    (23, 3, 5),
    (24, 4, 5),
    (25, 5, 5)
;
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
    price NUMERIC(4,2) NOT NULL
);
INSERT INTO recipe VALUES
    (NULL, 'Full', 10.0),
    (NULL, 'Language', 10.0),
    (NULL, 'Thank', 10.0),
    (NULL, 'Staff', 10.0),
    (NULL, 'Material', 10.0),
    (NULL, 'Beautiful', 10.0),
    (NULL, 'Message', 10.0),
    (NULL, 'Read', 10.0),
    (NULL, 'Sit', 10.0),
    (NULL, 'Degree', 10.0)
;
CREATE TABLE ingredient (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price NUMERIC(4,2) NOT NULL

);
INSERT INTO ingredient VALUES
    (NULL, 'pepper', 6.6),
    (NULL, 'tomato', 7.92),
    (NULL, 'potatoe', 2.9),
    (NULL, 'carrots', 0.19),
    (NULL, 'garlic', 3.53),
    (NULL, 'mushrooms', 2.4),
    (NULL, 'onions', 6.81),
    (NULL, 'spinach', 1.57),
    (NULL, 'broccoli', 3.87),
    (NULL, 'beans', 9.22),
    (NULL, 'celery', 0.14),
    (NULL, 'cream', 4.47),
    (NULL, 'pumpkin', 3.8),
    (NULL, 'cheese', 9.71),
    (NULL, 'peas', 5.95)
;
CREATE TABLE composition (
    recipe_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (recipe_id, ingredient_id),
    CONSTRAINT fk_ingredient_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipe(id),
    CONSTRAINT fk_recipe_ingredient_id FOREIGN KEY (ingredient_id) REFERENCES ingredient(id)
);
INSERT INTO composition VALUES
    (1, 2, 3),
    (1, 8, 3),
    (1, 4, 3),
    (1, 3, 3),
    (1, 12, 1),
    (2, 6, 2),
    (2, 10, 1),
    (2, 5, 2),
    (2, 11, 2),
    (2, 9, 2),
    (3, 14, 1),
    (3, 9, 2),
    (3, 1, 3),
    (3, 12, 2),
    (3, 11, 1),
    (4, 4, 1),
    (4, 15, 1),
    (4, 1, 3),
    (4, 14, 3),
    (4, 11, 3),
    (5, 9, 1),
    (5, 11, 1),
    (5, 12, 1),
    (5, 4, 3),
    (5, 6, 2),
    (6, 15, 3),
    (6, 6, 3),
    (6, 4, 3),
    (6, 12, 2),
    (6, 8, 3),
    (7, 12, 3),
    (7, 14, 2),
    (7, 5, 3),
    (7, 4, 3),
    (7, 13, 3),
    (8, 11, 1),
    (8, 13, 2),
    (8, 15, 1),
    (8, 6, 3),
    (8, 4, 3),
    (9, 13, 3),
    (9, 14, 2),
    (9, 1, 3),
    (9, 4, 2),
    (9, 10, 1),
    (10, 6, 1),
    (10, 10, 3),
    (10, 9, 3),
    (10, 7, 2),
    (10, 14, 1)
;
CREATE TABLE note (
    user_id INT NOT NULL,
    recipe_id INT NOT NULL,
    PRIMARY KEY (user_id, recipe_id),
    note SMALLINT NOT NULL,
    comment VARCHAR(500) NOT NULL,
    CONSTRAINT fk_note_user_id FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT fk_note_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipe(id)
);
CREATE TABLE stock (
    restaurant_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    quantity SMALLINT NOT NULL,
    PRIMARY KEY (restaurant_id, ingredient_id),
    CONSTRAINT fk_stock_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES restaurant(id),
    CONSTRAINT fk_stock_ingredient_id FOREIGN KEY (ingredient_id) REFERENCES ingredient(id)

);
INSERT INTO stock VALUES
    (1, 1, 20),
    (1, 2, 20),
    (1, 3, 20),
    (1, 4, 20),
    (1, 5, 20),
    (1, 6, 20),
    (1, 7, 20),
    (1, 8, 20),
    (1, 9, 20),
    (1, 10, 20),
    (1, 11, 20),
    (1, 12, 20),
    (1, 13, 20),
    (1, 14, 20),
    (1, 15, 20),
    (2, 1, 20),
    (2, 2, 20),
    (2, 3, 20),
    (2, 4, 20),
    (2, 5, 20),
    (2, 6, 20),
    (2, 7, 20),
    (2, 8, 20),
    (2, 9, 20),
    (2, 10, 20),
    (2, 11, 20),
    (2, 12, 20),
    (2, 13, 20),
    (2, 14, 20),
    (2, 15, 20),
    (3, 1, 20),
    (3, 2, 20),
    (3, 3, 20),
    (3, 4, 20),
    (3, 5, 20),
    (3, 6, 20),
    (3, 7, 20),
    (3, 8, 20),
    (3, 9, 20),
    (3, 10, 20),
    (3, 11, 20),
    (3, 12, 20),
    (3, 13, 20),
    (3, 14, 20),
    (3, 15, 20),
    (4, 1, 20),
    (4, 2, 20),
    (4, 3, 20),
    (4, 4, 20),
    (4, 5, 20),
    (4, 6, 20),
    (4, 7, 20),
    (4, 8, 20),
    (4, 9, 20),
    (4, 10, 20),
    (4, 11, 20),
    (4, 12, 20),
    (4, 13, 20),
    (4, 14, 20),
    (4, 15, 20),
    (5, 1, 20),
    (5, 2, 20),
    (5, 3, 20),
    (5, 4, 20),
    (5, 5, 20),
    (5, 6, 20),
    (5, 7, 20),
    (5, 8, 20),
    (5, 9, 20),
    (5, 10, 20),
    (5, 11, 20),
    (5, 12, 20),
    (5, 13, 20),
    (5, 14, 20),
    (5, 15, 20)
;
CREATE TABLE order_made (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    location_id INT,
    CONSTRAINT fk_order_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
    CONSTRAINT fk_order_location_id FOREIGN KEY (location_id) REFERENCES location(id)
);
CREATE TABLE cart (
    order_made_id INT NOT NULL,
    recipe_id INT NOT NULL,
    quantity SMALLINT NOT NULL,
    price_recipe NUMERIC(4, 2)
    PRIMARY KEY (order_made_id, recipe_id),
    CONSTRAINT fk_order_id FOREIGN KEY (order_made_id) REFERENCES order_made(id),
    CONSTRAINT fk_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipe(id) 
);
CREATE TABLE define_status (
    id SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(100) NOT NULL
);
INSERT INTO define_status VALUES
    (NULL, 'Ordered'),
    (NULL, 'Processing'),
    (NULL, 'Ready'),
    (NULL, 'Delivering'),
    (NULL, 'Take away'),
    (NULL, 'Delivered'),
    (NULL, 'Paid'),
    (NULL, 'Cancelled')
;
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