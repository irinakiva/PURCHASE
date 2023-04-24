IF OBJECT_ID('vw_price') IS NOT NULL DROP VIEW vw_price;
CREATE VIEW vw_price AS
SELECT ID, code, name, dbo.GetSKUPrice(ID) AS price 
FROM dbo.SKU;