CREATE TRIGGER Busket_insert_update ON dbo.Basket
AFTER INSERT
AS
 
SET NOCOUNT ON;
 
UPDATE dbo.Basket
SET 
DiscountValue =  CASE
WHEN num >= 2 THEN 0.05 * Value
ELSE 0
END
FROM (SELECT ID, COUNT(*) OVER (partition BY ID_SKU) as num FROM INSERTED) temp 
JOIN dbo.Basket ON temp.ID = dbo.Basket.ID;