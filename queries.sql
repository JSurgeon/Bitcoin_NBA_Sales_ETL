CREATE TABLE features (
id INT PRIMARY KEY,
week DATE,
store_id INT,
temperature_far FLOAT,
temperature_celcius FLOAT,
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

CREATE TABLE stores (
store_id INT,
store_type CHAR,
store_size INT
);

CREATE TABLE bball (

);





