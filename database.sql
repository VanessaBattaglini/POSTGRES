create table MOCK_PRODUCTS (
	id INT,
	product_name VARCHAR(50),
	price INT,
	stock VARCHAR(50)
);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (1, 'Liners - Baking Cups', 298, true);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (2, 'Veal - Sweetbread', 6552, false);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (3, 'Oneshot Automatic Soap System', 6667, true);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (4, 'Cookies - Fortune', 882, true);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (5, 'Oil - Truffle, White', 5900, false);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (6, 'Appetizer - Smoked Salmon / Dill', 1263, true);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (7, 'Petite Baguette', 5366, false);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (8, 'Chocolate - Liqueur Cups With Foil', 2797, false);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (9, 'Juice - Apple, 341 Ml', 3654, false);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (10, 'Grouper - Fresh', 1266, false);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (11, 'Milk - Condensed', 5998, false);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (12, 'Straw - Regular', 9688, false);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (13, 'Beer - Alexander Kieths, Pale Ale', 4173, false);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (14, 'Rice - Basmati', 1036, true);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (15, 'Blueberries - Frozen', 2462, true);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (16, 'Ecolab - Lime - A - Way 4/4 L', 8092, false);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (17, 'Vermouth - Sweet, Cinzano', 6639, false);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (18, 'Kohlrabi', 7868, false);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (19, 'Mushroom - Morel Frozen', 7208, false);
insert into MOCK_PRODUCTS (id, product_name, price, stock) values (20, 'Syrup - Monin, Amaretta', 5486, false);




SELECT * FROM MOCK_PRODUCTS;

-- EJERCICIOS

SELECT * FROM MOCK_PRODUCTS LIMIT 10;

-- Ordernar los productos por nombre

SELECT * FROM MOCK_PRODUCTS ORDER BY LENGTH (product_name);

-- Agregar una columna para ver resultados

SELECT * , LENGTH (product_name) FROM MOCK_PRODUCTS ORDER BY LENGTH (product_name);

-- Seleccionar los datos de los productos junto a un código compuesto por tres letras

select product_name, LEFT(product_name, 3)  from mock_products;

-- Calcular el precio mínimo

SELECT MIN (price) FROM MOCK_PRODUCTS;

-- Calcular el precio máximo

SELECT MAX(price) FROM MOCK_PRODUCTS;

-- Cacular el precio promedio 

SELECT AVG(price) FROM MOCK_PRODUCTS ;
SELECT ROUND(AVG(price), 0) AS promedio
FROM mock_products;

-- Cuenta la cantidad de productos con stock

SELECT COUNT(*) FROM mock_products WHERE stock = 'false';

-- Contar la cantidad de precios sobre 7mil

SELECT COUNT(price) AS cantidad_de_productos FROM mock_products WHERE price > 7000;

-- Calcular el promedio de los procutos que tienen stock

SELECT ROUND(AVG(price), 2) FROM mock_products WHERE stock = 'true';

SELECT price, product_name FROM mock_products WHERE price > 7000 ORDER BY price DESC;


-- Precio del producto más algo por categoria (agregar un columnna)

ALTER TABLE MOCK_PRODUCTS ADD COLUMN categoria text;

UPDATE MOCK_PRODUCTS
SET categoria = 
  CASE 
    WHEN price < 1000 THEN 'Menor a 1000'
    WHEN price >= 1000 AND price<5000 THEN '1000 - 5000'
    WHEN price >= 5000 AND price < 8000 THEN '5000 - 8000'
    ELSE '8000 o más'
  END;
  
  -- Promedio de ventas
  
SELECT AVG(price) FROM MOCK_PRODUCTS  WHERE stock = 'false';

-- Promedio de los productos por categoria

SELECT categoria, ROUND(AVG(price), 2) FROM MOCK_PRODUCTS GROUP BY categoria;
  