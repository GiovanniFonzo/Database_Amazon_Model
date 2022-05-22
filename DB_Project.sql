-- CA Database Project
-- Name: Giovanni Fonzo

-- Module: Database Systems CMPU2006: 2020-21
-- Year: 2020/2021 
-- Course: DT249 - Stage 2


-- Create tables in database

CREATE TABLE Address
  (
    Address_ID INT 
               Not Null
               PRIMARY KEY,
    Street  VARCHAR(40) NOT NULL,
    City   VARCHAR(20) NOT NULL,
    State 	Varchar(20) NOT NULL,
    Pincode VARCHAR(10) NOT NULL
  );

CREATE TABLE Customer
  (
    Customer_ID INT 
               Not Null
               PRIMARY KEY,
    First_Name  VARCHAR(40) NOT NULL,
    Last_Name   VARCHAR(40) NOT NULL,
    Gender 	Varchar(10) NOT NULL,
    Contact_No VARCHAR(15) NOT NULL,
    Address_ID INT NOT NULL,
    CONSTRAINT fk1_customer FOREIGN KEY( Address_ID )
      REFERENCES Address( Address_ID ) 
      ON DELETE CASCADE
  );
  
  CREATE TABLE Cateogory
  (
    Category_ID INT 
               Not Null
               PRIMARY KEY,
    Category_Name  VARCHAR(40) NOT NULL
  );
  
  CREATE TABLE Product
  (
    Product_ID INT 
               Not Null
               PRIMARY KEY,
    Product_Name  VARCHAR(40) NOT NULL,
    Product_Image   VARCHAR(40) NOT NULL,
    Product_Desc 	Varchar(100) NOT NULL,
    Product_Price INT NOT NULL,
    Discount_Rate INT NOT NULL,
    Category_ID INT NOT NULL,
    CONSTRAINT fk1_product FOREIGN KEY( Category_ID )
      REFERENCES Cateogory( Category_ID ) 
      ON DELETE CASCADE
  );
  
  CREATE TABLE Product_Extra
  (
    Product_ID INT 
               Not Null,
    Size  VARCHAR(10) NOT NULL,
    Color   VARCHAR(40) NOT NULL,
    Quantity 	INT NOT NULL,
    CONSTRAINT fk1_extra FOREIGN KEY( Product_ID )
      REFERENCES Product( Product_ID ) 
      ON DELETE CASCADE
  );
  
  CREATE TABLE Cart
  (
    Cart_ID INT 
               Not Null
               PRIMARY KEY,
    Cart_Created  VARCHAR(20) NOT NULL,
    Customer_ID   INT NOT NULL,
    CONSTRAINT fk1_cart FOREIGN KEY( Customer_ID )
      REFERENCES Customer( Customer_ID ) 
      ON DELETE CASCADE
  );
  
  CREATE TABLE Cart_Item
  (
    Cart_ID INT 
               Not Null,
    Product_ID  INT NOT NULL,
    Cart_Quantity   INT NOT NULL,
    Cart_Price INT NOT NULL,
    CONSTRAINT fk1_cartitem FOREIGN KEY( Cart_ID )
      REFERENCES Cart( Cart_ID ) 
      ON DELETE CASCADE,
      CONSTRAINT fk2_cartitem FOREIGN KEY( Product_ID )
      REFERENCES Product( Product_ID ) 
      ON DELETE CASCADE
  );
  
  CREATE TABLE Orders
  (
    Order_ID INT 
               Not Null
               PRIMARY KEY,
    Customer_ID  INT NOT NULL,
    Cart_ID INT NOT NULL,
    Order_Date   DATE NOT NULL,
    Total_Price INT NOT NULL,
    Order_Status VARCHAR(15) NOT NULL,
    CONSTRAINT fk1_order FOREIGN KEY( Cart_ID )
      REFERENCES Cart( Cart_ID ) 
      ON DELETE CASCADE,
      CONSTRAINT fk2_order FOREIGN KEY( Customer_ID )
      REFERENCES Customer( Customer_ID ) 
      ON DELETE CASCADE
  );
  
  CREATE TABLE Payment
  (
    Payment_ID INT 
               Not Null
               PRIMARY KEY,
    Order_ID  INT NOT NULL,
    Payment_Date   DATE NOT NULL,
    Payment_Type VARCHAR(15) NOT NULL,
    Payment_Price INT NOT NULL,
    CONSTRAINT fk1_payment FOREIGN KEY( Order_ID )
      REFERENCES Orders( Order_ID ) 
      ON DELETE CASCADE
  );
  
-- Insert data into tables

