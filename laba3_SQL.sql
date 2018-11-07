 
CREATE TABLE SalesLT.ProductTMP_10   (
    ProductID int IDENTITY(1,1) NOT NULL,
    Name nvarchar(255) NOT NULL,
    ProductNumber nvarchar(25) NOT NULL,
    Color nvarchar(15) NULL,
    StandardCost money NOT NULL,
    ListPrice money NOT NULL,
    Size nvarchar(5) NULL,
    Weight decimal(8, 2) NULL,
    ProductCategoryID int NULL

);
 
INSERT INTO SalesLT.ProductTMP_10  
    SELECT ProductID, ProductNumber, Color, StandardCost,ListPrice,Size,Weight, ProductCategoryID
    ProductCategoryID  
    FROM SalesLT.Product;  
   
CREATE TABLE SalesLT.ColorTMP_10  (
    ColorID int IDENTITY(1,1) NOT NULL,
    Color nvarchar(25)  NULL,
)
INSERT INTO  SalesLT.ColorTMP_10  
    SELECT  Color
    ProductCategoryID  
    FROM SalesLT.Product;     
    WHERE Color is not null;
  
     
ALTER TABLE SalesLT.ProductTMP_10 ADD ColorID int 

UPDATE SalesLT.ProductTMP_10
    SET  SalesLT.ProductTMP_10.ColorID = SalesLT.ColorTMP_10.ColorID 
    FROM SalesLT.ColorTMP_10
    WHERE SalesLT.ProductTMP_10.Color is not null and SalesLT.ProductTMP_10.Color = SalesLT.ColorTMP_10.Color