Create Database June29
Create TABLE Studies (PNAME varchar(20),INSTITUTE varchar(20),COURSE varchar(20),COURSE_FEE int)

select * from Studies

Insert into Studies VALUES
('ANAND','SABHARI','PGDCA',4500 ),
('ALTAF','COIT','DCA',7200 ),
('JULIANA','BDPS','MCA',22000 ),
('KAMALA','PRAGATHI','DCA',5000 ),
('MARY','SABHARI','PGDCA ',4500 ),
('NELSON','PRAGATHI','DAP',6200 ),
('PATRICK','PRAGATHI','DCAP',5200 ),
('QADIR','APPLE','HDCA',14000 ),
('RAMESH','SABHARI','PGDCA',4500 ),
('REBECCA','BRILLIANT','DCAP',11000 ),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000 ),
('VIJAYA','BDPS','DCA',48000);

CREATE TABLE SOFTWARE (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2), DCOST int, SOLD int)
SELECT * FROM software

INSERT INTO software values
('MARY','README','CPP',300, 1200, 84), 
('ANAND','PARACHUTES','BASIC',399.95, 6000, 43 ),
('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 ),
('JULIANA','INVENTORY','COBOL',3000, 3500, 0 ),
('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
('MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4), 
('MARY','CODE GENERATOR','C',4500, 20000, 23),
('PATTRICK','README','CPP',300, 1200, 84),
('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 ),
('QADIR','VACCINES','C',1900, 3100, 21 ),
('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4),
('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
('REMITHA','PC UTILITIES','C',725, 5000, 51 ),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
('VIJAYA','TSR EDITOR','C',900, 700, 6);

CREATE TABLE programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)

SELECT * FROM programmer

INSERT INTO programmer values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 ),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 ),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 ),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 ),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 ),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 ),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 ),
( 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 ),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 ),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 ),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 ),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 ),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);

--1. Find out the selling cost AVG for packages developed in Pascal.
select AVG(SCOST) AS AVG_OF_SCOST from SOFTWARE WHERE DEVELOPIN='PASCAL'

--2. Display Names, Ages of all Programmers. 
Select PNAME , Datediff (yy,dob,getdate()) FROM programmer