insert into Address (Address_ID, Street, City, State, Pincode) values (1, '51611 Calypso Avenue', 'Elizabeth', 'New Jersey', '07208');
insert into Address (Address_ID, Street, City, State, Pincode) values (2, '3 Green Ridge Point', 'Phoenix', 'Arizona', '85067');
insert into Address (Address_ID, Street, City, State, Pincode) values (3, '2185 Thierer Avenue', 'Phoenix', 'Arizona', '85045');
insert into Address (Address_ID, Street, City, State, Pincode) values (4, '77644 Lien Terrace', 'Trenton', 'New Jersey', '08695');
insert into Address (Address_ID, Street, City, State, Pincode) values (5, '52581 Lien Crossing', 'Anniston', 'Alabama', '36205');
insert into Address (Address_ID, Street, City, State, Pincode) values (6, '39278 Drewry Way', 'Huntsville', 'Alabama', '35895');
insert into Address (Address_ID, Street, City, State, Pincode) values (7, '842 Pankratz Way', 'Birmingham', 'Alabama', '35220');
insert into Address (Address_ID, Street, City, State, Pincode) values (8, '0 Glendale Circle', 'Montgomery', 'Alabama', '36195');


insert into Customer (Customer_ID, First_Name, Last_Name, Gender, Contact_No, Address_ID) values (1, 'Vida', 'Slowgrove', 'Female', '879-791-2748', 1);
insert into Customer (Customer_ID, First_Name, Last_Name, Gender, Contact_No, Address_ID) values (2, 'Daffie', 'Juliff', 'Male', '698-967-6107', 2);
insert into Customer (Customer_ID, First_Name, Last_Name, Gender, Contact_No, Address_ID) values (3, 'Caroljean', 'Grinin', 'Female', '880-613-3927', 3);
insert into Customer (Customer_ID, First_Name, Last_Name, Gender, Contact_No, Address_ID) values (4, 'Gertrudis', 'De Zamudio', 'Male', '309-354-6963', 4);
insert into Customer (Customer_ID, First_Name, Last_Name, Gender, Contact_No, Address_ID) values (5, 'Lonni', 'Fried', 'Male', '532-647-5688', 5);
insert into Customer (Customer_ID, First_Name, Last_Name, Gender, Contact_No, Address_ID) values (6, 'Oriana', 'Pennacci', 'Female', '294-407-7498', 6);
insert into Customer (Customer_ID, First_Name, Last_Name, Gender, Contact_No, Address_ID) values (7, 'Rogerio', 'Budnik', 'Female', '503-123-7808', 7);
insert into Customer (Customer_ID, First_Name, Last_Name, Gender, Contact_No, Address_ID) values (8, 'Kacey', 'Glantz', 'Male', '174-315-0214', 8);

insert into Cateogory (Category_ID, Category_Name) values (1,'Shirts');
insert into Cateogory (Category_ID, Category_Name) values (2,'Jeans');
insert into Cateogory (Category_ID, Category_Name) values (3,'Tops');
insert into Cateogory (Category_ID, Category_Name) values (4,'Dresses');
insert into Cateogory (Category_ID, Category_Name) values (5,'Mobiles');
insert into Cateogory (Category_ID, Category_Name) values (6,'Kitchen Accessories');

insert into Product (Product_ID, Product_Name, Product_Image, Product_Desc, Product_Price, Discount_Rate, Category_ID) values (1, 'Long Tshirt', 'http://dummyimage.com/241x100.png', 'Appl ext fix-tib/fibula', 966, 61, 1);
insert into Product (Product_ID, Product_Name, Product_Image, Product_Desc, Product_Price, Discount_Rate, Category_ID) values (2, 'Flare Top', 'http://dummyimage.com/149x100.png', 'Suture peptic ulcer NOS', 613, 80, 2);
insert into Product (Product_ID, Product_Name, Product_Image, Product_Desc, Product_Price, Discount_Rate, Category_ID) values (3, 'Island Dress', 'http://dummyimage.com/101x100.png', 'Ambu cardiac monitoring', 639, 60, 2);
insert into Product (Product_ID, Product_Name, Product_Image, Product_Desc, Product_Price, Discount_Rate, Category_ID) values (4, 'Mom Jeans', 'http://dummyimage.com/107x100.png', 'Total elbow replacement', 13, 39, 4);
insert into Product (Product_ID, Product_Name, Product_Image, Product_Desc, Product_Price, Discount_Rate, Category_ID) values (5, 'Slim fit Jeans', 'http://dummyimage.com/176x100.png', 'Incision of aorta', 150, 27, 4);
insert into Product (Product_ID, Product_Name, Product_Image, Product_Desc, Product_Price, Discount_Rate, Category_ID) values (6, 'Tray', 'http://dummyimage.com/139x100.png', 'Local excis breast les', 438, 50, 6);
insert into Product (Product_ID, Product_Name, Product_Image, Product_Desc, Product_Price, Discount_Rate, Category_ID) values (7, 'Serving plate', 'http://dummyimage.com/209x100.png', 'Destr sm bowel les NEC', 782, 34, 6);
insert into Product (Product_ID, Product_Name, Product_Image, Product_Desc, Product_Price, Discount_Rate, Category_ID) values (8, 'Wine glasses', 'http://dummyimage.com/181x100.png', 'Amputation thru forearm', 656, 75, 6);


