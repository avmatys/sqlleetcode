SELECT
	DISTINCT(cur.num) as "ConsecutiveNums"
FROM 
	Logs as cur
	INNER JOIN
	Logs as prev
	ON cur.id - 1 = prev.id and cur.num = prev.num
	INNER JOIN
	Logs as nxt
	ON cur.id + 1 = nxt.id and cur.num = nxt.num
	