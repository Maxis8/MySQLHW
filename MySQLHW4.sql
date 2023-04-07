-- 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
   SELECT COLOR  , COUNT(*) AS countcar FROM auto WHERE MARK = 'BMW' OR MARK = 'LADA'  
   GROUP BY COLOR;

-- 2. Вывести на экран марку авто и количество AUTO не этой марки
   SELECT sum(MARK = 'BMW'),  sum( MARK != 'BMW') as othercars FROM auto;

-- Задание №3.
-- Даны 2 таблицы, созданные следующим образом:
-- create table test_a (id number, data varchar2(1));
-- create table test_b (id number);
-- insert into test_a(id, data) values
-- (10, 'A'),
-- (20, 'A'),
-- (30, 'F'),
-- (40, 'D'),
-- (50, 'C');
-- insert into test_b(id) values
-- (10),
-- (30),
-- (50);
-- Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
   SELECT * FROM test_a LEFT JOIN  sem4.test_b  on test_a.id = test_b.id WHERE test_b.id IS NULL;