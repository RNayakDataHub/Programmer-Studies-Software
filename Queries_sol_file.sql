--import flat files of programmer and studies table into a database of your name selection, then create software table and insert the values given below
-- You can remove comment lines ('--' and '/* and */')
-- After all done start querying the tasks

--CREATE TABLE Software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)
/*
INSERT INTO Software (PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD) Values
 ('MARY','README','CPP',300, 1200, 84),
 ('ANAND','PARACHUTES','BASIC',399.95, 6000, 43),
 ('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9),
 ('JULIANA','INVENTORY','COBOL',3000, 3500, 0),
 ('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
 ( 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4),
 ('MARY','CODE GENERATOR','C',4500, 20000, 23 ),
 ('PATTRICK','README','CPP',300, 1200, 84),
 ('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11),
 ('QADIR','VACCINES','C',1900, 3100, 21 ),
 ('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 ),
 ('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
 ('REMITHA','PC UTILITIES','C',725, 5000, 51),
 ('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
 ('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
 ('VIJAYA','TSR EDITOR','C',900, 700, 6)
*/


select top 3 * from Programmer
select top 3 * from Studies
select top 3 * from Software

--Problem Statement:
-- Complete the below tasks using the Table – STUDIES, SOFTWARE and PROGRAMMER
-- Tasks To Be Performed:
-- 1. Find out the selling cost average for packages developed in Pascal.
select avg(scost) AVG_SCOST from software
where developin='Pascal'

--2. Display the names and ages of all programmers.
select pname, datediff(year,dob,'2025-2-4') as age from programmer

--3. Display the names of those who have done the DAP Course.
select pname, course from studies where course='DAP'

--4. Display the names and date of birth of all programmers born in January.
select pname, dob from programmer where month(dob)=1

--5. What is the highest number of copies sold by a package?
select max(SOLD) as Highest_no_copies_Sold from software

--6. Display lowest course fee.
select min(course_fee) Lowest_course_Fees from studies

--7. How many programmers have done the PGDCA Course?
select count(distinct pname) as PGDCA_Count from studies where course='PGDCA'

--8. How much revenue has been earned through sales of packages developed in C?
select sum(scost * sold) as Total_Revenue from software where developin='c'

--9. Display the details of the software developed by Ramesh.
select * from software where pname='Ramesh'

--10. How many programmers studied at Sabhari?
select count(pname) as No_Sabhari from studies where institute='sabhari'

--11. Display details of packages whose sales crossed the 2000 mark.
select * from software where (scost*sold) > 2000 

--12. Display the details of packages for which development costs have been recovered.
select * from software where (scost*sold) > dcost

--13. What is the cost of the costliest software development in Basic?
select max(scost+dcost) Costliest_software_cost from software

--14. How many packages have been developed in dBase?
select count(developin) no_of_DBASE from software where developin='dbase'

--15. How many programmers studied in Pragathi?
select count(Pname) as Pragati_Programmers from studies where institute='Pragathi'

--16. How many programmers paid 5000 to 10000 for their course?
select count(pname) as Count_Programmers from studies where course_fee between 4999 and 10000

--17. What is the average course fee?
select avg(course_fee) as Average_Course_Fee from studies

--18. Display the details of the programmers knowing C.
select * from programmer where prof1='c' or prof2='c'

--19. How many programmers know either COBOL or Pascal?
select count(PNAME) as no_of_programmers from programmer where (prof1='cobol' or prof1='pascal') or (prof2='cobol' or prof2='pascal')

--20. How many programmers don’t know Pascal and C?
select count(PNAME) as count from Programmer where (PROF1<>'Cobol' and PROF1<>'pascal') and
PROF2<>'Cobol' and PROF2<>'pascal'

--21. How old is the oldest male programmer?
select * from programmer
select top 1 datediff(year,dob,'2025-2-4') as age from programmer
where gender='m'
order by age desc  -- should paste datediff(year,dob,'2025-2-4') in place of age in order by line to have accurate results sometimes it might not recognize the aggregation alias

--22. What is the average age of female programmers?
select avg(datediff(year,dob,'2025-2-4')) as avg_f_age from programmer
where gender='f'

--23. Calculate the experience in years for each programmer and display with their names in descending order.
select Pname, datediff(year,doj,'2025-2-4') as Experience from programmer

--24. Who are the programmers who celebrate their birthdays during the current month?
select Pname from programmer
where month(dob)=4

--25. How many female programmers are there?
select count(pname) as no_of_f from programmer
where gender='f'  --use distinct function with count if you feel in any column rows value will be repeated, count(distinct column_name)

