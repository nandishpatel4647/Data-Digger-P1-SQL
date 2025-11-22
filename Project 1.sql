CREATE DATABASE datadigger;

CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY ,
    Cname VARCHAR(100) NOT NULL,
    Email VARCHAR(100)  NOT NULL,
    Address VARCHAR(200) NOT NULL
);

INSERT INTO Customers (CustomerID, Cname, Email, Address) VALUES
(101, 'Krina Suthar', 'ksuthar101@gmail.com', '11 Maninagar, Ahmedabad'),
(102, 'ALice Thakkar', 'ithakkar22@gmail.com', '70 flats Adajan, Surat'),
(103, 'Amit Patel', 'ap33@gmail.com', 'Race Course Circle, Vadodara'),
(104, 'Riya Patel', 'riya.patel@gmail.com', 'Karnavati SG Highway, Ahmedabad'),
(105, 'Vikas Gajjar', 'vsgajjar@gmail.com', 'Infocity, Gandhinagar');

SELECT * FROM Customers;

UPDATE Customers SET Address = 'New VIP Road, Vadodara' WHERE CustomerID = 103;

DELETE FROM Customers WHERE CustomerID = 105;

SELECT * FROM Customers WHERE Cname = 'Alice Thakkar';

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY, -- Assuming manual insertion of OrderID
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES (2001, 101, '2025-10-15', 5500.00), 
(2002, 102, '2025-11-01', 1250.50), 
(2003, 101, '2025-11-05', 899.00), 
(2004, 103, '2025-11-10', 250.00),
(2005, 104, '2025-11-11', 15000.00); 

SELECT * FROM Orders WHERE CustomerID = 101;

UPDATE Orders SET TotalAmount = 999.00 WHERE OrderID = 2003;

DELETE FROM Orders WHERE OrderID = 2004;

SELECT * FROM Orders WHERE OrderDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

SELECT MAX(TotalAmount) AS HighestOrder, MIN(TotalAmount) AS LowestOrder, AVG(TotalAmount) AS AverageOrder FROM Orders;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY, 
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL
);

INSERT INTO Products (ProductID, ProductName, Price, Stock) VALUES 
(3001, 'Mechanical Keyboard', 4999.00, 15),
(3002, 'Wireless Mouse', 850.00, 40),
(3003, 'USB-C Cable', 399.00, 100),
(3004, 'Webcam 1080p', 1899.00, 25),
(3005, 'Portable Speaker', 0.00, 0);

SELECT * FROM Products ORDER BY Price DESC;

SELECT * FROM Products WHERE Price BETWEEN 500 AND 2000;

UPDATE Products SET Price = 950.00 WHERE ProductID = 3002;

DELETE FROM Products WHERE Stock = 0;

SELECT MAX(Price) AS MostExpensivePrice, MIN(Price) AS CheapestPrice FROM Products;

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY, -- Assuming manual insertion
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    SubTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, SubTotal) VALUES
(4001, 2001, 3001, 1, 4999.00),
(4002, 2002, 3002, 2, 1700.00),
(4003, 2001, 3004, 1, 1899.00),
(4004, 2003, 3002, 1, 850.00),
(4005, 2005, 3001, 3, 14997.00);

SELECT * FROM OrderDetails WHERE OrderID = 2001;

SELECT SUM(SubTotal) AS TotalRevenue FROM OrderDetails;

SELECT t1.ProductID, t2.ProductName, 
SUM(t1.Quantity) AS TotalQuantitySold FROM OrderDetails
t1 JOIN Products t2 ON t1.ProductID = t2.ProductID 
GROUP BY t1.ProductID, t2.ProductName 
ORDER BY TotalQuantitySold DESC LIMIT 3;