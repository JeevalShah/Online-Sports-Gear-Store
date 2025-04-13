USE DBMS;

-- BUYER's TABLE
INSERT INTO BUYER (UserID, UName, UPhone, UEmail, UDOB) VALUES
(1, 'Jeeval Shah', '7738631246', 'jeeval.shah58@nmims.in', '2005-07-21'),
(2, 'Aarav Sharma', '8765432109', 'aaravsharma@gmail.com', '1992-06-20'),
(3, 'Priya Patel', '7654321098', 'priyapatel@gmail.com', '1989-12-10'),
(4, 'Ravi Desai', '7543210987', 'ravidesai@gmail.com', '1998-09-25'),
(5, 'Ananya Reddy', '7432109876', 'ananyareddy@gmail.com', '1996-04-30'),
(6, 'Arjun Kumar', '9321098765', 'arjunkumar@gmail.com', '1993-08-14'),
(7, 'Aisha Khan', '9210987654', 'aishakhan@gmail.com', '1987-11-27'),
(8, 'Vikram Singh', '9109876543', 'vikramsingh@gmail.com', '1999-05-08'),
(9, 'Neha Mehta', '9098765432', 'nehamehta@gmail.com', '2000-02-22'),
(10, 'Dev Joshi', '9087654321', 'devjoshi@gmail.com', '1985-07-11'),
(11, 'Radhika Iyer', '9987654321', 'radhikaiyer@gmail.com', '1994-03-15');

ALTER TABLE SELLER
DROP CONSTRAINT FK_SellerStore;

-- SELLER's TABLE
INSERT INTO SELLER (UserID, UName, UPhone, UEmail, UDOB, SType, SID) VALUES
(100, 'Ishaan Gupta', '8736542109', 'ishaangupta@gmail.com', '1972-01-20', 'GOLD', 200),
(101, 'Sneha Verma', '7643251098', 'snehaverma@gmail.com', '1979-02-10', 'SILVER', 201),
(102, 'Karan Rao', '9874326510', 'karanrao@gmail.com', '1988-03-25', 'DIAMOND', 202),
(103, 'Pooja Joshi', '9876321054', 'poojajoshi@gmail.com', '1976-04-30', 'BRONZE', 203),
(104, 'Rajesh Nair', '9438765210', 'rajeshnair@gmail.com', '1983-08-14', 'PLATINUM', 204),
(105, 'Amit Trivedi', '8765432198', 'amittrivedi@gmail.com', '1985-06-12', 'GOLD', 205),
(106, 'Meera Sharma', '7654321987', 'meerasharma@gmail.com', '1992-09-08', 'SILVER', 206),
(107, 'Rohan Mehta', '6543219876', 'rohanmehta@gmail.com', '1980-11-22', 'DIAMOND', 207),
(108, 'Divya Kapoor', '5432198765', 'divyakapoor@gmail.com', '1995-04-05', 'BRONZE', 208),
(109, 'Suresh Yadav', '4321987654', 'sureshyadav@gmail.com', '1978-07-30', 'PLATINUM', 209);

-- STORE's TABLE
INSERT INTO STORE (SID, SState, SCity, SStreet, SName, UserID) VALUES
(200, 'Maharashtra', 'Mumbai', '123 Snow Ave', 'European Winter Gear', 100),
(201, 'Uttar Pradesh', 'Lucknow', '456 Ice St', 'Nordic Sports Store', 101),
(202, 'Tamil Nadu', 'Chennai', '789 Blizzard Blvd', 'Alpine Traders', 102),
(203, 'Gujarat', 'Ahmedabad', '101 Glacier Rd', 'Everest Outfitters', 103),
(204, 'Rajasthan', 'Jaipur', '202 Arctic Lane', 'Polar Gear', 104),
(205, 'West Bengal', 'Kolkata', '303 Snowfall Rd', 'Ice Peak Gear', 105),
(206, 'Karnataka', 'Bangalore', '404 Frost St', 'Glacier Sports', 106),
(207, 'Delhi', 'New Delhi', '505 Polar Ln', 'North Pole Traders', 107),
(208, 'Punjab', 'Ludhiana', '606 Arctic Dr', 'Frozen Expedition', 108),
(209, 'Madhya Pradesh', 'Bhopal', '707 Blizzard Rd', 'Everest Extreme Wear', 109);

ALTER TABLE SELLER
ADD CONSTRAINT FK_SellerStore
FOREIGN KEY (SID) REFERENCES STORE(SID);

