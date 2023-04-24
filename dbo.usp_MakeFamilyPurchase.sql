IF OBJECT_ID('dbo.MakeFamilyPurchase','P') IS NOT NULL DROP PROC dbo.MakeFamilyPurchase;
GO;
CREATE PROC dbo.MakeFamilyPurchase
@FamilySurName varchar(255)
 
AS
 
SET NOCOUNT ON;
 
IF EXISTS(SELECT SurName FROM dbo.Family WHERE SurName = @FamilySurName)
 
UPDATE dbo.Family 
SET
Family.BudgetValue -=  temp.sum_value
 
FROM 
(SELECT sum(B.Value) AS sum_value FROM
dbo.Family  As F JOIN dbo.Basket  AS B
ON F.ID = B.ID_Family
WHERE F.SurName = @FamilySurName) temp
WHERE Family.Surname  = @FamilySurName
 
ELSE
PRINT 'SurName ' + @FamilySurName + ' does not exist';
GO;