/*
7. Сформировать запрос для получения числа в СПбГУ ИТМО хорошистов.
*/

SELECT COUNT(*) FROM ( 
	SELECT Н_УЧЕНИКИ.ЧЛВК_ИД,
	AVG (CASE WHEN (Н_ВЕДОМОСТИ.ОЦЕНКА IN ('2', '3', '4', '5')) THEN CAST (Н_ВЕДОМОСТИ.ОЦЕНКА AS 	INTEGER) END) AS СР_ОЦЕНКА 
	FROM Н_УЧЕНИКИ 
	JOIN Н_ВЕДОМОСТИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ВЕДОМОСТИ.ЧЛВК_ИД
	GROUP BY Н_УЧЕНИКИ.ЧЛВК_ИД )
WHERE СР_ОЦЕНКА >= 3.5 AND СР_ОЦЕНКА < 4.5;

/*
Результат:

 count
-------
  1672
(1 строка)
*/
