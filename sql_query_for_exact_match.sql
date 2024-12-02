MERGE target_table USING source_table
ON merge_condition
WHEN MATCHED
    THEN update_statement
WHEN NOT MATCHED
    THEN insert_statement
WHEN NOT MATCHED BY SOURCE
    THEN DELETE;
	
	
MERGE sales.category t 
    USING sales.category_staging s
ON (s.category_id = t.category_id)
WHEN MATCHED
    THEN UPDATE SET 
        t.category_name = s.category_name,
        t.amount = s.amount
WHEN NOT MATCHED BY TARGET 
    THEN INSERT (category_id, category_name, amount)
         VALUES (s.category_id, s.category_name, s.amount)
WHEN NOT MATCHED BY SOURCE 
    THEN DELETE;
	
	
select count(*),t.name,t.zip,t.phone,t.website from Company t 
group by t.name,t.zip,t.phone,t.website
having count(*) > 1

order by count(*) desc




select TOP (100) 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') as new_name_from_googleraw,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') as new_name_from_uvalde,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') as new_address_from_googleraw,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') as new_address_from_uvalde,
t.phone as googleraw_phone,
u.Phone as uvalde_phone,
t.website as googleraw_website,
u.Website as uvalde_website


 from [Googleraw] t , [UVALDE78801] u
 
where (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','')
and REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.Address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','')) 
or (
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') and ltrim(rtrim(t.zipcode)) = ltrim(rtrim(u.Zip))
)





MERGE Uvalde78801 t 
    USING Googleraw u
on ((REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','')
and REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.Address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','')) 
or (
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') and ltrim(rtrim(t.zip)) = ltrim(rtrim(u.zipcode))
))
WHEN MATCHED
    THEN UPDATE SET 
        t.phone = u.phone,
        t.website = u.website ;
		
		

-- Step 1: Remove special characters and spaces from the columns
WITH CleanedTable1 AS (
    SELECT 
        ID,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(name, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column1,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(address, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column2,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(zip, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column3
    FROM Uvalde78801
),
CleanedTable2 AS (
    SELECT 
        ID,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(name, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column1,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(address, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column2,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(zipcode, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column3
    FROM Googleraw
)

-- Step 2: Perform matching based on the cleaned columns
SELECT t1.*, t2.*
FROM CleanedTable1 t1
INNER JOIN CleanedTable2 t2 ON t1.Cleaned_Column1 = t2.Cleaned_Column1
                            AND t1.Cleaned_Column2 = t2.Cleaned_Column2
                            AND t1.Cleaned_Column3 = t2.Cleaned_Column3;



-- Step 1: Remove special characters and spaces from the columns
WITH CleanedTable1 AS (
    SELECT 
        ID,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(name, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column1,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(address, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column2,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(zip, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column3
    FROM Uvalde78801
),
CleanedTable2 AS (
    SELECT 
        ID,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(name, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column1,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(address, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column2,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(zipcode, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column3
    FROM Googleraw
)

-- Step 2: Perform matching based on the cleaned columns
SELECT t1.*, t2.*
FROM CleanedTable1 t1
INNER JOIN CleanedTable2 t2 ON ((t1.Cleaned_Column1 = t2.Cleaned_Column1 AND t1.Cleaned_Column2 = t2.Cleaned_Column2)
                               or (t1.Cleaned_Column1 = t2.Cleaned_Column1 AND t1.Cleaned_Column3 = t2.Cleaned_Column3)
                             );
							 


-- Update columns in Table1 when matched with Table2
UPDATE Table1
SET
    ColumnToUpdate1 = Table2.ColumnToUpdate1,
    ColumnToUpdate2 = Table2.ColumnToUpdate2
FROM Table1
INNER JOIN Table2 ON Table1.Common_Column = Table2.Common_Column; -- Assuming there's a common column for matching





2nd :

-- Update columns in Uvalde78801 when matched with Googleraw
WITH CleanedUvalde AS (
    SELECT 
        ID,
		phone,
		website,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(name, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column1,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(address, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column2,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(zip, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column3
    FROM Uvalde78801
),
CleanedGoogle AS (
    SELECT 
        ID,
		phone,
		website,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(name, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column1,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(address, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column2,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(zipcode, ' ', ''), ',', ''), '.', ''), ';', ''), ':', ''), '-', '') AS Cleaned_Column3
    FROM Googleraw
)

-- Update columns in Uvalde78801 when matched with Googleraw
UPDATE Uvalde78801
SET
    phone = g.phone,
    website = g.website
FROM CleanedUvalde u
INNER JOIN CleanedGoogle g ON ((u.Cleaned_Column1 = g.Cleaned_Column1 AND u.Cleaned_Column2 = g.Cleaned_Column2) or
                            ( u.Cleaned_Column1 = g.Cleaned_Column1
                            AND u.Cleaned_Column3 = g.Cleaned_Column3 ));





select 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') as new_name_from_googleraw,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') as new_name_from_uvalde,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') as new_address_from_googleraw,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') as new_address_from_uvalde,
t.phone as googleraw_phone,
u.Phone as uvalde_phone,
t.website as googleraw_website,
u.Website as uvalde_website
,t.*

 from [Googleraw] t , [UVALDE78801] u
 
where (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','')
and REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.Address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','')) 
or (
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') and ltrim(rtrim(t.zipcode)) = ltrim(rtrim(u.Zip))
)
--and (t.phone is not null or t.website is not null)
--and (u.Phone is null or u.Website is null)

order by t.name asc ;



--update 1:
MERGE Uvalde78801 t 
    USING Googleraw u
on ((REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','')
and REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.Address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','')))
WHEN MATCHED
    THEN UPDATE SET 
        t.phone = u.phone,
        t.website = u.website ;
---79 rows		

--update 1.1:
MERGE  Googleraw u
    USING Uvalde78801 t
on ((REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','')
and REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.Address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','')))
WHEN MATCHED
    THEN UPDATE SET 
        u.CompanyID = t.id ;
---79 rows	

		
		
--update 2:
		
update t
set t.phone = u.phone, t.website = u.website
from Uvalde78801 t
inner join Googleraw u on 
((
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') and ltrim(rtrim(t.zip)) = ltrim(rtrim(u.zipcode))
))

---118 rows			
--update 2.1:
update u
set u.CompanyID = t.id
from Googleraw u
inner join Uvalde78801 t on 
((
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') and ltrim(rtrim(t.zip)) = ltrim(rtrim(u.zipcode))
))

---110 rows		


---checking query
select 
u.id,t.companyid,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') as new_name_from_googleraw,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') as new_name_from_uvalde,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') as new_address_from_googleraw,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') as new_address_from_uvalde,
t.phone as googleraw_phone,
u.Phone as uvalde_phone,
t.website as googleraw_website,
u.Website as uvalde_website
,t.*

 from 
 [UVALDE78801] u
 join
 [Googleraw] t 
 
on (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','')
and REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.Address))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','')) 
or (
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(t.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(ltrim(rtrim(upper(u.name))), '!', ''), '@', ''), '#', ''), '$', ''), '%', ''), '^', ''), '&', ''), '*', ''),'''',''),'-','' ),':',''),',','')
,'.','') and ltrim(rtrim(t.zipcode)) = ltrim(rtrim(u.Zip))
)

--and (t.phone is not null or t.website is not null)
--and (u.Phone is null or u.Website is null)

order by t.name asc
