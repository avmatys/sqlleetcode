SELECT 
	wr.id 
FROM 
	weather AS wl 
JOIN 
	weather AS wr 
ON 
	wr.recorddate = wl.recorddate + INTERVAL '1 DAY' 
WHERE 
	wr.temperature > wl.temperature;