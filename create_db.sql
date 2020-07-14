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
    (NULL, 43, 'avenue Barbe', 86012, 'Dupuis'),
    (NULL, 40, 'avenue Morvan', 33032, 'Leblanc'),
    (NULL, 80, 'rue de Jourdan', 33032, 'Leblanc'),
    (NULL, 72, 'boulevard de Bonnet', 75559, 'Pruvost-la-Forêt'),
    (NULL, 80, 'avenue Julien', 75559, 'Pruvost-la-Forêt'),
    (NULL, 8, 'avenue Payet', 6276, 'Simon'),
    (NULL, 75, 'rue de Guichard', 6276, 'Simon'),
    (NULL, 63, 'rue Ramos', 45826, 'Roussel-sur-Mer'),
    (NULL, 13, 'rue Adam', 45826, 'Roussel-sur-Mer'),
    (NULL, 13, 'rue Blanchet', 86012, 'Dupuis'),
    (NULL, 69, 'rue Buisson', 86012, 'Dupuis')
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
INSERT INTO employe VALUES
    (NULL, 1, 1, 'adelorme', '$pbkdf2-sha256$29000$6d17L2WMUWptTem9t5bS.g$hgkQNf67laJOKeHxDg.D4MiqeRyopW5f8SLPmx3UbEU', 'arthur.delorme@oc_pizza.com', 'Arthur', '0635119496', 'Delorme'),
    (NULL, 1, 1, 'lbazin', '$pbkdf2-sha256$29000$p1TKeQ/BWEvpnbOWsrZW6g$40vwsCNayXkG0gGMWLNZrPhYjAgio2SO2lNPkdnZMuc', 'lola.bazin@oc_pizza.com', 'Lola', '0651049233', 'Bazin'),
    (NULL, 2, 1, 'laubry', '$pbkdf2-sha256$29000$qZUyxrj3/h8DIASgtBai9A$xpHOQ1yQKSK9lMaAqO5L0B2sE8hgoINw7IkEhXzUck4', 'lucy.aubry@oc_pizza.com', 'Lucy', '0626652108', 'Aubry'),
    (NULL, 3, 1, 'tdiaz', '$pbkdf2-sha256$29000$jDEmRGhNqbW29h6DcI5Ryg$0ZJRo0/4XmfgNVjCvjd.Khg8O.FbnN8q3ibovk2cH1A', 'théophile.diaz@oc_pizza.com', 'Théophile', '0682174956', 'Diaz'),
    (NULL, 4, 1, 'bdijoux', '$pbkdf2-sha256$29000$vBeilNKac44xBmDsvffeuw$wb1w27hx4QUWOlqHfrykrjUquGX2j8xO9z86Qof5gag', 'bernard.dijoux@oc_pizza.com', 'Bernard', '0638735580', 'Dijoux'),
    (NULL, 5, 1, 'agerard', '$pbkdf2-sha256$29000$TAkBQIiR8l7LGcMYIwTg/A$Cc7.huRwkdqp8mhV8cvV9T2RmrEz5UMCGgB6wWeQjds', 'aimée.gerard@oc_pizza.com', 'Aimée', '0600359345', 'Gerard'),
    (NULL, 2, 2, 'lfischer', '$pbkdf2-sha256$29000$Xuu9F8J479177/3/XwvhnA$R3K5qetK3BGUQx5TjgeEPdFlKEME86bX4yL9jjJivj8', 'luc.fischer@oc_pizza.com', 'Luc', '0611037245', 'Fischer'),
    (NULL, 3, 2, 'afontaine', '$pbkdf2-sha256$29000$Rch5z5kzhrA2hlBqLQXgPA$OOxBECh5aFhEW3DmTUxHPjKyglSH/uAZaDrMPb9mjfc', 'augustin-frédéric.fontaine@oc_pizza.com', 'Augustin-Frédéric', '0683201009', 'Fontaine'),
    (NULL, 4, 2, 'aseguin', '$pbkdf2-sha256$29000$WstZK0VICYEQIqTU2tubkw$g7qKXGGYX95OY.eBX3eAXudtNnhks8dPUK0HWMKof50', 'aurélie.seguin@oc_pizza.com', 'Aurélie', '0689276074', 'Seguin'),
    (NULL, 5, 2, 'tmary', '$pbkdf2-sha256$29000$zhnjvLc2plRqba21VkpJKQ$42bwQje47svRd8xD4z.Y5G7ae179c9CGLb3XnRwVTrc', 'thomas-alain.mary@oc_pizza.com', 'Thomas-Alain', '0639349756', 'Mary'),
    (NULL, 2, 3, 'mde', '$pbkdf2-sha256$29000$9l4LAYCwds7ZW2stxbgXQg$G0DC/wXiDAecjUgcoPUYiIFS8VhO/lgD6eIkqsDnTuI', 'manon.de@oc_pizza.com', 'Manon', '0643633967', 'De'),
    (NULL, 3, 3, 'rperrin', '$pbkdf2-sha256$29000$x1jLOYcwJqRUCmGsdQ6BcA$pCVo7MmLYTxxxurzxgyJ8NQmu3BO7LuVlQssbseGZRQ', 'raymond.perrin@oc_pizza.com', 'Raymond', '0619462095', 'Perrin'),
    (NULL, 4, 3, 'fde', '$pbkdf2-sha256$29000$DsE4R8jZG.Mcw3hPqdU6Bw$U1NAcTZIfAQCWjMPauobY9bp2R7V/gSKAnln.47GNHA', 'frédéric.de@oc_pizza.com', 'Frédéric', '0629743436', 'de'),
    (NULL, 5, 3, 'agautier', '$pbkdf2-sha256$29000$41zL2ZvTmvO.1zqH8J5T6g$c92mPm0GfLNLDu0Me1bI8jxXrVZ1LA5V5iyqtO.eHWc', 'antoinette.gautier@oc_pizza.com', 'Antoinette', '0610039579', 'Gautier'),
    (NULL, 2, 4, 'cdu', '$pbkdf2-sha256$29000$OEdoTel9710LYcx5zzlnLA$iY4CoID608tClXa93K291Qj4KJ1kGQt.JFBglJ5vvLg', 'constance.du@oc_pizza.com', 'Constance', '0680310217', 'du'),
    (NULL, 3, 4, 'elefebvre', '$pbkdf2-sha256$29000$fo8x5lyL0fo/B6C01tr7/w$RkS0wC02Lqy9vOlOfvRPAurtqhUvKdTueQE.OqsSQwc', 'eugène-guillaume.lefebvre@oc_pizza.com', 'Eugène-Guillaume', '0680602554', 'Lefebvre'),
    (NULL, 4, 4, 'xdenis', '$pbkdf2-sha256$29000$8p5zzjmHEGLsXUupVepdaw$oAsHAE1JO58DtRdeFT5/14zCOZa8C7o85Hdj464EnXo', 'xavier-joseph.denis@oc_pizza.com', 'Xavier-Joseph', '0685527604', 'Denis'),
    (NULL, 5, 4, 'tdu', '$pbkdf2-sha256$29000$21srhVAqhRDiXMuZ0xpjbA$nP6XTTTy5GyrAejwn7t9gfJ2fB9Ov2k9396FDwuSlug', 'timothée.du@oc_pizza.com', 'Timothée', '0689804182', 'du'),
    (NULL, 2, 5, 'gledoux', '$pbkdf2-sha256$29000$m9N6DwFgrHUOwdi7t/YeAw$8zJd7dQepnNZ8v6FiSfc1Hg.o7dilEH0W59Hk4z5l2c', 'guillaume-robert.ledoux@oc_pizza.com', 'Guillaume-Robert', '0617819436', 'Ledoux'),
    (NULL, 3, 5, 'craymond', '$pbkdf2-sha256$29000$l3JuLcX4n7O2tvZeSyklJA$Xw74oBJ9D3Qh.3tv2Vu4aJ5WWrny3ZHm.ddMHur2gQA', 'colette-marcelle.raymond@oc_pizza.com', 'Colette-Marcelle', '0662199222', 'Raymond'),
    (NULL, 4, 5, 'jduval', '$pbkdf2-sha256$29000$U4oRwvg/B2CMsTYmBCCk9A$o4AwYadDGewUxHSYZDJzLyU3iGlyXTrJxBbGAKg4rCw', 'jeannine.duval@oc_pizza.com', 'Jeannine', '0668004458', 'Duval'),
    (NULL, 5, 5, 'aribeiro', '$pbkdf2-sha256$29000$IqQUghCiNIZwDkFIKaVUCg$mLoqvY6y5etPhmMInThGj/20o.JGVzdKhwR4cMRKTzs', 'adrien.ribeiro@oc_pizza.com', 'Adrien', '0689616093', 'Ribeiro')
