-- PIVOT TABLE EXAMPLES

USE HRLFM
GO

IF OBJECT_ID('dbo.Orders') IS NOT NULL
DROP TABLE dbo.Orders;
GO

CREATE TABLE dbo.Orders
(
orderid   int        NOT NULL PRIMARY KEY NONCLUSTERED,
orderdate datetime   NOT NULL,
empid     int        NOT NULL,
custid    varchar(5) NOT NULL,
qty       int        NOT NULL
);

CREATE UNIQUE CLUSTERED INDEX idx_orderdate_orderid
ON dbo.Orders(orderdate, orderid);

INSERT INTO dbo.Orders(orderid, orderdate, empid, custid, qty)
VALUES(30001, '20020802', 3, 'A', 10);
INSERT INTO dbo.Orders(orderid, orderdate, empid, custid, qty)
VALUES(10001, '20021224', 1, 'A', 12);
INSERT INTO dbo.Orders(orderid, orderdate, empid, custid, qty)
VALUES(10005, '20021224', 1, 'B', 20);
INSERT INTO dbo.Orders(orderid, orderdate, empid, custid, qty)
VALUES(40001, '20030109', 4, 'A', 40);
INSERT INTO dbo.Orders(orderid, orderdate, empid, custid, qty)
VALUES(10006, '20030118', 1, 'C', 14);
INSERT INTO dbo.Orders(orderid, orderdate, empid, custid, qty)
VALUES(20001, '20030212', 2, 'B', 12);
INSERT INTO dbo.Orders(orderid, orderdate, empid, custid, qty)
VALUES(40005, '20040212', 4, 'A', 10);
INSERT INTO dbo.Orders(orderid, orderdate, empid, custid, qty)
VALUES(20002, '20040216', 2, 'C', 20);
INSERT INTO dbo.Orders(orderid, orderdate, empid, custid, qty)
VALUES(30003, '20040418', 3, 'B', 15);
INSERT INTO dbo.Orders(orderid, orderdate, empid, custid, qty)
VALUES(30004, '20020418', 3, 'C', 22);
INSERT INTO dbo.Orders(orderid, orderdate, empid, custid, qty)
VALUES(30007, '20020907', 3, 'D', 30);
GO


-- Static PIVOT
SELECT *
FROM (SELECT custid, YEAR(orderdate) AS orderyear, qty
FROM dbo.Orders) AS D
PIVOT(SUM(qty) FOR orderyear IN([2002],[2003],[2004])) AS P;
GO

-- Dynamic PIVOT
DECLARE @T AS TABLE(y INT NOT NULL PRIMARY KEY);

DECLARE
@cols AS NVARCHAR(MAX),
@y    AS INT,
@sql  AS NVARCHAR(MAX);


-- Construct the column list for the IN clause
-- e.g., [2002],[2003],[2004]
SET @cols = STUFF(
(SELECT N',' + QUOTENAME(y) AS [text()]
FROM (SELECT DISTINCT YEAR(orderdate) AS y FROM dbo.Orders) AS Y
ORDER BY y
FOR XML PATH('')),
1, 1, N'');

-- Construct the full T-SQL statement
-- and execute dynamically
SET @sql = N'SELECT *
FROM (SELECT custid, YEAR(orderdate) AS orderyear, qty
FROM dbo.Orders) AS D
PIVOT(SUM(qty) FOR orderyear IN(' + @cols + N')) AS P;';

EXEC sp_executesql @sql;
GO

-- Static PIVOT
WITH PivotData AS
(
SELECT custid, YEAR(orderdate) AS orderyear, qty
FROM dbo.Orders
)
SELECT custid, [2002], [2003], [2004]
FROM PivotData
PIVOT(SUM(qty) FOR orderyear IN([2002],[2003],[2004])) AS P;