--3. Display the Names of those who have done the DAP Course.
select Pname, course from studies where course='DAP'
--4. Display the Names and Date of Births of all Programmers Born in January.
select PNAME, DOB from programmer where month(dob)=1
--5. What is the Highest Number of copies sold by a Package?
select max(sold) as max_sold from software
--6. Display lowest course Fee.
SELECT min(course_fee) as lowest_fee from Studies
--7. How many programmers done the PGDCA Course?
select count(*) from studies where course='PGDCA'
--8. How much revenue has been earned thru sales of Packages Developed in C.
select sum(scost*sold) as revenue from SOFTWARE WHERE DEVELOPIN='C'
--9. Display the Details of the Software Developed by Ramesh.
select * from SOFTWARE where PNAME='Ramesh'
--10. How many Programmers Studied at Sabhari?
select count(*) from studies where INSTITUTE='SABHARI'
--11. Display details of Packages whose sales crossed the 2000 Mark.
select * from SOFTWARE where (sold*scost)>2000
--12. Display the Details of Packages for which Development Cost have beenrecovered.
select * from SOFTWARE where dcost<SCOST
--13. What is the cost of the costliest software development in Basic?
select max(dcost) from SOFTWARE where DEVELOPIN like 'basic';
--14. How many Packages Developed in DBASE?
select count(*) from SOFTWARE where DEVELOPIN like 'DBASE';
--15. How many programmers studied in Pragathi?
select count(*) from Studies where INSTITUTE like 'Pragathi';
--16. How many Programmers Paid 5000 to 10000 for their course?
select count(*) from Studies where course_fee between 5000 and 10000;
--17. What is AVG Course Fee
select avg(course_fee) from Studies
--18. Display the details of the Programmers Knowing C
select * from SOFTWARE where DEVELOPIN='C'
select * from programmer where PROF1='C' or PROF2='C'
--19. How many Programmers know either COBOL or PASCAL. 
select count(*) from programmer where prof1 in ('COBOL','PASCAL') OR PROF2 in ('COBOL' ,'PASCAL' );
--20. How many Programmers Don't know PASCAL and C 
select count(*) from programmer where prof1 not in ('pascal','c') or prof2 not in ('pascal','c');
--21. How old is the Oldest Male Programmer.
select max(datediff(yy,dob,getdate())) as maxage FROM PROGRAMMER where gender='M'
--22. What is the AVG age of Female Programmers?
select avg(datediff(yy,dob,getdate())) as avgage from programmer where gender='F'
--23. Calculate the experience in years for each programmers and display along with the names in descending order?
select Datediff(yy,doj,getdate()) as exp from programmer order by Pname DESC;
--24. Who are the programmers who celebrate their birthday during the current month?
SELECT * FROM programmer  WHERE MONTH(dob) = MONTH(getdate())
--25. How many Female Programmers are there?
select count(*) from programmer where gender='F'
--26. What are the Languages studied by Male Programmers.
select Pname,Prof1,prof2 from programmer where gender='M'
--27. What is the AVG Salary?
select AVG(Salary) as avgsalary from programmer
--28. How many people draw 2000 to 4000?
select count(*) from programmer where salary BETWEEN 2000 and 4000
--29. Display the details of those who don't know Clipper, Cobol or Pascal?
select * from programmer where prof1 not in ('Clipper', 'Cobol','Pascal') and prof2 not in ('Clipper', 'Cobol','Pascal')
--30. Display the Cost of Package Developed By each Programmer. 
select Pname, sum(DCOST) as totalpackagecost from software group by Pname 
--31. Display the sales values of the Packages Developed by the each Programmer.
select pname, sum(scost*sold) from software group by pname;
--32. Display the Number of Packages sold by Each Programmer.
select pname, sold from software;
--33. Display the sales cost of the packages Developed by each Programmer Language wise.
select developin, sum(scost) from software group by developin;
--34. Display EACH language name with AVERAGE development cost, average selling cost and AVERAGE price per copy.
select developin, AVG(dcost) as avgdevcost, AVG(scost) as avgsellingcost, AVG(scost) as avg_price_percopy from software group by developin;
--35. Display EACH programmers name,costliest package,cheapest packages developed by Him or her.
select pname, max(dcost) as costliest_package , min(dcost) as cheapest_package from software group by pname;
--36. Display each institute name with number of Courses, Average Cost perCourse.
select INSTITUTE ,count(course) , AVG(course_fee) as avg_cost_per_course from studies group by INSTITUTE;
--37. Display each institute Name with Number of Students.
select count(pname) as number_of_students ,institute from studies group by institute;
--38. Display Names of Male and Female Programmers. Gender also.
select pname,gender from programmer order by gender;
--39. Display the Name of Programmers and Their Packages.
select pname, scost from software order by pname;
--40. Display the Number of Packages in Each Language Except C and C++.
select count(sold) as Number_of_packages, developin from software where developin not in ('C','CPP') GROUP BY developin;
--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000
select count(Title),developin from software where dcost <= 1000 group BY developin
--42. Display AVG Difference between SCOST, DCOST for Each Package.
select developin, AVG(SCOST-DCOST) as avg_of_scostanddcost FROM software group by developin
--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.
select sum(scost) as sum_of_scost, sum(Dcost) as sum_of_Dcost,sum(dcost-(scost*sold)) as sum_of_amount_to_be_recovered from software group by Pname having  sum(Dcost) >= sum(scost*sold)
--44. Display Highest, Lowest and Average Salaries for those earning more than2000.
SELECT Pname, avg(salary)
FROM programmer
GROUP BY Pname
HAVING avg(salary) > 2000;
--45. Who is the Highest Paid C Programmers?
SELECT * FROM Programmer WHERE Salary=(SELECT MAX(Salary) FROM Programmer WHERE PROF1 LIKE 'C' OR PROF2 LIKE 'C');
--46. Who is the Highest Paid Female COBOL Programmer?
select * from programmer where salary=(select max(salary) from programmer where (prof1 like 'COBOL' or prof2 like'COBOL')) and Gender like 'F';
--47. Display the names of the highest paid programmers for each Language.
SELECT DISTINCT PNAME, SALARY, PROF1 FROM PROGRAMMER WHERE (SALARY>=1000) IN (SELECT MAX(SALARY),PROF1 FROM PROGRAMMER GROUP BY PROF1);
--48. Who is the least experienced Programmer.
SELECT FLOOR ((getdate()-DOJ)/365) as EXP,Pname  FROM PROGRAMMER WHERE FLOOR((getdate()-DOJ)/365) = (SELECT MIN(FLOOR((getdate()-DOJ)/365)) FROM PROGRAMMER);
--49. Who is the most experienced male programmer knowing PASCAL.
select  top 1 pname, datediff(day,doj,getdate()) as experience from programmer where gender='m' and (prof1='pascal' or prof2='pascal') order by experience desc ;
--50. Which Language is known by only one Programmer?
--Note: here 3 programmers know a language that is unknown to anyone else in the list.
With base as 
(select pname,prof1,SALARY from programmer
  union all
  select pname,prof2,SALARY from programmer
),orderas as
(select prof1,count(*) as rownumber from base group by prof1)

