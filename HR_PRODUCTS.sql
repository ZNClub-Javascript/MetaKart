CREATE TABLE PRODUCTS
(
  ID INTEGER PRIMARY KEY NOT NULL,
  NAME VARCHAR2(4000) NOT NULL,
  DESCRIPTION VARCHAR2(4000),
  PRICE INTEGER NOT NULL,
  IMAGE VARCHAR2(4000),
  STOCK INTEGER NOT NULL,
  CATEGORY VARCHAR2(20) NOT NULL
);

INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (3, 'Apples', 'Keeps you away from Doctors', 80, 'img/Vegs/apple.jpg', 230, 'Fruit');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (4, 'Apricots', 'Keeps your eyes functioning', 44, 'img/Vegs/apricots.jpg', 180, 'Fruit');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (5, 'Beetroot', 'Makes your black blood red', 48, 'img/Vegs/beetroot.jpg', 230, 'Vegetable');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (6, 'Broccoli', 'Mushrooms with fungus', 34, 'img/Vegs/broccoli.jpg', 180, 'Vegetable');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (7, 'Asparagus', 'Rich in vitamins', 55, 'img/Vegs/asparagus.jpg', 230, 'Vegetable');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (8, 'Brinjal', 'The bharta that we love!', 34, 'img/Vegs/aubergine.jpg', 180, 'Vegetable');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (9, 'Avocado', 'Dil ko rakhe jawaan!', 55, 'img/Vegs/avocado.jpg', 230, 'Vegetable');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (10, 'Banana', 'We have been eating this since early stages of evolution!', 34, 'img/Vegs/banana.jpg', 180, 'Fruit');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (11, 'Cherries', 'Doesnt let you pressurize your blood!', 55, 'img/Vegs/cherries.jpg', 230, 'Fruit');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (12, 'Guava', 'Immunity, that wont help you in roadies', 34, 'img/Vegs/guava.jpg', 180, 'Fruit');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (13, 'Grapes', 'Wines are made of this stuff!', 55, 'img/Vegs/grapes.jpg', 230, 'Fruit');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (14, 'Garlic', 'Combats common cold', 34, 'img/Vegs/garlic.jpg', 180, 'Vegetable');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (15, 'Figs', 'Helps you digest all the other veggies!', 55, 'img/Vegs/figs.jpg', 230, 'Vegetable');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (16, 'Brussels Sprouts', 'Keeps you think like a carrot!', 34, 'img/Vegs/Brusselssprouts.jpg', 180, 'Vegetable');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (17, 'Cabbage', 'Rich in Vitamin C', 55, 'img/Vegs/cabbage.jpg', 230, 'Vegetable');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (18, 'Dates', 'Helps you remember those important dates!', 34, 'img/Vegs/dates.jpg', 180, 'Vegetable');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (19, 'Chavli', 'Your daily dose of proteins', 55, 'img/Vegs/haricotbeans.jpg', 230, 'Vegetable');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (20, 'Kiwi', 'De-Tox your body today!', 34, 'img/Vegs/kiwi.jpg', 180, 'Fruit');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (21, 'Mushrooms', 'Cabbage without fungus!', 55, 'img/Vegs/mushrooms.jpg', 230, 'Vegetable');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (22, 'Leeks', 'Leak that extra sugar off and get rid of the diabetes!', 34, 'img/Vegs/leek.jpg', 180, 'Vegetable');
INSERT INTO HR.PRODUCTS (ID, NAME, DESCRIPTION, PRICE, IMAGE, STOCK, CATEGORY) VALUES (23, 'Carrots', 'Stuff that rabbits eat', 34, 'img/Vegs/carrots.jpg', 180, 'Vegetable');
