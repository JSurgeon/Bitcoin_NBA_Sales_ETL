CREATE TABLE features (
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
store INT,
date DATE,
dept INT,
weekly_sales FLOAT,
unofficial_holiday VARCHAR
);

CREATE TABLE games (
date DATE,
game_id INT,
home_team_id INT,
home_team_name VARCHAR,
visitor_team_id INT,
visitor_team_name VARCHAR
);

CREATE TABLE stores (
store INT,
type CHAR,
size INT
);