--26. What are the languages studied by male programmers?
select prof1, prof2 from programmer where gender ='m'

--27. What is the average salary?
select avg(salary) avg_salary from programmer


--28. How many people draw a salary between 2000 to 4000?
select count(pname) as no_people from programmer where salary between 2000 and 4000

--29. Display the details of those who don’t know Clipper, COBOL or Pascal.
select * from programmer where (prof1<>'clipper' and prof2<>'clipper') and (prof1<>'cobol' and prof2<>'cobol') and (prof1<>'pascal' and prof2<>'pascal')

--30. Display the cost of packages developed by each programmer.
select pname,developin, dcost from software

--31. Display the sales value of the packages developed by each programmer.
select Pname, (SCOST*SOLD) as sales_value from Software

--32. Display the number of packages sold by each programmer.
select pname, sum(sold) total_packages from software
group by pname

--33. Display the sales cost of the packages developed by each programmer language wise.
select pname, developin, scost from software
group by pname,developin, scost

--34. Display each language name with the average development cost, average selling cost and average price per copy.
select developin, 
avg(dcost) average_development_cost, 
avg(scost) average_selling_cost, 
avg(scost+dcost) average_price 
from software
group by developin

--35. Display each programmer’s name and the costliest and cheapest packages developed by him or her.
select pname, max(scost+dcost) costliest, min(scost+dcost) cheapest from software
group by pname

--36. Display each institute’s name with the number of courses and the average cost per course.
select institute, count(course) no_of_courses, avg(course_fee) avg_fee from studies
group by institute

--37. Display each institute’s name with the number of students.
select institute, count(pname) no_of_students from studies
group by institute

--38. Display names of male and female programmers along with their gender.
select pname, gender from programmer

--39. Display the name of programmers and their packages.
select pname, title from software
group by pname, title

--40. Display the number of packages in each language except C and C++.
select developin, (sold) as no_packages from software
where developin<>'c' and developin<>'cpp'
-- wasn't quite sure what number of packages mean here so i derived it with sold numbers and number titles developed with them as well. if you find correct one please do let me know
select developin, count(title) as no_packages from software
where developin<>'c' and developin<>'cpp'
group by developin

--41. Display the number of packages in each language for which development cost is less than 1000.
select developin, count(title) no_packages from software
where dcost<1000
group by developin
--again not sure what number of packages denote, take help from chat gpt if requires

--42. Display the average difference between SCOST and DCOST for each package.
select title, avg(dcost-scost) as avg_difference from software
group by title

--43. Display the total SCOST, DCOST and the amount to be recovered for each programmer whose cost has not yet been recovered.
select pname, scost, dcost, ((dcost+scost)-(scost*sold)) as Amount_to_recover from software
where (dcost+scost)>=(scost*sold)


--44. Display the highest, lowest and average salaries for those earning more than 2000.
select max(salary) Highest, min(salary) lowest, avg(salary)avg_salary from programmer
where salary>2000

--45. Who is the highest paid C programmer?
select top 1 pname from programmer 
order by salary desc
select * from programmer

--46. Who is the highest paid female COBOL programmer?
select top 1 pname from programmer where (prof1='cobol' or prof2='cobol') and gender='f' 
order by salary desc

--47. Display the names of the highest paid programmers for each language.
select top 1 pname from programmer 
group by prof1, prof2
order by salary desc 


--48. Who is the least experienced programmer?
select top 1 pname, datediff(year,doj,'2025-4-3') as experience from programmer
order by experience asc

--49. Who is the most experienced male programmer knowing PASCAL?
select top 1 pname, datediff(year,doj,'2025-4-3') as experience from programmer
where gender='m' and ('pascal' in (prof1,prof2))
order by experience desc

--50. Which language is known by only one programmer?
select language from(select prof1 as language from programmer
union all select prof2 from programmer) as all_languages
group by language
having count(*)=1
select * from programmer

--51. Who is the above programmer referred in 50?
SELECT PNAME  
FROM programmer  
WHERE PROF1 IN (  
    SELECT language
    FROM (
        SELECT PROF1 AS language FROM programmer
        UNION ALL
        SELECT PROF2 FROM programmer
    ) AS all_languages
    GROUP BY language
    HAVING COUNT(*) = 1
)  
OR PROF2 IN (  
    SELECT language
    FROM (
        SELECT PROF1 AS language FROM programmer
        UNION ALL
        SELECT PROF2 FROM programmer
    ) AS all_languages
    GROUP BY language
    HAVING COUNT(*) = 1
);

--52. Who is the youngest programmer knowing dBase?
select top 1 pname, datediff(year,dob,'2025-4-3') as age from programmer
where ('dbase' in (prof1,prof2))
order by age asc
 
