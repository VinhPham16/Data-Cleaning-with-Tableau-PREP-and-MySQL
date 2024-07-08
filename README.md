Data is cleaned and shaped by Tableau PREP function like: Split, Group value, Calculated Field,...
Cause its hard to delete row that duplicated by Tableau PREP so this step has been done by MySQL:

WITH cte_rownum AS
(
SELECT * ,
ROW_NUMBER() OVER (PARTITION BY ParcelID, LegalReference, SaleDate,SalePrice) AS row_num
FROM covid_for_portfolio.Nashville_Housing
)
DELETE 
FROM cte_rownum
WHERE row_num > 1;
