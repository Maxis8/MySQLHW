-- Урок 2. SQL – создание объектов, простые запросы выборки
-- Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

CREATE TABLE sales (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	order_date DATE,
	bucket INT DEFAULT '0'
);

INSERT INTO `sales` (order_date, bucket)
VALUES 
('2022-01-01', 195),
('2022-01-02', 211),
('2022-01-03', 44),
('2022-01-04', 301),
('2022-01-05', 333);

-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT 
	id AS 'id',
	IF (count_product < 100, 'Маленький заказ', 
		IF (count_product BETWEEN 100 AND 300, 'Средний заказ', 'Большой заказ')
	) AS 'Тип заказа'	
FROM sales;


-- Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
-- Чем NULL отличается от 0?

CREATE TABLE orders (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	employee_id VARCHAR(5) NOT NULL UNIQUE DEFAULT 'e00',
	amount FLOAT(7,2) NOT NULL DEFAULT '0.00',
    order_status VARCHAR(15) NOT NULL DEFAULT 'OPEN'
);

INSERT INTO `orders` (employee_id, amount, order_status)
VALUES 
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT 
	employee_id AS 'Номер заказа',
	amount AS 'Сумма заказа',
    CASE order_status 
		WHEN 'OPEN' THEN 'Order is in open state'
		WHEN 'CLOSED' THEN 'Order is closed'
		WHEN 'CANCELLED' THEN 'Order is cancelled'
	END AS 'full_order_status'	
FROM orders;

-- Чем NULL отличается от 0?
-- NULL - это ячейка без значения, а "0" - цифра, с которой производят операции.







