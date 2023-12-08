USE car_dealership;

-- 1 --
-- Get dealership table.
SELECT
	*
FROM
	dealerships;

-- 2 --
-- Get all vehicles for a specific dealership.
SELECT
	v.*
FROM
	vehicles v
		JOIN
	inventory i
		ON
		v.VIN = i.VIN
WHERE
	i.DealershipID = 1; -- Input DealershipID you are searching under.

-- 3 --
-- Find car by VIN
SELECT
	*
FROM
	vehicles
WHERE
	VIN = '12345678901234567'; -- Input VIN you are searching under.

-- 4 --
-- Find the dealership of a car located by VIN.
SELECT
	d.*
FROM
	dealerships d
		INNER JOIN
	inventory i
		ON
		d.DealershipID = i.DealershipID
WHERE
	i.VIN = '12345678901234567'; -- Input VIN you are searching under.

-- 5 --
-- Find all dealerships of a car type.
SELECT DISTINCT
	d.*
FROM
	dealerships d
		INNER JOIN
	inventory i
		ON
		d.DealershipID = i.DealershipID
        INNER JOIN
	vehicles v
		ON
        i.VIN = v.VIN
WHERE
	v.Make = 'Nissan' AND v.Model = 'Altima';
    
-- 6 --
-- Sales Information for specific dealership (specific date range).
SELECT
	sc.*
FROM
	sales_contracts sc
WHERE
	sc.DealerID = 1 -- Input DealerId you are searching under.
		AND
	sc.Date 
		BETWEEN
		'2023-01-01' AND '2023-12-31'; -- Input Date Range you are searching under.
    