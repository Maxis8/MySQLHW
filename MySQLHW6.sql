-- Урок 6. SQL – Транзакции. Временные таблицы, управляющие конструкции, циклы
-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

use sem6;
DELIMITER &&
CREATE PROCEDURE time_counter(num INT)
BEGIN
	CASE
		WHEN num < 60 THEN
			SELECT CONCAT(num, ' ', 'seconds') AS Res;
        WHEN num >= 60 AND num < 3600 THEN
			SELECT CONCAT_WS(' ', num DIV 60, 'minutes', MOD(num, 60), 'seconds') AS Res;
        WHEN num >= 3600 AND num < 86400 THEN
			SELECT CONCAT_WS(' ', num DIV 3600, 'hours', MOD(num, 3600) DIV 60, 'minutes', MOD(MOD(num, 3600),60), 'seconds') AS Res;
        ELSE
			SELECT CONCAT_WS(' ', num DIV 86400, 'days', MOD(num, 86400) DIV 3600, 'hours', MOD(MOD(num, 86400),3600) DIV 60, 'minutes',
                             MOD(MOD(MOD(num, 86400),3600),60), 'seconds') AS Res;
    END CASE;
END&&

DELIMITER ;
CALL time_counter(123456);



-- 2. Выведите только четные числа от 1 до 10.
-- Пример: 2,4,6,8,10

delimiter &&
CREATE FUNCTION even_numbers (num INT)
RETURNS VARCHAR(256)
DETERMINISTIC
BEGIN
DECLARE i INT DEFAULT 0;
DECLARE res VARCHAR(256);
set res='';
WHILE i < num DO
SET i = i + 2;
SET res = concat(res, ' ', i);
END while;
RETURN res;
END &&
delimiter ;

SELECT even_numbers(10);