-- PRODUCT's TABLE
INSERT INTO PRODUCTS (PID, PDes, PPrice, PName, PBrand, PQuantity, PCat, SID) VALUES
(300, 'Waterproof ski jacket', 120.99, 'Ski Jacket', 'NorthFace', 20, 'Men', 200),
(301, 'Insulated snow boots', 89.50, 'Snow Boots', 'Columbia', 15, 'Women', 200),
(302, 'Thermal gloves', 25.75, 'Winter Gloves', 'The Heat Co.', 50, 'Accessories', 200),
(303, 'Ski Goggles with UV protection', 49.99, 'Ski Goggles', 'Oakley', 30, 'Accessories', 201),
(304, 'Snowboard', 299.99, 'All-Mountain Snowboard', 'Burton', 10, 'Highlights', 201),
(305, 'Woolen beanie hat', 18.49, 'Beanie Hat', 'Patagonia', 40, 'Accessories', 202),
(306, 'Winter hiking socks', 12.99, 'Thermal Socks', 'Smartwool', 60, 'Men', 202),
(307, 'Fleece-lined ski pants', 99.99, 'Ski Pants', 'Arc''teryx', 25, 'Women', 203),
(308, 'Heated hand warmers', 15.99, 'Hand Warmers', 'HotHands', 100, 'Accessories', 203),
(309, 'Winter backpack for skiing', 149.99, 'Ski Backpack', 'Osprey', 12, 'Highlights', 204),
(310, 'Snowboard helmet', 134.95, 'Helmet', 'Smith', 20, 'Accessories', 205),
(311, 'Ski poles', 45.99, 'Ski Poles', 'Leki', 35, 'Accessories', 205),
(312, 'Base layer thermal shirt', 35.99, 'Thermal Shirt', 'Under Armour', 45, 'Men', 206),
(313, 'Snowshoes for deep snow', 199.99, 'Snowshoes', 'MSR', 15, 'Highlights', 207),
(314, 'Gore-Tex winter gloves', 79.99, 'Gore-Tex Gloves', 'Black Diamond', 30, 'Accessories', 208);

-- CART's TABLE
INSERT INTO CART (UserID, PID, Quantity) VALUES
(1, 300, 1), 
(1, 302, 1), 
(1, 303, 1), 
(2, 301, 1), 
(2, 304, 2), 
(3, 305, 2),
(4, 306, 2), 
(5, 306, 3),
(4, 314, 3), 
(5, 309, 3), 
(6, 308, 1), 
(7, 309, 3), 
(8, 310, 2);

ALTER TABLE PAYMENTDETAILS
DROP CONSTRAINT Fk_PaymentOrders;

-- PAYMENTDETAIL's TABLE
INSERT INTO PAYMENTDETAILS (PayID, CardNo, CName, CExpiry, CCVV, OID) VALUES
(400, '1234567812345678', 'Jeeval Shah', '2026-09-01', '123', 500),
(401, '2345678923456789', 'Aarav Sharma', '2025-05-20', '452', 501),
(402, '3456789034567890', 'Priya Patel', '2024-12-15', '789', 502),
(403, '4567890145678901', 'Ravi Desai', '2026-07-10', '321', 503),
(404, '5678901256789012', 'Ananya Reddy', '2027-11-30', '654', 504),
(405, '6789012367890123', 'Arjun Kumar', '2025-08-22', '111', 505),
(406, '7890123478901234', 'Aisha Khan', '2026-02-14', '222', 506),
(407, '8901234589012345', 'Vikram Singh', '2025-06-30', '333', 507),
(408, '9012345690123456', 'Neha Mehta', '2027-09-12', '444', 508),
(409, '1234901234901234', 'Dev Joshi', '2026-10-01', '555', 509),
(410, '2345012345012345', 'Jeeval Shah', '2024-11-25', '666', 510),
(411, '3456123456123456', 'Aarav Sharma', '2026-07-19', '777', 511),
(412, '4567234567234567', 'Priya Patel', '2025-04-30', '888', 512),
(413, '5678345678345678', 'Ravi Desai', '2027-03-01', '999', 513),
(414, '6789456789456789', 'Ananya Reddy', '2024-12-20', '000', 514);