--53. Which female programmer earning more than 3000 does not know C, C++, Oracle or dBase?
select pname from programmer where gender='f'
and prof1 not in ('c','cpp','oracle','dbase')
and prof2 not in ('c','cpp','oracle','dbase')
and salary>3000

--54. Which institute has the most number of students?
select top 1 institute, (count(pname)) as no_stud from studies
group by institute
order by no_stud desc

--55. What is the costliest course?
select max(course_fee) as fee from studies

--56. Which course has been done by the most number of students?
select top 1 course,count(pname) as no_of_students from studies
group by course
order by no_of_students desc

--57. Which institute conducts the costliest course?
select top 1 institute from studies
order by course_fee desc

--58. Display the name of the institute and the course which has below average course fee.
select institute, course from studies
where course_fee<(select avg(course_fee) from studies)

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the average fee.
select course from studies
where course_fee<((select avg(course_fee) from studies)+1000)
and course_fee>((select avg(course_fee) from studies)-1000)


--60. Which package has the highest development cost?
select top 1 title from software
order by dcost desc

--61. Which course has below average number of students?
select course from studies 
group by course
having cast(count(pname) as float) < (select avg(student_count) from (select count(pname) student_count from studies group by course) as subquery)

WITH course_counts AS (
    SELECT course, COUNT(pname) AS student_count
    FROM studies
    GROUP BY course
),
avg_count AS (
    SELECT AVG(CAST(student_count AS FLOAT)) AS avg_students
    FROM course_counts
)
SELECT course
FROM course_counts, avg_count
WHERE course_counts.student_count < avg_count.avg_students;

--62. Which package has the lowest selling cost?
select top 1 title from software
order by scost asc

--63. Who developed the package that has sold the least number of copies?
select top 1 pname from software 
order by sold asc

--64. Which language has been used to develop the package which has the highest sales amount?
select top 1 developin from software
order by scost desc

--65. How many copies of the package that has the least difference between development and selling cost were sold?
select top 1 sold, title, pname, (scost-dcost) as difference_scost_dcost from software
order by (dcost-scost) asc
select * from software

--66. Which is the costliest package developed in Pascal?
select top 1 title from software where developin='pascal'
order by (scost+dcost) desc

--67. Which language was used to develop the most number of packages?
select top 1 developin from software
order by sold desc

--68. Which programmer has developed the highest number of packages?
select top 1 pname from software
order by sold desc

--69. Who is the author of the costliest package?
select top 1 pname, title from software
order by (scost+dcost) desc


--70. Display the names of the packages which have sold less than the average number of copies.
with no_of_copies as 
(select sum(sold) sold_count, title from software group by title),
average as (select avg(cast(sold_count as float)) avg_sold from no_of_copies)
select title from no_of_copies,average
where no_of_copies.sold_count<average.avg_sold

WITH no_of_copies AS (
    SELECT title, SUM(sold) AS sold_count 
    FROM software 
    GROUP BY title
),
average AS (
    SELECT AVG(CAST(sold_count AS FLOAT)) AS avg_sold 
    FROM no_of_copies
)
SELECT title 
FROM no_of_copies
CROSS JOIN average
WHERE no_of_copies.sold_count < average.avg_sold;

--71. Who are the authors of the packages which have recovered more than double the development cost?
WITH recover AS (
    SELECT PNAME, (scost * sold) AS amt 
    FROM Software
), 
dev_cost AS (
    SELECT PNAME, (2 * dcost) AS deecost 
    FROM Software
)
SELECT r.PNAME -- use distinct if you want unique names
FROM recover r
JOIN dev_cost d ON r.PNAME = d.PNAME 
WHERE r.amt > d.deecost;



--72. Display the programmer names and the cheapest packages developed by them in each language.
select * from software
select pname, min(scost+dcost) as cheapest_package from software
group by pname

--73. Display the language used by each programmer to develop the highest selling and lowest selling package.
WITH SalesRank AS (
    SELECT 
        PNAME, 
        TITLE, 
        DEVELOPIN, 
        SOLD,
        RANK() OVER (PARTITION BY PNAME ORDER BY SOLD DESC) AS HighRank,
        RANK() OVER (PARTITION BY PNAME ORDER BY SOLD ASC) AS LowRank
    FROM software
)
SELECT PNAME, TITLE, DEVELOPIN, SOLD, 
       CASE WHEN HighRank = 1 THEN 'Highest Selling' 
            WHEN LowRank = 1 THEN 'Lowest Selling' 
       END AS SaleType
