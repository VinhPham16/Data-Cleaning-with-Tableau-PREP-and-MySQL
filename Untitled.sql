

with cte_rownum as
(
SELECT * ,
row_number() over (partition by ParcelID, LegalReference, SaleDate,SalePrice) as row_num
FROM covid_for_portfolio.Nashville_Housing
)
delete FROM cte_rownum
where row_num > 1;
