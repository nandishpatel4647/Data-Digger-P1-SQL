Data Digger – SQL Project
Project Objective

The project "Data Digger" provides hands-on experience in managing a structured relational MySQL database.
The goal is to understand and apply fundamental SQL operations such as CRUD, clauses like WHERE and ORDER BY, operators, aggregate functions (MAX, MIN, SUM), and database integrity using Primary and Foreign Keys.

Database Structure

The project uses four interrelated tables designed for an E-Commerce store:

Customers – Stores customer details.

Products – Stores product inventory, price, and stock details.

Orders – Records main order information, linked to specific customers via CustomerID.

OrderDetails – A linking table (many-to-many relationship) that records the quantity and subtotal of specific products (ProductID) within a specific order (OrderID).

Relationships

Customers → Orders: One-to-Many (via CustomerID)

Orders ↔ Products: Many-to-Many (via OrderDetails)

SQL Concepts Covered
1. Customers Table

Basic CRUD operations

Filtering using WHERE clause

Searching by name

Updating or deleting specific records

2. Products Table

Sorting data using ORDER BY (ascending or descending order)

Filtering by range using BETWEEN

Applying aggregate functions:

MAX(Price) – Highest product price

MIN(Price) – Lowest product price

3. Orders Table

Use of Foreign Keys (CustomerID relationship)

Working with date functions such as DATE_SUB

Performing advanced aggregations:

MAX, MIN, and AVG on total order amounts

4. OrderDetails Table

Handling relational data between Orders and Products

Calculating total revenue using SUM

Creating joins and grouping data for business insights such as:

Top 3 most sold products

Customers with the highest total purchase value
