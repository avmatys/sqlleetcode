WITH nrm AS (
	SELECT 
		pid,
		tiv_2015,
		tiv_2016,
		CONCAT(lat::text, '.', lon::text) as lct
	FROM Insurance
)
SELECT 
	ROUND(SUM(tiv_2016)::numeric, 2)
FROM
	nrm n1
WHERE 
	EXISTS (
		SELECT 1 
		FROM nrm n2 
		WHERE n1.pid <> n2.pid AND n2.tiv_2015 = n1.tiv_2015
	)
	AND n1.lct NOT IN (SELECT lct FROM nrm n2 WHERE n1.pid <> n2.pid)