;
CREATE TABLE unidentified_client (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    location_id INT,
    CONSTRAINT fk_unident_location_id FOREIGN KEY (location_id) REFERENCES location(id)
);
INSERT INTO unidentified_client VALUES
    (NULL, 'Stéphanie', '0647742918', 'Grondin', 6),
    (NULL, 'Vincent', '0604309684', 'Leclercq', 8),
    (NULL, 'Robert', '0686662546', 'Humbert', 10),
    (NULL, 'Olivier', '0609117035', 'Le', 12),
    (NULL, 'Margaret', '0648675266', 'Lemoine', 14),
    (NULL, 'Alex', '0684034969', 'Gimenez', NULL),
    (NULL, 'Élise', '0693174509', 'Lecornu', NULL),
    (NULL, 'Noël', '0651468475', 'Clerc', NULL),
    (NULL, 'Gérard', '0662726026', 'de', NULL),
    (NULL, 'Aurore', '0632984599', 'Samson', NULL)
;
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
INSERT INTO client VALUES
    (NULL, 'élombard', '$pbkdf2-sha256$29000$glAKQQghZAxByPk/R.jdmw$9hTPXF4Kfne6H.50lWsneEA/OtFLLatihG64G3TT9WE', 'édith.lombard@oc_pizza.com', 'Édith', '0653637709', 'Lombard', 7),
    (NULL, 'gde', '$pbkdf2-sha256$29000$KsV4r7WWMqaUcu7d23uP0Q$Bfjx3ds7RqhHErTPGqkxpwFPzyQb71MHgmU7.IfUuVI', 'gérard.de@oc_pizza.com', 'Gérard', '0638064893', 'de', 9),
    (NULL, 'pcamus', '$pbkdf2-sha256$29000$bG2tVQphrBVCqNV6790bow$y7GBbOME7fTFmdSGWi964hV4WtAkMnw1Yv1Lco0ipqg', 'pauline.camus@oc_pizza.com', 'Pauline', '0647618480', 'Camus', 11),
    (NULL, 'gperez', '$pbkdf2-sha256$29000$MeacE.J8j7GWMuZcC8EY4w$ZkBMICcAHy/4Gk9Z4dHA7MzGnZ8KvOD/m2cL9oH2sIg', 'georges.perez@oc_pizza.com', 'Georges', '0692969479', 'Perez', 13),
    (NULL, 'adelaunay','$pbkdf2-sha256$29000$RKgVYiyFUOodA4DQ.r.31g$FnWC9oMyyw/fZ2Xfengu5P/Ux16xq9zzJHFRkoxdH4Y','aimée.delaunay@oc_pizza.com','Aimée','0680504190','Delaunay', 15),
    (NULL, 'amathieu', '$pbkdf2-sha256$29000$iJFybk0JYUwJAUCodS4FgA$UnMEbOkMhOJ1pFXqJxVDBp2ezoRs.WPgeOtJPjnIQfA', 'alexandria.mathieu@oc_pizza.com', 'Alexandria', '0624840419', 'Mathieu', NULL),
    (NULL, 'alucas', '$pbkdf2-sha256$29000$CQGAMIbQ.h8DQGgNAQAAwA$86DOsnf/v2CeGRm0Xg4tEKm5EY3U2JXqlbQuIuBHdkM', 'auguste-benjamin.lucas@oc_pizza.com', 'Auguste-Benjamin', '0634109958', 'Lucas', NULL),
    (NULL, 'dde', '$pbkdf2-sha256$29000$FML435sTYizFWAuhVOqd8w$EaLZO1GMf/C7K5M2D/UrFuFlfTueu.1ZHk4lKGhdBDk', 'denise.de@oc_pizza.com', 'Denise', '0665004874', 'de', NULL),
    (NULL, 'dteixeira', '$pbkdf2-sha256$29000$Z0ypdQ5ByNnbG2MMYQxBKA$lM5jwHYLc05cRUj8P18TeqNQOQtROWMKd.Tsb1yws.0', 'dominique.teixeira@oc_pizza.com', 'Dominique', '0650817684', 'Teixeira', NULL),
    (NULL, 'élanglois', '$pbkdf2-sha256$29000$BSAkJKRUqrXW2lvrvVeqdQ$vGgqz4N.5kMOPVGKcUQPRsXokYHIUmkOphL7VVRvqFc', 'élise.langlois@oc_pizza.com', 'Élise', '0651740799', 'Langlois', NULL)