select *from orderas where rownumber=1;
--51. Who is the Above Programmer Referred in 50?
The 3 learners names as referred from above in Q50
With base as 
(select pname,prof1,SALARY from programmer
  union all
  select pname,prof2,SALARY from programmer
), table6 as
(select prof1,count(prof1) as noOfLearners from base group by prof1), joined as

(select b.pname,b.prof1,t.noOfLearners from base as b inner join table6 as t on b.prof1=t.prof1)
select * from joined where noOfLearners=1;
--52. Who is the Youngest Programmer knowing DBASE? 
select top 1 Pname,datediff(day,DOB,getdate()) as agebydays from programmer 
where (prof1='dbase' or prof2='dbase') order by agebydays;
--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?
select Pname,salary from programmer 
where PROF1 NOT IN  ('C','C++','oracle','dbase') 
AND PROF2 NOT IN ('C','C++','oracle','dbase')
AND SALARY>3000 AND GENDER='F';
--54. Which Institute has most number of Students? 
select top 1 institute as higheststrengthinstitute, count(pname) as NOofstudents 
from STUDIES group by INSTITUTE order by count(pname) desc;
--55. What is the Costliest course? 
select top 1 course,COURSE_FEE from studies order by course_fee desc;
--56. Which course has been done by the most of the Students? 
select top 1 course, count(course) as no_of_students from studies  group by course order by no_of_students desc;
--57. Which Institute conducts costliest course. 
select  top 1 institute, course ,COURSE_FEE from studies order by COURSE_FEE desc;
--58. Display the name of the Institute and Course, which has below AVG course fee. 
select avg(course_fee) as avgcoursefee from studies;
select institute,course,COURSE_FEE from studies where course_fee<11007.00;
--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee, 
select avg(course_fee) as avgcoursefee from studies;
select institute,course from studies where course_fee between 6925.00 and 8925.00;
--60. Which package has the Highest Development cost? 
select max(dcost) from SOFTWARE;
select title from software where DCOST=85000;
--61. Which course has below AVG number of Students?
select count(pname) as student_count, COURSE from Studies GROUP by COURSE;
 select 
    course, studentcount, cast(mean as decimal(10, 2)) mean
    from (
        select 
            course, count(pname) studentcount, 
            avg(cast(count(pname) as float)) over() mean 
            from studies group by course
    ) sub
 where studentcount < mean;
