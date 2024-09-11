--DML--
--ID(1280382),
--MD.RAYHAN MIA

			-- 1. Insert Records into tables using Script

-- Insert into Writer values
--			(1,'George','Orwell'),
--				(2,'Ted','Simon'),
--					(3,'William','Shakespeare'),
--						(4,'jane','austen'),
--							(5,'Wilfred','Thesiger'),
--								(6,'Samuel','Beckett')

--go
--	insert into LibMember values 
--	(101,'Alex','Wilson'),
--		(102,'Emily','Brown')

--Go
-- insert into Book values 
--  (121,'Animal Firm','Fiction',1),
--	(233,'Juppiter Travels','Travel',2),
--		(432,'Hamlet','Drama',3),
--			(123,'Pride and Prejudice','Fiction',4),
--				(424, 'Arabia Sands', 'Travel',5),
--					(400,'Waitiong for Godot','Drama',6)
--Go
--Insert Into BookTransaction
-- values
-- ('OR001',101,121,'2021-01-01','2021-02-4'),
--		('OR002',101,233,'2021-01-20','2021-02-2'),
--		  ('OR004',101,432,'2021-01-10','2021-02-2'),
--			('OR005',102,123,'2021-01-15','2021-01-31'),
--				('OR006',102,424,'2021-01-10','2021-01-27'),
--					('OR007',102,400,'2021-01-1','2021-02-2')

--					-02.UPDATE query for any one table of your Project.

--	UPDATE LibMember set Fname='Frhan''hosen'
--	Where  MemberID= 102;

--					-03.Delete Query for any one table of your project

--	Delete from LibMember
--	Where MemberID=102
--						04.Retrieve Write wise Book information using Group by And Having Caluse.
-- use LibraryDB
-- go 
-- select WR.Fname, WR.Lname, COUNT(BK.BookID) AS BOOKINFORMATION from BookTransaction as BT
-- join BOOk as BK ON BT.BookId=BK.BookID
-- JOIN Writer AS WR ON WR.WriterID= BK.WriterId
-- GROUP BY WR.Fname, WR.Lname
-- HAVING COUNT(BK.BookID)>=1

--			-05.Sub-Query to show all the information of Writter Willam Shakspare.
-- use LibraryDB
-- go 
-- select WR.Fname, WR.Lname, WR.WriterID  from BookTransaction as BT
-- join BOOk as BK ON BT.BookId=BK.BookID
-- JOIN Writer AS WR ON WR.WriterID= BK.WriterId
-- WHERE WR.WriterID IN 
-- (SELECT WriterID FROM Writer WHERE Fname ='William')

--					-06.An exampol of CTE

-- use LibraryDB
-- go
-- WITH MrRAYHAN AS

--	 (select WR.Fname, WR.Lname, WR.WriterID  from BookTransaction as BT
-- join BOOk as BK ON BT.BookId=BK.BookID
-- JOIN Writer AS WR ON WR.WriterID= BK.WriterId
-- WHERE WR.WriterID IN 
-- (SELECT WriterID FROM Writer WHERE Fname ='William'))
-- select * from MrRAYHAN
				
--				7.Create a simple Case and a Sarch Case.

--select IssueNo,BookId,Memberid,
--case
--when ReturnDate>= '2021-02-02' then'JOY BONGOBONDHU'
--when ReturnDate<= '2021-02-02' then'JOY BANGLA'
--end as rayhan
--from BookTransaction

--						08. Cursor it insert data into any one table of you database.
--  dml
--USE LibraryDB
-- GO
-- DECLARE @WRITERid VARCHAR (20),@fname varchar (20), @lname varchar (20),  @ShowCount int;
--SET @ShowCount=0

--DECLARE MYWRITER  CURSOR 
--FOR 
--	SELECT * FROM Writer

--OPEN MYWRITER
--	FETCH NEXT FROM MYWRITER INTO @WRITERid, @fname, @lname
--	WHILE @@FETCH_STATUS<> -1
--BEGIN 
--IF @fname LIKE 'J%'
--	BEGIN 
--PRINT @WRITERid
--Print @lname
--SET @ShowCount=@ShowCount+1
--END
--	FETCH NEXT FROM MYWRITER INTO  @WRITERid, @fname, @lname
--	END 	
--CLOSE MYWRITER
--DEALLOCATE MYWRITER

