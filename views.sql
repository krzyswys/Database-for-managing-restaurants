--Views

--Current menu view
CREATE VIEW Current_Menu_View AS
SELECT Products.ProductID ,Products.ProductName, ProductPrices.UnitPrice
FROM MenuDetails
         JOIN Products ON Products.ProductID = MenuDetails.ProductID
         JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
WHERE MenuID = (SELECT MenuID
                FROM Menu
                WHERE ToTime IS NULL)
AND ProductPrices.ToTime IS NULL