;
CREATE TABLE recipe (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(4, 2) NOT NULL
);
INSERT INTO recipe VALUES
    (NULL, 'Full', 9),
    (NULL, 'Language', 9),
    (NULL, 'Thank', 10),
    (NULL, 'Staff', 10),
    (NULL, 'Material', 11),
    (NULL, 'Beautiful', 12),
    (NULL, 'Message', 14),
    (NULL, 'Read', 14),
    (NULL, 'Sit', 15),
    (NULL, 'Degree', 15)
;
CREATE TABLE ingredient (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL

);
INSERT INTO ingredient VALUES
    (NULL, 'pepper'),
    (NULL, 'tomato'),
    (NULL, 'potatoe'),
    (NULL, 'carrots'),
    (NULL, 'garlic'),
    (NULL, 'mushrooms'),
    (NULL, 'onions'),
    (NULL, 'spinach'),
    (NULL, 'broccoli'),
    (NULL, 'beans'),
    (NULL, 'celery'),
    (NULL, 'cream'),
    (NULL, 'pumpkin'),
    (NULL, 'cheese'),
    (NULL, 'peas')
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
    unidentified_client_id INT,
    client_id INT,
    restaurant_id INT NOT NULL,
    location_id INT,
    CONSTRAINT fk_unidentifier_client_id FOREIGN KEY (unidentified_client_id) REFERENCES unidentified_client(id),
    CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES client(id),
    CONSTRAINT fk_order_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES restaurant(id),
    CONSTRAINT fk_order_location_id FOREIGN KEY (location_id) REFERENCES location(id)
);
INSERT INTO order_made VALUES
    (NULL, 1, NULL, 1, 6),
    (NULL, 2, NULL, 2, 7),
    (NULL, 3, NULL, 3, 8),
    (NULL, 4, NULL, 4, 9),
    (NULL, 5, NULL, 5, 10),
    (NULL, 6, NULL, 1, NULL),
    (NULL, 7, NULL, 2, NULL),
    (NULL, 8, NULL, 3, NULL),
    (NULL, 9, NULL, 4, NULL),
    (NULL, 10, NULL, 5, NULL),
    (NULL, NULL, 1, 1, 11),
    (NULL, NULL, 2, 2, 12),
    (NULL, NULL, 3, 3, 13),
    (NULL, NULL, 4, 4, 14),
    (NULL, NULL, 5, 5, 15),
    (NULL, NULL, 6, 1, NULL),
    (NULL, NULL, 7, 2, NULL),
    (NULL, NULL, 8, 3, NULL),
    (NULL, NULL, 9, 4, NULL),
    (NULL, NULL, 10, 5, NULL)
