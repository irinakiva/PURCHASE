CREATE FUNCTION dbo.GetSKUPrice (@ID_SKU AS INT)
RETURNS DECIMAL(18,2)
 
AS
 
BEGIN
RETURN
 
(SELECT   sum(Value) / sum(Quantity)
FROM dbo.Basket
WHERE ID_SKU = @ID_SKU)
 
END;