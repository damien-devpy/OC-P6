/* Afficher l'adresse d'un client: */

SELECT client.name,
       client.surname,
       location.number,
       location.street,
       location.zip_code,
       location.city
FROM location
INNER JOIN client
ON client.location_id = location.id
WHERE client.name = 'Édith';


/* Affiche les commandes d'un client: */

SELECT order_made.id as order_id,
       recipe.name,
       recipe.price,
       cart.quantity,
       client.name as client_name,
       client.surname as client_surname
FROM order_made
INNER JOIN cart
ON order_made.id = cart.order_made_id
INNER JOIN recipe
ON cart.recipe_id = recipe.id
INNER JOIN client
ON order_made.client_id = client.id
WHERE client.name = 'Pauline';


/* Afficher les commandes d'un restaurant: */

SELECT order_made.id as order_id,
       recipe.name, recipe.id as recipe_id,
       recipe.price,
       cart.quantity,
       restaurant.name
FROM order_made
INNER JOIN cart
ON order_made.id = cart.order_made_id
INNER JOIN recipe
ON cart.recipe_id = recipe.id
INNER JOIN restaurant
ON order_made.restaurant_id = restaurant.id
WHERE restaurant.name = 'Le Charpentier';


/* Afficher l'adresse de la commande n°12 et l'identité du client... */

SELECT client.name,
       client.surname,
       location.number as numero_de_livraison,
       location.street as rue_de_livraison,
       location.zip_code as cp_de_livraison,
       location.city as ville_de_livraison
FROM client
INNER JOIN order_made
ON order_made.client_id = client.id
INNER JOIN location
ON order_made.location_id = location.id
WHERE order_made.id = 12;


/*... Et changer l'adresse de livraison du client (ancien id location = 9), et vérifier que l'adresse de la commande ne change pas */

UPDATE client SET location_id = 3 WHERE client.name = 'Gérard' AND client.surname = 'de';


/* Vérifier le prix payé pour une pizza dans une commande de la commande 12... */

SELECT order_made.id as id_commande,
       recipe.name as pizza,
       cart.price_recipe as prix_paye,
       recipe.price as prix_de_la_pizza
FROM order_made
INNER JOIN cart
ON order_made.id = cart.order_made_id
INNER JOIN recipe
ON cart.recipe_id = recipe.id
WHERE order_made.id = 12;


/*... Et changer son prix, et vérifier que le prix de la commande n'a pas changé */

UPDATE recipe SET price = 50 WHERE name = 'Language';


/* Lister les pizzas qui peuvent être confectionnées en fonction du stock du restaurant 'Le Charpentier' */

SELECT recipe.name, recipe.id FROM recipe /* 3 - Et on fait la différence */
WHERE recipe.id NOT IN 
  (SELECT DISTINCT sub_request.id_recipe FROM /* 2 - On sélection ensuite les recettes correspondantes, celles qui ne pourront pas être réalisées, donc. */
    (SELECT stock.ingredient_id, /* 1 - On sélectionne les ingrédients du stock du */
            stock.quantity as stock_quantity, /* restaurant dont la quantité est inférieur */
            composition.quantity as composition_quantity, /* à ce qui est nécessaire pour la recette */
            recipe.name as recipe_name,
            recipe.id as id_recipe,
            ingredient.name as ingredient_name
     FROM stock
     INNER JOIN restaurant
     ON restaurant.id = stock.restaurant_id
     INNER JOIN ingredient
     ON stock.ingredient_id = ingredient.id
     INNER JOIN composition
     ON ingredient.id = composition.ingredient_id
     INNER JOIN recipe
     ON composition.recipe_id = recipe.id
     WHERE restaurant.id = 2 AND stock.quantity < composition.quantity) as sub_request);


/* Changer la quantité de l'ingrédient pour vérifier la requête ci-dessous */

UPDATE stock
INNER JOIN ingredient
ON stock.ingredient_id = ingredient.id
INNER JOIN restaurant
ON stock.restaurant_id = restaurant.id
SET quantity = ...
WHERE ingredient.name = '...' and restaurant.id = 2;

/* Toutes les commandes qui ont été livrées, et à quelle adresse */

SELECT DISTINCT order_made.id, location.number, location.street, location.zip_code, location.city FROM recipe
INNER JOIN cart
ON recipe.id = cart.recipe_id
INNER JOIN order_made
ON cart.order_made_id = order_made.id
INNER JOIN state
ON order_made.state_id = state.id
INNER JOIN location
ON order_made.location_id = location.id
WHERE state.name = 'Delivered';

/* Les clients qui ont payés en cash */

SELECT client.name, order_made.id FROM client
INNER JOIN order_made
ON client.id = order_made.client_id
INNER JOIN state
ON order_made.state_id = state.id
WHERE state.name = 'Cash';

/* Commande de Margaret (client non identifié) dont le status est en attente */

SELECT order_made.id, recipe.name, state.name FROM order_made
INNER JOIN unidentified_client
ON order_made.unidentified_client_id = unidentified_client.id
INNER JOIN cart
ON order_made.id = cart.order_made_id
INNER JOIN recipe
ON cart.recipe_id = recipe.id
INNER JOIN state
ON order_made.state_id = state.id
WHERE unidentified_client.name = 'Margaret' AND state.name = 'Processing';

/* Sélectionner toutes les commandes et leurs états qui ont été réglées */

SELECT order_made.id, state.name, order_made.checkout FROM order_made
INNER JOIN state
ON order_made.state_id = state.id
WHERE order_made.checkout IS FALSE
ORDER BY order_made.id;
