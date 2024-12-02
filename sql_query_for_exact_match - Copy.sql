
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



 select t.name , difference(soundex(t.name), 
  soundex('Southwest Texas Veterinary'))
  from googleraw t
  where t.name like ('Southwest Texas Veterinary%'')