--PRINT '';
--PRINT convert(varchar, @ShowCount)+ ' Row(s) Counted'

--					09.write a query to retrieve book issue and Return date from BookTransaction 

-- USE LibraryDB
-- GO
-- SELECT IssueNo, Memberid,IssueDate,ReturnDate from BookTransaction
-- WHERE IssueDate BETWEEN '2021-01-01' AND '2021-02-4'
-- GO
--				10.write a query to retrieve LibMember Whose CustomerFName starts with 'Al'.
-- use LibraryDB
-- go
-- select MemberID,Fname, Lname from LibMember
-- where Fname like 'Al%'
--				11.write a query to retrieve LibMember Whose Contact name has one of the following characters: A,E,R
--use LibraryDB
-- go
-- select MemberID,Fname, Lname from LibMember
-- where Fname like '[AER]%'
-- GO
--			12.write a query to find all LibMember whose first letter of Fname starts with A and the next letter is one of A through J.

-- use LibraryDB
-- go
-- select MemberID,Fname, Lname from LibMember
-- where Fname  LIKE 'A[A-R]%'
-- GO
--			13.write a query to retrieve  2 through 3 records of LibMember

 
-- select MemberID,Fname 
-- from LibMember
-- ORDER BY MemberID
-- OFFSET 2 ROWS
-- FETCH NEXT 3 ROWS ONLY 

--				-14.CUBE Operator

--SELECT BookName,Genre,COUNT(BookID) booKCount 
--FROM BOOk
--WHERE BookName IN ('Hamlet','Drama')
--GROUP BY CUBE(BookName,Genre)
--ORDER BY BookName DESC, Genre DESC
--go

--				15.RollUp operator

--SELECT BookName,Genre,COUNT(BookID) booKCount 
--FROM BOOk
--WHERE BookName IN ('Hamlet','Drama')
--GROUP BY ROLLUP(BookName,Genre)
--ORDER BY BookName DESC, Genre DESC
--go

--				16.Grouping sets operator

--SELECT BookName,Genre,COUNT(BookID) booKCount 
--FROM BOOk
--WHERE BookName IN ('Hamlet','Drama')
--GROUP BY Grouping sets(BookName,Genre)
--ORDER BY BookName DESC, Genre DESC
--go


--					17.ANY
--USE LibraryDB
--go
--SELECT W.Fname,W.Lname,W.WriterID BookID,BookName
--FROM BOOk b join Writer AS W 
--ON B.WriterId=W.WriterID
--AND W.Fname<ANY
--(SELECT Fname FROM Writer WHERE WriterID=3)
--go

--						18.All
--USE LibraryDB
--go

--SELECT W.Fname,W.Lname,W.WriterID BookID,BookName
--FROM BOOk b join Writer AS W 
--ON B.WriterId=W.WriterID
--AND W.Fname<ALL
--(SELECT Fname FROM Writer WHERE WriterID=3)
--go

--						19.SOME

--USE LibraryDB
--go
--SELECT W.Fname,W.Lname,W.WriterID BookID,BookName
--FROM BOOk b join Writer AS W 
--ON B.WriterId=W.WriterID
--AND W.Fname<SOME
--(SELECT Fname FROM Writer WHERE WriterID=3)
--go


--						20.Over clause
--USE LibraryDB
--go
--SELECT COUNT(WriterId) OVER(order by WriterId) AS Bookdtls,
--avg(BookID) OVER(order by BookID) AS Bookinf
--FROM BOOk

--							21.Having clouse.
--USE LibraryDB
--go
--SELECT count(WriterID) AS wID 
--FROM Writer
--GROUP BY WriterID
--HAVING count(WriterID)>1
--ORDER BY count(WriterID) DESC
--go

			---22.Create stored procedures to insert, update, delete data for any one of the table of your database and show use of output parameter. 


			---EXEC spInsertUpdateDeleteAndOutputParameter 'SELECT','','','','0';
--EXEC spInsertUpdateDeleteAndOutputParameter 'Insert',2,'rayhan','Khan','';
--EXEC spInsertUpdateDeleteAndOutputParameter 'Update','rayhan','khan','','';
--EXEC spInsertUpdateDeleteAndOutputParameter 'Delete','rayhan','khan','','';