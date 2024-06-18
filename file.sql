CREATE TABLE CUSTOMER (
    CustomerID NUMBER(10) PRIMARY KEY,
    CustomerName VARCHAR2(50),
    CustomerAddress VARCHAR2(100),
    CustomerPhone VARCHAR2(20)
);

CREATE TABLE PRODUCT (
    ProductID NUMBER(10) PRIMARY KEY,
    ProductName VARCHAR2(50),
    ProductPrice NUMBER(10, 2),
    ProductStock NUMBER(10),
    CONSTRAINT CHK_ProductPrice CHECK (ProductPrice >= 0),
    CONSTRAINT CHK_ProductStock CHECK (ProductStock >= 0)
);

CREATE TABLE ORDERS (
    OrderID NUMBER(10) PRIMARY KEY,
    CustomerID NUMBER(10),
    ProductID NUMBER(10),
    OrderQuantity NUMBER(10),
    OrderTotal NUMBER(10, 2),
    CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    CONSTRAINT FK_ProductID FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID),
    CONSTRAINT CHK_OrderQuantity CHECK (OrderQuantity >= 0),
    CONSTRAINT CHK_OrderTotal CHECK (OrderTotal >= 0)
);

-- adding a specific column 
ALTER TABLE PRODUCT ADD Category VARCHAR2(20);

ALTER TABLE ORDERS ADD OrderDate DATE DEFAULT SYSDATE;