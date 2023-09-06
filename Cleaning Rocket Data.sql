select *
from mission_launches
order by [Row ID]
-- remove the day of the week
select 
SUBSTRING(date, 5, LEN(date)) as date
from mission_launches

update mission_launches
set date = SUBSTRING(date, 5, LEN(date))

--remove UTC when applicable
select case
when date like '%UTC' then REPLACE(date, SUBSTRING(date,19,len(date)), '')
else Date
end
from mission_launches

update mission_launches
set date = case 
when date like '%UTC' then REPLACE(date, SUBSTRING(date,19,len(date)), '')
else Date
end
-- take out the comma
select date, REPLACE(date, SUBSTRING(date,7,1), '')
from mission_launches

update mission_launches
set date = REPLACE(date, SUBSTRING(date,7,1), '')

--Change MMM to MM

select case
when date like 'Aug%' then REPLACE(date, SUBSTRING(date, 1,3), '08')
when date like 'Sep%' then REPLACE(date, SUBSTRING(date, 1,3), '09')
when date like 'Oct%' then REPLACE(date, SUBSTRING(date, 1,3), '10')
when date like 'Nov%' then REPLACE(date, SUBSTRING(date, 1,3), '11')
when date like 'Dec%' then REPLACE(date, SUBSTRING(date, 1,3), '12')
when date like 'Jan%' then REPLACE(date, SUBSTRING(date, 1,3), '01')
when date like 'Feb%' then REPLACE(date, SUBSTRING(date, 1,3), '02')
when date like 'Mar%' then REPLACE(date, SUBSTRING(date, 1,3), '03')
when date like 'Apr%' then REPLACE(date, SUBSTRING(date, 1,3), '04')
when date like 'May%' then REPLACE(date, SUBSTRING(date, 1,3), '05')
when date like 'Jun%' then REPLACE(date, SUBSTRING(date, 1,3), '06')
when date like 'Jul%' then REPLACE(date, SUBSTRING(date, 1,3), '07')
end
from mission_launches

update mission_launches
set date = case
when date like 'Aug%' then REPLACE(date, SUBSTRING(date, 1,3), '08')
when date like 'Sep%' then REPLACE(date, SUBSTRING(date, 1,3), '09')
when date like 'Oct%' then REPLACE(date, SUBSTRING(date, 1,3), '10')
when date like 'Nov%' then REPLACE(date, SUBSTRING(date, 1,3), '11')
when date like 'Dec%' then REPLACE(date, SUBSTRING(date, 1,3), '12')
when date like 'Jan%' then REPLACE(date, SUBSTRING(date, 1,3), '01')
when date like 'Feb%' then REPLACE(date, SUBSTRING(date, 1,3), '02')
when date like 'Mar%' then REPLACE(date, SUBSTRING(date, 1,3), '03')
when date like 'Apr%' then REPLACE(date, SUBSTRING(date, 1,3), '04')
when date like 'May%' then REPLACE(date, SUBSTRING(date, 1,3), '05')
when date like 'Jun%' then REPLACE(date, SUBSTRING(date, 1,3), '06')
when date like 'Jul%' then REPLACE(date, SUBSTRING(date, 1,3), '07')
end

--remove times when applicable. This is done since none of my analysis questions involve time and since some of the entries do not have a time. If I was curious about for example morning vs night launches 
--I would seperate the time into its own column

select case
when date like '%:%' then REPLACE(date, SUBSTRING(date,11,len(date)), '')
else Date
end
from mission_launches

update mission_launches
set date = case
when date like '%:%' then REPLACE(date, SUBSTRING(date,11,len(date)), '')
else Date
end

select TOP 10 CAST(date as DATE) as date
from mission_launches

-- add dashes so sql can convert

select case 
when date like '__ %' then REPLACE(date, SUBSTRING(date,3,1), '-')
else date
end
from mission_launches


update mission_launches
set date = case 
when date like '__ %' then REPLACE(date, SUBSTRING(date,3,1), '-')
else date
end

--Finally convert it to Date type

select CONVERT(date, date,101)
from mission_launches

update mission_launches
set date = CONVERT(date, date,101)


select DISTINCT Organisation
from mission_launches

--found a typo for the French Air and Space Force that needs correcting

select Distinct case
when Organisation like 'ARM%' then 'Armee de l''Air'
else Organisation
end
from mission_launches

update mission_launches
set Organisation = case
when Organisation like 'ARM%' then 'Armee de l''Air'
else Organisation
end