-- DELIVERY's TABLE
INSERT INTO DELIVERY (AID, UPin, UCity, UAddress, UserID) VALUES
(600, '400001', 'Mumbai', '101 Marine Drive', 1),  
(601, '110001', 'New Delhi', '55 Connaught Place', 2),  
(602, '560001', 'Bangalore', '77 MG Road', 3),  
(603, '700001', 'Kolkata', '22 Park Street', 4),  
(604, '600001', 'Chennai', '15 Anna Salai', 5),  
(605, '500001', 'Hyderabad', '9 Banjara Hills', 6),  
(606, '380001', 'Ahmedabad', '48 CG Road', 7),  
(607, '411001', 'Pune', '88 FC Road', 8),  
(608, '682001', 'Kochi', '12 Marine Drive', 9),  
(609, '695001', 'Thiruvananthapuram', '6 MG Road', 10),  
(610, '600028', 'Chennai', '42 Besant Nagar', 11),
(611, '500081', 'Hyderabad', '99 Hitech City', 11),
(612, '122001', 'Gurgaon', '10 Cyber Hub Road', 3),
(613, '144001', 'Jalandhar', '88 Model Town', 5),
(614, '302001', 'Jaipur', '25 Amer Road', 7),
(615, '751001', 'Bhubaneswar', '5 KIIT Square', 9),
(616, '180001', 'Jammu', '19 Raghunath Bazaar', 10);

-- ORDER's TABLE
INSERT INTO ORDERS (OID, ODate, OStatus, OTotal, AID, UserID, PayID) VALUES
(500, '2025-03-10', 'Shipped', 146.74, 600, 1, 400),
(501, '2025-03-12', 'Delivered', 89.50, 601, 2, 401),
(502, '2025-03-15', 'Processing', 49.99, 602, 3, 402),
(503, '2025-03-17', 'Shipped', 99.99, 603, 4, 403),
(504, '2025-03-19', 'Delivered', 149.99, 604, 5, 404),
(505, '2025-04-20', 'Processing', 199.99, 605, 6, 405),
(506, '2025-03-22', 'Cancelled', 79.49, 606, 7, 406),
(507, '2025-04-25', 'Shipped', 129.99, 607, 8, 407),
(508, '2025-04-27', 'Delivered', 219.49, 608, 9, 408),
(509, '2025-04-30', 'Processing', 59.99, 609, 10, 409),
(510, '2025-03-02', 'Shipped', 174.99, 600, 1, 410),
(511, '2025-03-05', 'Delivered', 94.99, 601, 2, 411),
(512, '2025-03-07', 'Processing', 134.99, 612, 3, 412),
(513, '2025-03-10', 'Shipped', 169.99, 603, 4, 413),
(514, '2025-03-12', 'Delivered', 199.99, 613, 5, 414);

ALTER TABLE PAYMENTDETAILS
ADD CONSTRAINT FK_PaymentOrders
FOREIGN KEY (OID) REFERENCES ORDERS(OID);

-- CONTAINS' TABLE
INSERT INTO CONTAINS (OID, PID, Quantity) VALUES
(500, 300, 1),
(500, 302, 1),
(501, 301, 1),
(502, 303, 1),
(503, 307, 1),
(504, 309, 1),
(505, 300, 1),
(505, 314, 1),
(506, 302, 3),
(507, 311, 2),
(507, 312, 1),
(508, 300, 2),
(509, 306, 1),
(509, 311, 1),
(510, 313, 1),
(511, 307, 1),
(512, 310, 1),
(513, 314, 2),
(513, 306, 1),
(514, 300, 1),
(514, 301, 1);

-- MESSAGE's TABLE
INSERT INTO MESSAGE (MID, Message, UserID, MDate) VALUES
(1, 'Need Help With the Order', 1, '2025-04-10 00:26:19'),
(2, 'Order Delayed, need help!', 2, '2025-04-10 00:29:08'),
(3, 'Hey! Are you dropping the new Nike\'s soon?', 3, '2025-04-10 00:29:30'),
(4, 'You guys are awesome!', 4, '2025-04-10 15:01:12');

-- FEEDBACK Table
INSERT INTO FEEDBACK (FID, COMMENT, RATING, UserID) VALUES
(1, 'Absolutely love my new snowboard! The quality is too good!', 4.5, 1),
(2, 'Decent quality, but the sizing was a bit off. Had issues with customer support!', 3.5, 2),
(3, 'Not the best experience. My order was delayed, and no response from your end.', 2.5, 3),
(4, 'The gear is good, but the packaging was slightly damaged.', 3.5, 4),
(5, 'Bought a ski jacket from here, and it kept me warm through some cold, cold nights', 4.5, 5),
(6, 'This store never disappoints! I’ve been shopping here since the last 15 years!!!', 4.5, 6),
(7, 'Best Experience ever!', 5, 7),
(8, 'This website is awesome!!', 5, 8),
(11, 'Best Store Ever!', 5, 11),
(12, 'Hello Everyone!', 4, 9);
