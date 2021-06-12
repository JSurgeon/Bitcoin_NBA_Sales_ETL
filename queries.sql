CREATE TABLE features (
id INT PRIMARY KEY,
week INT,
date DATE,
store_id INT,
temperature_far FLOAT,
temperature_celsius FLOAT,
fuel_price FLOAT,
cpi FLOAT,
is_holiday BOOLEAN,
unemployment FLOAT,
bitcoin_price FLOAT
);

CREATE TABLE sales (
store_id INT,
dept_num INT,
week DATE,
weekly_sales FLOAT,
unnoficial_holiday VARCHAR
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
store_id INT,
store_type CHAR,
store_size INT
);




