USE DBMS;

-- 1. Total number of orders per buyer
SELECT b.UserID, b.UName, COUNT(o.OID) AS TotalOrders
FROM BUYER b
LEFT OUTER JOIN ORDERS o ON b.UserID = o.UserID
GROUP BY b.UserID, b.UName;

-- 2. Total amount spent by each buyer
SELECT b.UserID, b.UName, SUM(o.OTotal) AS TotalSpent
FROM BUYER b
NATURAL JOIN ORDERS o
GROUP BY b.UserID, b.UName;

-- 3. Most expensive product per brand
SELECT PBrand, MAX(PPrice) AS MaxPrice
FROM PRODUCT
GROUP BY PBrand;

-- 4. Products sold more than 2 times
SELECT p.PID, p.PName, SUM(c.Quantity) AS TotalSold
FROM PRODUCT p
JOIN CONTAINS c ON p.PID = c.PID
GROUP BY p.PID, p.PName
HAVING SUM(c.Quantity) > 2;

-- 5. Sellers and their product counts
SELECT s.UserID, s.UName, COUNT(p.PID) AS ProductCount
FROM (SELLER s
JOIN STORE st ON s.UserID = st.UserID)
JOIN PRODUCT p ON st.SID = p.SID
GROUP BY s.UserID, s.UName;

-- 6. Top 5 most purchased products
SELECT p.PID, p.PName, SUM(c.Quantity) AS PurchasedQty
FROM PRODUCT p
JOIN CONTAINS c ON p.PID = c.PID
GROUP BY p.PID, p.PName
ORDER BY PurchasedQty DESC
LIMIT 5;

-- 7. Out of stock products
SELECT PID, PName
FROM PRODUCT
WHERE PQuantity = 0;

-- 8. Revenue per product
SELECT p.PID, p.PName, SUM(c.Quantity * p.PPrice) AS Revenue
FROM PRODUCT p
JOIN CONTAINS c ON p.PID = c.PID
GROUP BY p.PID, p.PName;

-- 9. Average order value per buyer
SELECT b.UserID, b.UName, AVG(o.OTotal) AS AvgOrderValue
FROM BUYER b
JOIN ORDERS o ON b.UserID = o.UserID
GROUP BY b.UserID, b.UName;

-- 10. Products in more than 3 orders
SELECT c.PID, p.PName, COUNT(DISTINCT c.OID) AS OrderCount
FROM CONTAINS c
JOIN PRODUCT p ON c.PID = p.PID
GROUP BY c.PID, p.PName
HAVING COUNT(DISTINCT c.OID) > 3;

-- 11. Orders with buyer and address
SELECT o.OID, b.UName, d.UAddress, o.OTotal
FROM ORDERS o
JOIN BUYER b ON o.UserID = b.UserID
JOIN DELIVERY d ON o.AID = d.AID;

-- 12. Sellers without products
SELECT s.UserID, s.UName
FROM SELLER s
LEFT JOIN STORE st ON s.UserID = st.UserID
LEFT JOIN PRODUCT p ON st.SID = p.SID
WHERE p.PID IS NULL;

-- 13. Recent Orders and Buyers
SELECT o.OID, o.ODate, b.UName
FROM ORDERS o
JOIN BUYER b ON o.UserID = b.UserID
ORDER BY o.ODate DESC;

-- 14. Orders placed each month
SELECT DATE_FORMAT(ODate, '%Y-%m') AS Month, COUNT(OID) AS OrderCount
FROM ORDERS
GROUP BY DATE_FORMAT(ODate, '%Y-%m');

-- 15. Revenue by Each Store
SELECT s.SID, s.SName, SUM(p.PPrice * c.Quantity) AS Revenue
FROM STORE s
JOIN PRODUCT p ON s.SID = p.SID
JOIN CONTAINS c ON p.PID = c.PID
GROUP BY s.SID, s.SName;

-- 16. Products above average price
SELECT PID, PName, PPrice
FROM PRODUCT
WHERE PPrice > (SELECT AVG(PPrice) FROM PRODUCT);

-- 17. Payment methods used and count
SELECT CardNo, COUNT(*) AS TimesUsed
FROM PAYMENTDETAILS
GROUP BY CardNo;

-- 18. Count of Deliveries to Cities
SELECT UCity, COUNT(*) AS DeliveryCount
FROM DELIVERY
GROUP BY UCity
ORDER BY DeliveryCount DESC;

-- 19. Quantity of items per order
SELECT OID, SUM(Quantity) AS TotalItems
FROM CONTAINS
GROUP BY OID 
ORDER BY TotalItems DESC;

-- 20. Value of Items in Buyer's Cart
SELECT b.UserID, b.UName, SUM(p.PPrice * c.Quantity) AS CartValue
FROM BUYER b
JOIN CART c ON b.UserID = c.UserID
JOIN PRODUCT p ON c.PID = p.PID
GROUP BY b.UserID, b.UName;