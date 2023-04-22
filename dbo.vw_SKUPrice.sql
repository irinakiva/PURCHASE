CREATE VIEW vw_price AS
SELECT ID, code, name, dbo.GetSKUPrice(ID) AS price 
FROM dbo.SKU;