insert into product_extra (Product_ID, Size, Color, Quantity) values (1,'M,L,XL','White',10);
insert into product_extra (Product_ID, Size, Color, Quantity) values (1,'M,L,XL','Black',10);
insert into product_extra (Product_ID, Size, Color, Quantity) values (2,'M,L','Red',12);
insert into product_extra (Product_ID, Size, Color, Quantity) values (2,'L,XL','Blue',20);
insert into product_extra (Product_ID, Size, Color, Quantity) values (3,'M,XL','Black',25);
insert into product_extra (Product_ID, Size, Color, Quantity) values (3,'M,L,XL','Yellow',13);
insert into product_extra (Product_ID, Size, Color, Quantity) values (4,'M,L,XL','Green',8);
insert into product_extra (Product_ID, Size, Color, Quantity) values (5,'M,L,XL','Black',9);

insert into Cart (Cart_ID, Cart_Created, Customer_ID) values (1,'2018-09-07',1);
insert into Cart (Cart_ID, Cart_Created, Customer_ID) values (2,'2018-10-17',2);
insert into Cart (Cart_ID, Cart_Created, Customer_ID) values (3,'2019-12-10',3);
insert into Cart (Cart_ID, Cart_Created, Customer_ID) values (4,'2019-12-27',4);
insert into Cart (Cart_ID, Cart_Created, Customer_ID) values (5,'2020-09-21',5);
insert into Cart (Cart_ID, Cart_Created, Customer_ID) values (6,'2020-11-05',6);

insert into Cart_Item (Cart_ID, Product_ID, Cart_Quantity, Cart_Price) values (1,1,2,200);
insert into Cart_Item (Cart_ID, Product_ID, Cart_Quantity, Cart_Price) values (2,2,1,120);
insert into Cart_Item (Cart_ID, Product_ID, Cart_Quantity, Cart_Price) values (2,3,5,1000);
insert into Cart_Item (Cart_ID, Product_ID, Cart_Quantity, Cart_Price) values (3,1,3,350);
insert into Cart_Item (Cart_ID, Product_ID, Cart_Quantity, Cart_Price) values (4,4,3,850);
insert into Cart_Item (Cart_ID, Product_ID, Cart_Quantity, Cart_Price) values (5,5,4,660);

insert into Orders (Order_ID, Customer_ID, Cart_ID, Order_Date, Total_Price, Order_Status)
values (1,1,1,'2019-04-03',330,'Placed');
insert into Orders (Order_ID, Customer_ID, Cart_ID, Order_Date, Total_Price, Order_Status)
values (2,2,2,'2019-10-05',640,'Delivered');
insert into Orders (Order_ID, Customer_ID, Cart_ID, Order_Date, Total_Price, Order_Status)
values (3,2,2,'2019-05-13',500,'Placed');
insert into Orders (Order_ID, Customer_ID, Cart_ID, Order_Date, Total_Price, Order_Status)
values (4,3,3,'2020-06-02',630,'Delivered');
insert into Orders (Order_ID, Customer_ID, Cart_ID, Order_Date, Total_Price, Order_Status)
values (5,4,4,'2020-07-13',1030,'In process');

insert into payment (Payment_ID, Order_ID, Payment_Date, Payment_Type, Payment_Price)
values (1,1,'2019-04-03','Credit',330);
insert into payment (Payment_ID, Order_ID, Payment_Date, Payment_Type, Payment_Price)
values (2,2,'2019-10-05','Credit',640);
insert into payment (Payment_ID, Order_ID, Payment_Date, Payment_Type, Payment_Price)
values (3,2,'2019-05-13','Cash',500);
insert into payment (Payment_ID, Order_ID, Payment_Date, Payment_Type, Payment_Price)
values (4,3,'2020-06-02','Bank',630);
insert into payment (Payment_ID, Order_ID, Payment_Date, Payment_Type, Payment_Price)
values (5,4,'2020-07-13','Cash',1030);

-- SQL Query
-- Query is designed to find the XL size products available in database
SELECT distinct product.* FROM product_extra join product on product.Product_ID=product_extra.Product_ID
where product_extra.Size like '%XL%';

-- Query is designed to check all delivered order in database
SELECT customer.First_Name,customer.Last_Name,orders.Order_Date,orders.Total_Price
FROM orders join customer on customer.Customer_ID=orders.Customer_ID
where orders.Order_Status='Delivered';

-- Query is designed to check the products who has shirt as a category
select product.* from product join cateogory on cateogory.Category_ID=product.Category_ID 
where cateogory.Category_Name='Shirts';

-- View is created to find the total amount paid for all orders by each customers.
CREATE VIEW TOTAL_ORDER AS
SELECT customer.First_Name,customer.Last_Name,sum(orders.Total_Price) as 'Total amount'
FROM orders join customer on customer.Customer_ID=orders.Customer_ID
group by customer.Customer_ID;

-- View is created to find the number of products available in each cart.
CREATE VIEW TOTAL_CART_PRODUCT AS
SELECT Cart_ID,count(Cart_ID) as 'Total product' from cart_item group by Cart_ID;