;
CREATE TABLE cart (
    order_made_id INT NOT NULL,
    recipe_id INT NOT NULL,
    quantity SMALLINT NOT NULL,
    price_recipe NUMERIC(4, 2),
    PRIMARY KEY (order_made_id, recipe_id),
    CONSTRAINT fk_order_id FOREIGN KEY (order_made_id) REFERENCES order_made(id),
    CONSTRAINT fk_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipe(id) 
);
INSERT INTO cart VALUES
    (1, 1, 3, 9),
    (2, 9, 2, 15),
    (2, 8, 1, 14),
    (3, 3, 2, 10),
    (4, 10, 1, 15),
    (5, 2, 2, 9),
    (5, 5, 2, 11),
    (6, 9, 2, 15),
    (6, 10, 1, 15),
    (7, 4, 3, 10),
    (7, 2, 1, 9),
    (7, 3, 2, 10),
    (8, 6, 3, 12),
    (8, 4, 2, 10),
    (8, 7, 2, 14),
    (9, 8, 3, 14),
    (9, 7, 2, 14),
    (9, 2, 1, 9),
    (9, 5, 1, 11),
    (10, 1, 3, 9),
    (10, 5, 2, 11),
    (11, 2, 2, 9),
    (11, 3, 3, 10),
    (11, 10, 3, 15),
    (11, 8, 1, 14),
    (12, 4, 1, 10),
    (12, 9, 2, 15),
    (12, 2, 2, 9),
    (12, 10, 3, 15),
    (12, 6, 1, 12),
    (13, 1, 2, 9),
    (13, 8, 2, 14),
    (14, 1, 3, 9),
    (14, 10, 2, 15),
    (14, 7, 2, 14),
    (14, 6, 3, 12),
    (14, 8, 2, 14),
    (15, 7, 1, 14),
    (15, 1, 1, 9),
    (16, 9, 3, 15),
    (16, 5, 2, 11),
    (17, 1, 3, 9),
    (17, 7, 2, 14),
    (17, 5, 2, 11),
    (17, 4, 3, 10),
    (18, 3, 2, 10),
    (18, 5, 2, 11),
    (18, 8, 2, 14),
    (19, 2, 3, 9),
    (19, 7, 3, 14),
    (19, 3, 2, 10),
    (20, 4, 2, 10),
    (20, 8, 3, 14)
;
CREATE TABLE define_status (
    id SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(100) NOT NULL
);
INSERT INTO define_status VALUES
    (NULL, 'Processing'),
    (NULL, 'Ready'),
    (NULL, 'Delivering'),
    (NULL, 'Remit'),
    (NULL, 'Delivered'),
    (NULL, 'Cash'),
    (NULL, 'Cancelled')
;
CREATE TABLE status (
    employe_id INT NOT NULL,
    order_id INT NOT NULL,
    status_id SMALLINT NOT NULL,
    PRIMARY KEY (employe_id, order_id, status_id),
    day DATE NOT NULL,
    hour TIME NOT NULL,
    CONSTRAINT fk_status_employe_id FOREIGN KEY (employe_id) REFERENCES employe(id),
    CONSTRAINT fk_status_order_id FOREIGN KEY (order_id) REFERENCES order_made(id),
    CONSTRAINT fk_define_status_id FOREIGN KEY (status_id) REFERENCES define_status(id)
);