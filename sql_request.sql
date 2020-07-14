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

SELECT DISTINCT name FROM 
  (SELECT recipe.name as name, stock.quantity quantity_stock, composition.quantity as quantity_recipe FROM recipe
  INNER JOIN composition
  ON recipe.id = composition.recipe_id
  INNER JOIN ingredient
  ON composition.ingredient_id = ingredient.id
  INNER JOIN stock
  ON ingredient.id = stock.ingredient_id
  INNER JOIN restaurant
  ON stock.restaurant_id = restaurant.id
  WHERE restaurant.name = 'Le Charpentier') as sub_request_quantity
WHERE NOT quantity_stock <= quantity_recipe;

SELECT recipe.name FROM recipe
INNER JOIN composition
ON recipe.id = composition.recipe_id
INNER JOIN (
  SELECT ingredient.id as id_ingredient, ingredient.name, stock.quantity as stock_quantity, composition.quantity as compo_quantity FROM ingredient
  INNER JOIN composition
  ON ingredient.id = composition.ingredient_id
  INNER JOIN stock
  ON ingredient.id = stock.ingredient_id
  INNER JOIN restaurant
  ON stock.restaurant_id = restaurant.id
  WHERE restaurant.name = 'Le Charpentier') as suq_request
ON composition.ingredient_id = id_ingredient;
WHERE stock_quantity >= compo_quantity;

/* Changer la quantité de l'ingrédient 'carrots' pour zéro */

UPDATE stock
INNER JOIN ingredient
ON stock.ingredient_id = ingredient.id
INNER JOIN restaurant
ON stock.restaurant_id = restaurant.id
SET quantity = 0
WHERE ingredient.name = 'carrots' and restaurant.name = 'Le Charpentier';
