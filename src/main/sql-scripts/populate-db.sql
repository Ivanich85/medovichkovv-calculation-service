delete from mc_recipe_ingredient where 1 = 1;
delete from mc_component where 1 = 1;
delete from mc_recipe where 1 = 1;
delete from mc_ingredient where 1 = 1;

-- ингредиенты
insert into mc_ingredient
(id, user_id, name, quantity, quantity_type, cost)
values
(10000, 1000, 'Яйца белые', 10, 'PIECE', 85000),
(10001, 1000, 'Сахар', 1000, 'GRAM', 35),
(10002, 1000, 'Мед', 1000, 'GRAM', 350),
(10003, 1000, 'Мука', 2000, 'GRAM', 80),
(10004, 1000, 'Растительное масло', 925, 'GRAM', 75),
(10005, 1000, 'Сода', 200, 'GRAM', 50),

(10006, 1000, 'Сметана', 350, 'GRAM', 80),
(10007, 1000, 'Сахарная пудра', 1000, 'GRAM', 100),
(10008, 1000, 'Сливки 33%', 200, 'GRAM', 80),
(10009, 1000, 'Ваниль', 20, 'GRAM', 100),

(10010, 1000, 'Молоко', 1000, 'GRAM', 50),
(10011, 1000, 'Желтки', 10, 'PIECE', 75),
(10012, 1000, 'Яйца коричневые', 10, 'PIECE', 75),
(10013, 1000, 'Крахмал', 200, 'GRAM', 40),
(10014, 1000, 'Слив. масло', 180, 'GRAM', 120),
(10015, 1000, 'Сахар тростниковый', 1000, 'GRAM', 50),

(10016, 1000, 'Сметана жирная', 350, 'GRAM', 90),
(10017, 1000, 'Сливки 25%', 500, 'GRAM', 300),
(10018, 1000, 'Сахарная пудра 2', 1000, 'GRAM', 100),
(10019, 1000, 'Арахисовая паста', 500, 'GRAM', 500),

(10020, 1000, 'Творожный сыр', 170, 'GRAM', 70),
(10021, 1000, 'Сметана постная', 350, 'GRAM', 100),
(10022, 1000, 'Сливки 15%', 500, 'GRAM', 130),
(10023, 1000, 'Карамель', 300, 'GRAM', 450),

(10024, 1000, 'Упаковка', 1, 'PIECE', 50);


-- рецепт 1
insert into mc_recipe
(id, user_id, name, square, cake, creation_date, favorite)
values
(100, 1000, 'Медовик', 254.30, 10, current_timestamp, true);

insert into mc_component
(id, recipe_id, name, quantity, type)
values
(1000, 100, 'Коржи', 12, 'CAKE'),
(1001, 100, 'Крем сметанный', 1, 'CREAM'),
(1002, 100, 'Крем заварной', 1, 'CUSTARD'),
(1003, 100, 'Крем арахисовый', 1, 'CREAM'),
(1004, 100, 'Крем карамельный', 1, 'CREAM'),
(1005, 100, 'Упаковка', 1, 'PACK');

insert into mc_recipe_ingredient
(id, ingredient_id, component_id, quantity)
values
-- Коржи
(100000, 10000, 1000, 10),
(100001, 10001, 1000, 1000),
(100002, 10002, 1000, 1000),
(100003, 10003, 1000, 2000),
(100004, 10004, 1000, 925),
(100005, 10005, 1000, 25),

-- Крем сметанный
(100006, 10006, 1001, 350),
(100007, 10007, 1001, 1000),
(100008, 10008, 1001, 200),
(100009, 10009, 1001, 25),

-- Крем заварной
(100010, 10010, 1002, 1000),
(100011, 10011, 1002, 10),
(100012, 10012, 1002, 10),
(100013, 10013, 1002, 200),
(100014, 10014, 1002, 180),
(100015, 10015, 1002, 1000),

-- Крем арахисовый
(100016, 10016, 1003, 350 ),
(100017, 10017, 1003, 500),
(100018, 10018, 1003, 1000),
(100019, 10019, 1003, 500),

-- Крем карамельный
(100020, 10020, 1004, 170),
(100021, 10021, 1004, 350),
(100022, 10022, 1004, 500),
(100023, 10023, 1004, 300),

-- Упаковка
(100024, 10024, 1005, 1);


-- рецепт 2
insert into mc_recipe
(id, user_id, name, square, cake, creation_date, favorite)
values
(200, 1000, 'Наполеон', 325.00, 2, current_timestamp, false);

insert into mc_component
(id, recipe_id, name, quantity, type)
values
(2000, 200, 'Тесто', 12, 'CAKE'),
(2001, 200, 'Крем для наполеона', 1, 'CREAM'),
(2002, 200, 'Крем заварной', 1, 'CUSTARD');

insert into mc_recipe_ingredient
(id, ingredient_id, component_id, quantity)
values
-- Коржи
(200000, 10000, 2000, 10),
(200001, 10001, 2000, 2000),
(200002, 10002, 2000, 2000),
(200003, 10003, 2000, 2000),
(200004, 10004, 2000, 925),
(200005, 10005, 2000, 25),

-- Крем сметанный
(200006, 10006, 2001, 350),
(200007, 10007, 2001, 2000),
(200008, 10008, 2001, 200),
(200009, 10009, 2001, 25),

-- Крем заварной
(200010, 10010, 2002, 2000),
(200011, 10011, 2002, 10),
(200012, 10012, 2002, 10),
(200013, 10013, 2002, 200),
(200014, 10014, 2002, 180),
(200015, 10015, 2002, 2000);