FROM SalesRank
WHERE HighRank = 1 OR LowRank = 1
ORDER BY PNAME, SaleType DESC;


--74. Who is the youngest male programmer born in 1965?
select top 1 pname,dob from programmer where gender='m' and year(dob)='1965'
order by dob asc

--75. Who is the oldest female programmer who joined in 1992?
select top 1 pname, doj from programmer where gender='f' and year(doj)='1992'
order by dob desc

--76. In which year was the most number of programmers born?
select top 1 year(dob) year_dob, count(pname) as no_programmers from programmer
group by year(dob)
order by no_programmers desc

--77. In which month did the most number of programmers join?
select top 1 month(doj) month_doj, count(pname) as no_programmers from programmer
group by month(doj)
order by no_programmers desc

--78. In which language are most of the programmer’s proficient?
select top 1 prof1, count(pname) as no_programmers from (select pname, prof1 from programmer union select pname,prof2 from programmer) as tab
group by prof1
order by no_programmers desc

--79. Who are the male programmers earning below the average salary of female programmers?
select pname from programmer where salary<(select AVG(salary) as av from Programmer where gender='f') and gender='m'

--80. Who are the female programmers earning more than the highest paid? may be asking male
select pname from programmer where gender='f' and salary>(select top 1 salary from programmer where gender='m' order by salary desc)

--81. Which language has been stated as the proficiency by most of the programmers?
select top 1 prof1, count(pname) as no_programmers from (select pname, prof1 from programmer union select pname,prof2 from programmer) as tab
group by prof1
order by no_programmers desc

--82. Display the details of those who are drawing the same salary.
SELECT * 
FROM programmer
WHERE salary IN (
    SELECT salary
    FROM programmer
    GROUP BY salary
    HAVING COUNT(*) > 1
);



--83. Display the details of the software developed by the male programmers earning more than 3000.
select * from software s
join programmer p
on p.pname=s.pname
where salary>3000 and gender='m'

--84. Display the details of the packages developed in Pascal by the female programmers.
select * from software s
join programmer p
on p.pname=s.pname
where gender='f' and developin='pascal'

--85. Display the details of the programmers who joined before 1990.
select * from programmer
where year(doj)<1990

--86. Display the details of the software developed in C by the female programmers at Pragathi.
select * from software s
join studies st
on st.pname=s.pname
join programmer p
on p.pname=s.pname
where developin='c' and gender='f' and institute='pragathi'

--87. Display the number of packages, number of copies sold and sales value of each programmer institute wise.
select s.pname, st.institute, count(s.title) no_packages, sum(s.sold) copies_sold, sum(scost*sold) sales_value from studies st
join software s
on s.pname=st.pname
group by st.institute, s.pname

--88. Display the details of the software developed in dBase by male programmers who belong to the institute in which the most number of programmers studied.
select * from Software s
join Programmer p
on p.PNAME=s.PNAME
join Studies st
on st.PNAME=s.PNAME
where p.GENDER='m' and DEVELOPIN='dbase'
and institute=(select top 1 institute from Studies group by INSTITUTE order by count(pname) desc)

WITH institute_populous AS (
    SELECT TOP 1 institute
    FROM studies
    GROUP BY institute
    ORDER BY COUNT(pname) DESC
),
m_programmer AS (
    SELECT DISTINCT s.pname
    FROM software s
    JOIN programmer p ON s.pname = p.pname
    WHERE p.gender = 'M'
)
SELECT sw.*
FROM software sw
JOIN studies st ON sw.pname = st.pname
JOIN institute_populous ip ON st.institute = ip.institute
JOIN m_programmer mp ON sw.pname = mp.pname
WHERE sw.developin = 'DBASE';


--89. Display the details of the software developed by the male programmers born before 1965 and female programmers born after 1975.

with male_programmers as (select pname from Programmer where gender='m' and year(dob)<1965),
female_programmers as (select pname from Programmer where gender='f' and year(dob)>1975)
select s.* from software s 
join male_programmers mp on mp.pname=s.pname
join female_programmers fp on fp.pname=s.pname
where pname in (male_programmers,female_programmers)

WITH male_programmers AS (
    SELECT pname 
    FROM Programmer 
    WHERE gender = 'M' AND YEAR(dob) < 1965
),
female_programmers AS (
    SELECT pname 
    FROM Programmer 
    WHERE gender = 'F' AND YEAR(dob) > 1975
),
target_programmers AS (
    SELECT pname FROM male_programmers
    UNION
    SELECT pname FROM female_programmers
)
SELECT s.*
FROM Software s
JOIN target_programmers tp ON s.pname = tp.pname;


