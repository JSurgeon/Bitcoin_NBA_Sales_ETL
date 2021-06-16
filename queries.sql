CREATE TABLE features (
id SERIAL PRIMARY KEY,
week INT,
date DATE,
store_id INT,
temperature_far FLOAT,
temperature_celsius FLOAT,
fuel_price FLOAT,
cpi FLOAT,
unemployment FLOAT,
bitcoin_price FLOAT
);

CREATE TABLE sales (
id SERIAL PRIMARY KEY,
store INT,
date DATE,
dept INT,
weekly_sales FLOAT,
unofficial_holiday VARCHAR
);

CREATE TABLE games (
date DATE,
game_id INT PRIMARY KEY,
home_team_id INT,
home_team_name VARCHAR,
visitor_team_id INT,
visitor_team_name VARCHAR
);

CREATE TABLE stores (
store INT PRIMARY KEY,
type CHAR,
size INT
);

SELECT * FROM features;

SELECT * FROM games;

SELECT * FROM sales;

SELECT * FROM stores;

CREATE VIEW games_and_sales AS
SELECT features.date, features.temperature_far, features.cpi, features.bitcoin_price,
	sales.store, sales.dept, sales.weekly_sales, games.game_id, stores.type
FROM features
INNER JOIN sales ON features.date=sales.date
INNER JOIN games ON games.date=sales.date
INNER JOIN stores ON stores.store=features.store_id;

select count(distinct(game_id)) from games_and_sales;