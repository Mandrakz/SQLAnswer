/*1.CREATION OF STRUCTURE>  TABLE [EmployeeIntoTable]
*/
Drop TABLE IF EXISTS  [SQLQuestionsInterview].[dbo].[EmployeeIntoTable]
Create TABLE [SQLQuestionsInterview].[dbo].[EmployeeIntoTable] (

EmpID INT PRIMARY KEY NOT NULL ,
EmpFname VARCHAR(50) NOT NULL,
EmpLname VARCHAR(50) NOT NULL,
Department VARCHAR(50) NOT NULL,
Project VARCHAR(2) NOT NULL,
Address VARCHAR(50) NOT NULL,
DOB DATE NOT NULL,
Gender VARCHAR(1) NOT NULL

);


/*1.CREATION OF STRUCTURE> TABLE [EmployeePosition]
*/
Drop TABLE IF EXISTS  [SQLQuestionsInterview].[dbo].[EmployeePosition]
Create TABLE [SQLQuestionsInterview].[dbo].[EmployeePosition] (

EmpID INT ,
EmpPosition VARCHAR(50) NOT NULL,
DateofJoining DATE,
Salary INT NOT NULL

FOREIGN KEY (EmpID) REFERENCES [SQLQuestionsInterview].[dbo].[EmployeeIntoTable](EmpID) ON DELETE CASCADE
);

/*2.INSERTING DATA IN TABLE > [EmployeeIntoTable]*/
INSERT INTO [SQLQuestionsInterview].[dbo].[EmployeeIntoTable] 
VALUES 
(1,'Sanjay','Mehra','HR','P1','Hyderabad(HYD)',cast('01-12-1976' AS datetime),'M'),
(2,'Ananya','Mishra','Admin','P2','Delhi(DEL)',cast('02-05-1968' AS datetime),'F'),
(3,'Rohan','Diwan','Account','P3','Mumbai(BOM)',cast('01-01-1980' AS datetime),'M'),
(4,'Sonia','Kulkarni','HR','P1','Hyderabad(HYD)',cast('02-05-1992' AS datetime),'F'),
(5,'Ankit','Kapoor','Admin','P2','Delhi(DEL)',cast('03-07-1994' AS datetime),'M');

/*2.INSERTING DATA IN TABLE > [EmployeePosition]*/
INSERT INTO [SQLQuestionsInterview].[dbo].[EmployeePosition] 
VALUES 
(1,'Manager',cast('01-05-2022' AS datetime),500000),
(2,'Executive',cast('02-05-2022' AS datetime),75000),
(3,'Manager',cast('01-05-2022' AS datetime),90000),
(2,'Lead',cast('02-05-2022' AS datetime),85000),
(1,'Executive',cast('01-05-2022' AS datetime),300000)
/****************************3.SOLUTION**********************************/
/*SQL INTERVIEW QUESTION*/
SELECT [EmpFname]
      ,[EmpLname]
      ,[Department]
      ,[Project]
      ,[Address]
      ,[DOB]
      ,[Gender]
	  ,EmplPos.DateofJoining
  FROM [SQLQuestionsInterview].[dbo].[EmployeeIntoTable] AS EmplTab
  INNER JOIN  [SQLQuestionsInterview].[dbo].[EmployeePosition] EmplPos
  ON EmplTab.EmpID = EmplPos.EmpID
  WHERE EmplPos.EmpPosition = 'Manager'
  /***************************3*SOLUTION**********************************/
/*SQL INTERVIEW QUESTION*/
  SELECT [EmpFname]
      ,[EmpLname]
      ,[Department]
      ,[Project]
      ,[Address]
      ,[DOB]
      ,[Gender]
	  ,EmplPos.DateofJoining,
	  EmplPos.EmpPosition,
	  EmplPos.Salary
  FROM [SQLQuestionsInterview].[dbo].[EmployeeIntoTable] AS EmplTab
  INNER JOIN  [SQLQuestionsInterview].[dbo].[EmployeePosition] EmplPos
  ON EmplTab.EmpID = EmplPos.EmpID
  WHERE DateofJoining IS NOT NULL /*If DateOfJoining was defined in the structured for accepting NULL values you must write this line, else NOPE(DATEOFJOINING CAN´T ADMIT NULL VALUES> don´t WRITE THIS LINE) */