--90. Display the details of the software that has been developed in the language which is neither the first nor the second proficiency of the programmers.
select * from software s
join programmer p on p.pname=s.pname
where developin<>prof1 and developin<>prof2

--91. Display the details of the software developed by the male students at Sabhari.
select * from software s
join programmer p on p.pname=s.pname
join studies st on st.pname=s.pname
where gender='m' and institute='sabhari'

--92. Display the names of the programmers who have not developed any packages.
select p.pname from programmer p
left join software s on s.pname=p.pname
where s.pname is null


--93. What is the total cost of the software developed by the programmers of Apple?
select s.pname, Title, (dcost+scost) as Total_cost from software s
join studies st on st.pname=s.pname
where institute='apple'

--94. Who are the programmers who joined on the same day?
SELECT p1.pname, p1.doj
FROM Programmer p1
JOIN (
    SELECT doj
    FROM Programmer
    GROUP BY doj
    HAVING COUNT(*) > 1
) p2 ON p1.doj = p2.doj
ORDER BY p1.doj;


--95. Who are the programmers who have the same Prof2?
select pname, p.prof2 from programmer p
join (select prof2 from programmer group by prof2 having count(*)>1) p1
on p1.prof2=p.prof2

--96. Display the total sales value of the software institute wise.
select institute, developin, s.pname, (s.scost*s.sold) as Sales_value from software s
join studies st on st.pname=s.pname
group by developin, institute, s.pname, (s.scost*s.sold)
order by institute

--97. In which institute does the person who developed the costliest package study?
select top 1 institute, st.pname, (s.scost+s.dcost) as Package_cost from studies st
join software s on s.pname=st.pname
order by (s.scost+s.dcost) desc

--98. Which language listed in Prof1, Prof2 has not been used to develop any package?
with known_lang as (select prof1 as lang from programmer union select prof2 from programmer), used_lang as (select distinct developin as lang from software)
select lang from known_lang where lang not in (select lang from used_lang)

--99. How much does the person who developed the highest selling package earn and what course did he/she undergo?
select st.pname, st.course from studies st
join software s
on s.pname=st.pname
where (select top 1 pname from software order by (scost*sold) desc) = st.pname

--100. What is the average salary for those whose software sales is more than 50,000?
select avg(salary) as AVG_Salary from Programmer p
join Software s
on s.PNAME=p.PNAME
where (scost*sold)>50000

--101. How many packages were developed by students who studied in institutes that charge the lowest course fee?
select sum(s.sold) as total_pack from Software s
join Studies st
on st.PNAME=s.PNAME
where st.INSTITUTE=(select top 1 INSTITUTE from Studies order by COURSE_FEE asc)

--102. How many packages were developed by the person who developed the cheapest package? Where did he/she study?
select st.institute, s.sold from Software s
join Studies st
on st.PNAME=s.PNAME
where (s.SCOST+s.DCOST) = (select top 1 (SCOST+DCOST) from Software order by (SCOST+DCOST) asc)

--103. How many packages were developed by female programmers earning more than the highest paid male programmer?
select sum(s.sold) as Total_pack from Software s
join Programmer p
on p.PNAME=s.PNAME
where GENDER='f' and
SALARY>(select top 1 SALARY from Programmer where GENDER='m' order by SALARY desc)

--104. How many packages are developed by the most experienced programmers from BDPS?
select sum(s.sold) as total_pack from Software s
join Programmer p
on p.PNAME=s.PNAME
where p.PNAME=(select top 1 p.PNAME from Programmer p
join Studies st
on st.PNAME=p.PNAME
where INSTITUTE='BDPS'
order by DOJ desc)

--105. List the programmers (from the software table) and the institutes they studied at.
select distinct s.pname, st.institute from Software s
join Studies st
on st.PNAME=s.PNAME

--106. List each PROF with the number of programmers having that PROF and the number of the packages in that PROF.
select 
  p.Prof, 
  count(distinct s.pname) as No_Programmers, 
  sum(s.sold) as Total_Packages 
from 
  (select prof1 as Prof from Programmer 
   union 
   select prof2 from Programmer) as p
left join Software s on s.developin = p.Prof
group by p.Prof;

select prof, count(distinct s.pname) as No_Programmers, sum(s.sold) as Total_Packages from (select prof1 as Prof from  Programmer union (select PROF2 from programmer)) as p
join Software s
on s.DEVELOPIN=p.Prof
group by Prof

--107. List the programmer names (from the programmer table) and the number of packages each has developed.
select p.pname, sum(s.sold) as Total_Packages from Programmer p
left join Software s
on s.PNAME=p.PNAME
group by p.PNAME

--