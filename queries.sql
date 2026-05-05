--Berapa jumlah karyawan per departement
SELECT
     Department,
     COUNT(*) AS Jumlah_karyawan
FROM Sales.Employees 
GROUP BY Department
ORDER BY Jumlah_karyawan DESC;

-- Jabatan yang paling banyak
SELECT 
     Department, 
     COUNT(*) AS Jumlah_karyawan
FROM Sales.Employees
GROUP BY Department
ORDER BY Jumlah_karyawan desc ;

-- Rata-rata gaji perdepartemen 
SELECT
     Department,
     COUNT(*) AS jumlah_karyawan, 
     SUM (Salary) AS Total_gaji,
     AVG (Salary) AS Rata_rata_gaji
FROM Sales.Employees
GROUP BY Department 
ORDER BY Total_gaji DESC ;

-- Karyawan dengan gaji tertinggi
SELECT TOP 1
     EmployeeID,
     FirstName,
     LastName, 
     Department, 
     Salary AS Gaji
FROM Sales.Employees
ORDER BY Gaji DESC;

-- Distribusi usia karyawan
SELECT
     FirstName,
     LastName,
     BirthDate,
     DATEDIFF (YEAR, BirthDate, GETDATE()) 
    - CASE 
	WHEN DATEADD(YEAR, DATEDIFF(YEAR, BirthDate, GETDATE()), BirthDate) > GETDATE()
	THEN 1 ELSE 0 END AS Usia 
FROM Sales.Employees ;

-- Kategori gaji karyawan (low, Medium, High)
SELECT
     FirstName,
     LastName,
     Department,
     Salary AS Gaji,
     CASE 
	WHEN Salary < 60000 THEN 'Low'
	WHEN Salary BETWEEN 60000 AND 80000 THEN 'Medium'
	ELSE 'High'
	END AS kategori_gaji
FROM Sales.Employees
ORDER BY Gaji ;

-- Jumlah karyawan per kategori 
SELECT
     CASE 
	WHEN Salary < 60000 THEN 'Low'
	WHEN Salary BETWEEN 60000 AND 80000 THEN 'Medium'
	ELSE 'High'
	END AS kategori_gaji,
	COUNT(*) AS Jumlah_karyawan
FROM Sales.Employees
GROUP BY 
     CASE 
	WHEN Salary < 60000 THEN 'Low'
	WHEN Salary BETWEEN 60000 AND 80000 THEN 'Medium'
	ELSE 'High'
	END
ORDER BY Jumlah_karyawan DESC;

-- Analisa per gender
SELECT
    Gender,
    COUNT(*) AS Jumlah_karyawan,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS persentase
FROM Sales.Employees
GROUP BY Gender;