--62. Which Package has the lowest selling cost? 
select top 1 title,SCOST from software order by scost;
--63. Who Developed the Package that has sold the least number of copies? 
select top 1 pname from software order by sold;
--64. Which language has used to develop the package, which has the highest sales amount? 
select developin from software where SCOST= (SELECT MAX(SCOST) FROM SOFTWARE)
--65. How many copies of package that has the least difference between development and selling cost where sold. 
SELECT SOLD,TITLE FROM SOFTWARE WHERE TITLE =(SELECT TITLE FROM SOFTWARE 
WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM SOFTWARE));
--66. Which is the costliest package developed in PASCAL. 
SELECT TOP 1 TITLE,SCOST FROM SOFTWARE WHERE DEVELOPIN LIKE 'PASCAL' 
ORDER BY SCOST DESC;
--67. Which language was used to develop the most number of Packages. 
SELECT TOP 1 DEVELOPIN AS 'LANGUAGE', COUNT(TITLE) AS 'NO OF PACKAGES' 
FROM SOFTWARE GROUP BY DEVELOPIN ORDER BY 'NO OF PACKAGES' DESC;
--68. Which programmer has developed the highest number of Packages?
SELECT TOP 1 PNAME AS PROGRAMMER,COUNT(TITLE)AS NOOFPACKAGES FROM SOFTWARE 
GROUP BY PNAME ORDER BY NOOFPACKAGES DESC;
--69. Who is the Author of the Costliest Package? 
SELECT PNAME FROM SOFTWARE WHERE SCOST=(SELECT MAX(SCOST) FROM SOFTWARE);
--70. Display the names of the packages, which have sold less than the AVG number of copies. 
SELECT TITLE FROM SOFTWARE WHERE SOLD<(SELECT AVG(SOLD) FROM SOFTWARE);
--71. Who are the authors of the Packages, which have recovered more than double the Development cost? 
WITH SALES AS
(SELECT PNAME,TITLE,SCOST,DCOST,SOLD, SCOST*SOLD AS SALES FROM SOFTWARE)
(SELECT PNAME FROM SALES WHERE SALES>(2*DCOST))
--72. Display the programmer Name and the cheapest packages developed by them in each language. 
WITH PARTEDTABLE AS
(SELECT PNAME,TITLE, DCOST, 
MIN(DCOST) OVER (PARTITION BY PNAME) AS LOWESTCOST,
MAX(DCOST) OVER (PARTITION BY PNAME) AS HIGHESTCOST FROM SOFTWARE)
(SELECT PNAME,TITLE FROM PARTEDTABLE WHERE LOWESTCOST=DCOST);
--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package. 
SELECT PNAME, DEVELOPIN
FROM SOFTWARE
WHERE SOLD IN (SELECT MAX(SOLD)
FROM SOFTWARE
GROUP BY PNAME)
UNION
SELECT PNAME, DEVELOPIN
FROM SOFTWARE
WHERE SOLD IN (SELECT MIN(SOLD)
FROM SOFTWARE
GROUP BY PNAME)
--74. Who is the youngest male Programmer born in 1965? 
SELECT  TOP 1 PNAME, DATEDIFF(DAY,DOB,GETDATE()) AS AGE FROM PROGRAMMER 
WHERE GENDER LIKE 'M' AND YEAR(DOB)=1965 ORDER BY AGE;
--75. Who is the oldest Female Programmer who joined in 1992?
SELECT TOP 1 PNAME,DATEDIFF(DAY,DOJ,GETDATE()) AS TENURE FROM PROGRAMMER WHERE GENDER LIKE 'F' ORDER BY TENURE DESC;
--76. In which year was the most number of Programmers born. 
SELECT TOP 1 YEAR(DOB) AS BIRTHYEAR,COUNT(PNAME) NOOFBORN FROM PROGRAMMER GROUP BY YEAR(DOB) ORDER BY NOOFBORN DESC;
--77. In which month did most number of programmers join? 
SELECT TOP 1 YEAR(DOJ) AS JOININGYEAR,COUNT(PNAME) NOOFJOINED FROM PROGRAMMER GROUP BY YEAR(DOJ) ORDER BY NOOFJOINED DESC;
--78. In which language are most of the programmer’s proficient. 
SELECT TOP 1 LANGUAGES,COUNT(PNAME) AS NOOFPROG FROM 
(SELECT PNAME, PROF1 AS LANGUAGES FROM PROGRAMMER
UNION ALL
SELECT PNAME, PROF2 FROM PROGRAMMER) RUB GROUP BY LANGUAGES ORDER BY NOOFPROG DESC;
--79. Who are the male programmers earning below the AVG salary of Female Programmers? 
SELECT PNAME FROM PROGRAMMER WHERE GENDER LIKE 'M' AND SALARY <(SELECT AVG(SALARY) FROM PROGRAMMER WHERE GENDER LIKE 'F')
--80. Who are the Female Programmers earning more than the Highest Paid? 
SELECT PNAME FROM PROGRAMMER WHERE GENDER LIKE 'M' AND SALARY>(SELECT MAX(SALARY) FROM PROGRAMMER);
--note: Answer is NO ONE AND HIGHEST PAID IS FEMALE
--81. Which language has been stated as the proficiency by most of the Programmers? 
SELECT TOP 1 LANGUAGES,COUNT(PNAME) AS NOOFPROG FROM 
(SELECT PNAME, PROF1 AS LANGUAGES FROM PROGRAMMER
UNION ALL
SELECT PNAME, PROF2 FROM PROGRAMMER) RUB GROUP BY LANGUAGES ORDER BY NOOFPROG DESC;
--82. Display the details of those who are drawing the same salary. 
select * from programmer where salary = any(select salary from programmer p group by salary having salary=p.salary and count(*)>1);
--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-. 
select S.* from programmer p,software s where p.Pname=s.Pname and salary>3000 and GENDER='m';
--84. Display the details of the packages developed in Pascal by the Female Programmers. 
SELECT * FROM PROGRAMMER WHERE GENDER LIKE 'F' AND (PROF1 LIKE 'PASCAL' OR PROF2 LIKE 'PASCAL');
--85. Display the details of the Programmers who joined before 1990. 
SELECT * FROM PROGRAMMER WHERE YEAR(DOJ)<1990;
--86. Display the details of the Software Developed in C By female programmers of Pragathi. 
WITH T1 AS
(SELECT * FROM SOFTWARE WHERE DEVELOPIN='C') , T2 AS
(SELECT T1.*,P.GENDER FROM T1 LEFT JOIN  PROGRAMMER P ON T1.PNAME=P.PNAME WHERE P.GENDER='F')
(SELECT T2.*,S.INSTITUTE FROM T2 LEFT JOIN STUDIES S ON T2.PNAME=S.PNAME WHERE S.INSTITUTE='PRAGATHI')
--note: NO ONE FROM PRAGATHI INSTITUTE DEVELOPED A SOFTWARE IN C
--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise. 
SELECT  DISTINCT PNAME, 
INSTITUTE,COUNT(TITLE) OVER (PARTITION BY PNAME) AS NOOFPACKS,
SUM(SOLD) OVER (PARTITION BY PNAME) AS NOOFCOPIESSOLD, 
SUM(SOLD*SCOST) OVER (PARTITION BY PNAME) AS SALESVALUE  
FROM (SELECT S.*,ST.INSTITUTE FROM SOFTWARE S LEFT JOIN STUDIES ST ON S.PNAME=ST.PNAME) AS P;
--88. Display the details of the software developed in DBASE by Male Programmers,who belong to the institute in which most number of Programmers studied.
WITH T1 AS
(SELECT * FROM STUDIES WHERE INSTITUTE=(SELECT TOP 1 INSTITUTE FROM (SELECT INSTITUTE,COUNT(PNAME) AS NOOFSTUD FROM STUDIES GROUP BY INSTITUTE) 
AS NOF ORDER BY NOOFSTUD DESC)),T2 AS (SELECT T1.*,P.GENDER FROM T1 LEFT JOIN PROGRAMMER P ON T1.PNAME=P.PNAME AND P.GENDER LIKE 'M')
(SELECT S.PNAME,T2.GENDER,S.TITLE AS SOFTWARE,S.DEVELOPIN,S.SCOST,S.DCOST,S.SOLD,T2.INSTITUTE AS MOSTSTUDINST FROM T2 
JOIN SOFTWARE S ON T2.PNAME=S.PNAME AND DEVELOPIN LIKE 'DBASE')
--89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975. 
SELECT * FROM SOFTWARE WHERE PNAME=(SELECT PNAME FROM PROGRAMMER WHERE (YEAR(DOB)<1965 AND GENDER LIKE 'M') OR (YEAR(DOB)>1975 AND GENDER LIKE 'F'))
--note: ALTAF IS THE MALE PROGRAMMER BEFORE 1965 AND NO FEMALE PROGRAMMERS BORN AFTER 1975. Altaf hasn’t developed any software.
--90. Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers.
SELECT S.* FROM SOFTWARE S JOIN  PROGRAMMER P ON S.PNAME=P.PNAME AND S.DEVELOPIN NOT IN (P.PROF1,P.PROF2)
--91. Display the details of the software developed by the male students of Sabhari. 
SELECT SF.* FROM SOFTWARE SF JOIN 
(SELECT S.* FROM STUDIES S RIGHT JOIN PROGRAMMER P ON S.PNAME=P.PNAME WHERE S.INSTITUTE='SABHARI' AND P.GENDER LIKE 'M') AS SP ON
SF.PNAME=SP.PNAME;
--92. Display the names of the programmers who have not developed any packages. 
SELECT * FROM PROGRAMMER WHERE PNAME IN(SELECT PNAME FROM (SELECT PNAME FROM PROGRAMMER 
EXCEPT
SELECT PNAME FROM SOFTWARE) AS P )
--93. What is the total cost of the Software developed by the programmers of Apple? 
SELECT PNAME,SUM(DCOST) AS TOTAL_COST FROM SOFTWARE WHERE PNAME= 
(SELECT PNAME FROM STUDIES WHERE INSTITUTE= 'APPLE') GROUP BY PNAME;
--94. Who are the programmers who joined on the same day? 
SELECT PNAME,DOJ FROM PROGRAMMER WHERE DOJ IN 
(SELECT DOJ FROM (SELECT DOJ,COUNT(DOJ) AS JOININGDATE 
FROM PROGRAMMER GROUP BY DOJ HAVING COUNT(DOJ)>1)AS DOJT) ORDER BY DOJ;
--95. Who are the programmers who have the same Prof2? 
SELECT PNAME,PROF2 FROM PROGRAMMER WHERE PROF2 IN 
(SELECT PT.PROF2 FROM (SELECT DISTINCT PROF2,COUNT(PNAME)OVER (PARTITION BY PROF2) AS PROF2COU FROM PROGRAMMER)AS PT 
WHERE PT.PROF2COU>1) ORDER BY PROF2;
--96. Display the total sales value of the software, institute wise. 
SELECT DISTINCT INSTITUTE,SUM(SCOST*SOLD) OVER (PARTITION BY INSTITUTE) AS TOTALSALES 
FROM 
(SELECT ST.INSTITUTE,S.* FROM STUDIES ST JOIN SOFTWARE S ON ST.PNAME=S.PNAME) AS T
--97. In which institute does the person who developed the costliest package studied. 
SELECT ST.INSTITUTE,S.PNAME FROM STUDIES ST JOIN SOFTWARE S ON ST.PNAME=S.PNAME AND S.DCOST=(SELECT MAX(DCOST) FROM SOFTWARE)
--98. Which language listed in prof1, prof2 has not been used to develop any package. 
select prof1 from programmer where prof1 not in(select DEVELOPIN from software) union select prof2 from programmer where prof2 not in(select DEVELOPIN from software);
--99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.
SELECT S.SALARY,T.COURSE FROM 
(SELECT PNAME,SALARY FROM PROGRAMMER WHERE PNAME=(SELECT PNAME FROM SOFTWARE WHERE SCOST=(SELECT MAX(SCOST)FROM SOFTWARE))) AS S 
JOIN 
STUDIES T ON S.PNAME=T.PNAME;
--100. What is the AVG salary for those whose software sales is more than 50,000/-. 
SELECT AVG(SALARY) AS AVGSALARY FROM (SELECT  P.PNAME,S.SALES,SALARY FROM PROGRAMMER P JOIN 
(SELECT PNAME, SALES FROM (SELECT DISTINCT PNAME, SUM(SCOST*SOLD) OVER (PARTITION BY PNAME) AS SALES  FROM SOFTWARE)AS T WHERE SALES>50000) S
ON P.PNAME=S.PNAME) T
--101. How many packages were developed by students, who studied in institute that charge the lowest course fee? 
select count(title) as noofpackages from SOFTWARE 
where pname in (select pname from studies where course_fee=(select min(course_fee)from studies))
--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study? 
with t2 as
(select pname,count(title) as noofpacks from software  where dcost=(select min(DCOST)from software) group by pname)
(select t2.*,s.institute from studies s  right join
t2 on t2.pname=s.pname )
--103. How many packages were developed by the female programmers earning more than the highest paid male programmer? 
Select count(title) as noofpackages from software 
where pname in (Select pname from (select pname,salary from programmer 
where SALARY>(select max(salary) from programmer where gender like 'm') and gender like 'f') as t);
--104. How many packages are developed by the most experienced programmer form BDPS. 
select pname,count(title) as noofpacks from software 
where pname in 
(select pname from (select  top 1 pname, datediff(day,doj,getdate()) as exp from PROGRAMMER 
where pname in (select pname from studies where institute like 'BDPS') order by exp desc) t) group by PNAME
--105. List the programmers (form the software table) and the institutes they studied. 
select s.pname,st.institute from (select distinct pname as pname from software) s
LEFT join studies st
on s.PNAME=st.pname;
--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. 
SELECT DISTINCT T.PROF1,T.NOOFPROG,COUNT(S.TITLE)OVER (PARTITION BY S.DEVELOPIN)AS NOOFPACKS FROM 
(SELECT DISTINCT PROF1,COUNT(PNAME) OVER (PARTITION BY PROF1) AS NOOFPROG FROM 
(SELECT PNAME,PROF1 FROM PROGRAMMER UNION ALL SELECT PNAME, PROF2 FROM PROGRAMMER
) UN) T  LEFT JOIN SOFTWARE S
ON S.DEVELOPIN=T.PROF1
--107. List the programmer names (from the programmer table) and No. Of Packages each has developed.
SELECT  DISTINCT P.PNAME,COUNT(TITLE) OVER (PARTITION BY S.PNAME) AS NOOFPACKAGES FROM SOFTWARE S
RIGHT JOIN PROGRAMMER P ON P.PNAME=S.PNAME























































