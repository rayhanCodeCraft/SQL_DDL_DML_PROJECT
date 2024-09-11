--DDL--
--ID(1280382),
--MD.RAYHAN MIA


--QUESTION NO 1


CREATE DATABASE LibraryDB
--	on
--	(
--	Name= LibraryDB_data_1,
--	Filename= 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\LibraryDB_data_1.mdf',
--	Size=25MB,
--	MaxSize=100MB,
--	FileGrowth=5%
--	)
--	Log on
--	(
--	Name=LibraryDB_Log_1,
--	Filename= 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\LibraryDB_data_1.ldf',
--	Size=2MB,
--	MaxSize=25MB,
--	FileGrowth=1%
--	)
	
--	Use LibraryDB
--	go

Create Table Writer
--		(
--		WriterID int primary key not null,
--		Fname varchar (50) not null,
--		Lname varchar (50) not null,
--		)

Create Table LibMember 
--	(
--	MemberID int primary key not null,
--	Fname varchar (25) not null,
--	Lname varchar (25) not null,
--	)

Create Table BOOk
--(
--BookID int Primary key not null,
--BookName varchar (35) not null,
--Genre varchar (15) not null,
--  WriterId int REFERENCES  Writer(WriterID) on Delete cascade not null
-- )

create table BookTransaction
--  (
--  IssueNo varchar (5) not null,
--  Memberid int REFERENCES  LibMember(MemberId) on Delete cascade not null,
--  BookId int REFERENCES  Book(BookId) on Delete cascade not null,
--  IssueDate Datetime not null,
--  ReturnDate Datetime not null,
-- )

				

				--06.Sript to delete a table
--	use LibraryDB
--	go
--	DROP TABLE BOOk;
					--07.Sript to delete a COLUMN
--	use LibraryDB
--	go
--	ALTER TABLE Book
--DROP COLUMN BookID;
						
						-- 08.Create a view to show all the information Where the Genreis - Drama.

-- CREATE VIEW INFORMATION AS 
-- SELECT BookID, BookName, Genre FROM BOOk
-- WHERE Genre= 'DRAMA'
 
-- SELECT * FROM INFORMATION



					-- 09.Stored precedures to insert, update, delete date for any one of the table of your database and show use of output parameter.

-- CREATE PROCEDURE spInsertUpdateDeleteAndOutputParameter
--@WRITERid varchar (20),
--@fname varchar (20),
--@lname varchar (20),
--@Functionality varchar (20)='',
--@count int output
 
-- as 
-- begin
-- if @Functionality = 'select'
-- begin
-- select * from Writer
-- end
-- If @Functionality ='insert'
--	begin
--	insert into Writer values (@WRITERid,@fname,@lname)
--	end 
--If @Functionality ='update'	
--	begin
--	Update Writer set Fname = @fname
--	where @WRITERid=WriterID
--	end
--If @Functionality ='delete'
--	begin
--	DELETE FROM Writer WHERE @WRITERid=WriterID
--	end
--	set @count=@@ROWCOUNT
-- end
-- -----
-- EXEC spInsertUpdateDeleteAndOutputParameter 'SELECT','','','','0';
--EXEC spInsertUpdateDeleteAndOutputParameter 'Insert',2,'rayhan','Khan','';
--EXEC spInsertUpdateDeleteAndOutputParameter 'Update','rayhan','khan','','';
--EXEC spInsertUpdateDeleteAndOutputParameter 'Delete','rayhan','khan','','';
						
						--10. Clustered Index in any one of the table.

--CREATE nonCLUSTERED INDEX ix_Writer
--	ON Writer(WriterID);

			--11.Scalar Function to set date difference betWeen issue date and Return date.

--create function mYfunction(@RAYHAN VARCHAR(5))
--returns INT
--	BEGIN
--	RETURN
--	(select DATEDIFF(MONTH,IssueDate, ReturnDate) from BookTransaction
--	where IssueNo=@RAYHAN)
--	END

--	PRINT dbo.mYfunction('OR001')

			--12. Create trigger on Insert,update, delete of any one table of you database.
--DDl
-- use LibraryDB
-- go
 
-- Create Table Writer2
--		(
--		WriterID2 int  not null,
--		Fname2 varchar (50) not null,
--		Lname2 varchar (50) not null,
--		)
--create trigger Rayhan
--on writer 
--after delete
--as
--begin
--insert into Writer2 (WriterID2,Fname2,Lname2)
--select WriterID,Fname,Lname
--from deleted
--end

			--13.Create a new table and set merge for any one table of you project..

--ddl
--Create Table Writer_T
--		(
--		WriterID int primary key not null,
--		Fname varchar (50) not null,
--		Lname varchar (50) not null,
--		)
--		GO 
--	Insert into Writer_T values
--			(1,'RAYHAN','KHAN'),
--				(2,'SHE','ISFINE'),
--					(3,'ASIK','MOLLA')

--					drop table Writer_T

--MERGE writer as w
--USING Writer_T AS wt 
-- ON wt.WriterID=w.WriterID
--WHEN MATCHED and wt.Fname>w.Fname
--THEN UPDATE SET w.Fname=wt.Fname
-- WHEN NOT MATCHED 
-- THEN INSERT (WriterID,Fname)
--  VALUES
-- (wt.WriterID,wt.Fname);