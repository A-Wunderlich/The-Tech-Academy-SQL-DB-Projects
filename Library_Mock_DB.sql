CREATE DATABASE LibraryData

USE LibraryData



CREATE TABLE Library_Branch (
	BranchId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName varchar(50) NOT NULL,
	Address varchar(150) NOT NULL
);

INSERT INTO Library_Branch (BranchName, Address)
VALUES
('Central', '1524 NE Central BLVD'),
('Sharpstown', '5197 51st WAY'),
('Downtown', '3111 1st & Broadway'),
('Beauty Hills', '4142 NE Mango St')

CREATE TABLE Publisher (
	PublisherName varchar(50) PRIMARY KEY NOT NULL,
	Address varchar(150) NOT NULL,
	Phone varchar(15) NOT NULL
);

INSERT INTO Publisher (PublisherName, Address, Phone)
VALUES
('Penguin Random House', '1745 Broadway New York, NY 10019', '212-366-2000'),
('Hachette', '1290 6th Ave, New York, NY 10104', '212-364-1100'),
('HarperCollins', '195 Broadway, New York, NY 10007', '212-207-7000')

CREATE TABLE Books (
	BookId INT PRIMARY KEY NOT NULL IDENTITY(1000,1),
	Title varchar(50) NOT NULL,
	PublisherName varchar(50) NOT NULL FOREIGN KEY REFERENCES Publisher(PublisherName)
);


INSERT INTO Books (Title, PublisherName)
VALUES
('The Dark Tower: The Gunslinger', 'Penguin Random House'),
('The Lost Tribe', 'Hachette'),
('Mister God, This Is Anna','HarperCollins'),
('Varjak Paw', 'Hachette'),
('A Confederacy of Dunces', 'Penguin Random House'),
('Daybreak', 'HarperCollins'),
('Unatural Leadership', 'HarperCollins'),
('Improving Your Memory', 'Hachette'),
('A Series of Unfortunate Events: Book 1', 'HarperCollins'),
('A Series of Unfortunate Events: Book 2', 'HarperCollins'),
('A Series of Unfortunate Events: Book 3', 'HarperCollins'),
('Blitzed', 'Penguin Random House'),
('Genesis', 'Penguin Random House'),
('The Age of Light', 'Hachette'),
('Redemption', 'Hachette'),
('Collected Fables', 'HarperCollins'),
('Tailspin', 'Hachette'),
('Gabriel''s Promise', 'Penguin Random House'),
('Murder, She Wrote', 'Penguin Random House'),
('The Language of Fire', 'HarperCollins'),
('IT',  'Penguin Random House'),
('Frankenstein', 'HarperCollins'),
('Big Bang', 'Hachette')


CREATE TABLE Book_Author (
	BookId INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	AuthorName varchar(75) NOT NULL
);


INSERT INTO Book_Author (BookId, AuthorName)
VALUES
(1000, 'Steven King'),
(1001, 'Austin Wunderlich'),
(1002, 'Fynn'),
(1003, 'SF Said'),
(1004, 'John Kennedy Toole'),
(1005, 'Frank G. Slaughter'),
(1006, 'David L. Dotlich'),
(1007, 'Michael Kurland'),
(1008, 'Lemony Snicket'),
(1009, 'Lemony Snicket'),
(1010, 'Lemony Snicket'),
(1011, 'Alexa Martin'),
(1012, 'Robin Cook'),
(1013, 'Whitney Scharer'),
(1014, 'David Baldacci'),
(1015, 'James Thurber'),
(1016, 'Sandra Brown'),
(1017, 'Sylvain Reynard'),
(1018, 'Jessica Fletcher'),
(1019, 'Stephanie Hemphill'),
(1020, 'Steven King'),
(1021, 'Mary Shelly'),
(1022, 'David Bowman')


CREATE TABLE Book_Copies(
	BranchId INT FOREIGN KEY REFERENCES Library_Branch(BranchID) NOT NULL,
	BookID INT FOREIGN KEY REFERENCES Books(BookId) NOT NULL,
	Number_Of_Copies INT NOT NULL
);

INSERT INTO Book_Copies (BranchId, BookID, Number_Of_Copies)
VALUES
(1,1000,4),
(1,1020,5),
(1,1008,4),
(1,1014,5),
(1,1006,4),
(1,1001,5),
(1,1022,4),
(1,1021,5),
(1,1003,4),
(1,1005,5),
(2,1001,4),
(2,1003,5),
(2,1007,4),
(2,1009,5),
(2,1011,4),
(2,1013,5),
(2,1015,4),
(2,1017,5),
(2,1019,4),
(2,1000,5),
(3,1000,4),
(3,1002,5),
(3,1004,4),
(3,1006,5),
(3,1008,4),
(3,1010,5),
(3,1012,4),
(3,1014,5),
(3,1016,4),
(3,1018,5),
(4,1001,4),
(4,1003,5),
(4,1008,4),
(4,1010,5),
(4,1011,4),
(4,1013,5),
(4,1016,4),
(4,1020,5),
(4,1021,4),
(4,1022,5)

CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(500,1),
	Name varchar(50) NOT NULL,
	Address varchar(75) NOT NULL,
	Phone varchar(15) NOT NULL
);

INSERT INTO Borrower (Name, Address, Phone)
VALUES
('Adam J', '123 Tory Ln','555-254-351'),
('Andrew W', '518 Ozzy Rd','555-254-351'),
('Zack D', '621 Butter St','555-254-351'),
('Chance M', '202 Ford Ave','503-254-351'),
('Jack A', '162 1st St','555-254-351'),
('Sean C', '309 Right Way','555-254-351'),
('Carl T', '903 Wrong Way','555-254-351'),
('Hayes D', '248 50th Cir','555-254-351'),
('Thomas M', '777 Lucky Rd','555-254-351'),
('Scott A', 'Nowhere Pl','555-254-351')

CREATE TABLE Book_Loans (
	BookId INT NOT NULL FOREIGN KEY REFERENCES Books(BookId),
	BranchId INT NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchId),
	CardNo INT NOT NULL FOREIGN KEY REFERENCES Borrower(CardNo),
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

INSERT INTO Book_Loans (BookID, BranchId, CardNo, DateOut, DateDue)
VALUES
(1000,1,500,'20190314','20190324'),
(1000,1,501,'20190314','20190324'),
(1000,1,502,'20190314','20190324'),
(1020,1,500,'20190314','20190324'),
(1014,1,500,'20190314','20190324'),
(1006,1,500,'20190314','20190324'),
(1014,1,500,'20190314','20190324'),
(1003,2,501,'20190314','20190324'),
(1007,2,501,'20190314','20190324'),
(1017,2,500,'20190314','20190324'),
(1013,2,501,'20190314','20190324'),
(1019,2,501,'20190314','20190324'),
(1015,2,501,'20190314','20190324'),
(1018,2,503,'20190314','20190324'),
(1001,2,503,'20190314','20190324'),
(1011,2,504,'20190314','20190324'),
(1003,2,504,'20190314','20190324'),
(1011,2,505,'20190314','20190324'),
(1001,1,505,'20190314','20190324'),
(1000,3,504,'20190314','20190324'),
(1004,3,504,'20190314','20190324'),
(1006,3,504,'20190314','20190324'),
(1012,3,504,'20190314','20190324'),
(1008,3,500,'20190314','20190324'),
(1010,3,500,'20190314','20190324'),
(1002,3,505,'20190314','20190324'),
(1006,3,505,'20190314','20190324'),
(1014,3,505,'20190314','20190324'),
(1018,3,505,'20190314','20190324'),
(1018,3,506,'20190314','20190324'),
(1001,4,506,'20190314','20190324'),
(1011,4,506,'20190314','20190324'),
(1013,4,506,'20190314','20190324'),
(1016,4,506,'20190314','20190324'),
(1008,4,502,'20190314','20190324'),
(1010,4,502,'20190314','20190324'),
(1022,4,502,'20190314','20190324'),
(1022,4,507,'20190314','20190324'),
(1021,4,507,'20190314','20190324'),
(1001,4,507,'20190314','20190324'),
(1002,3,507,'20190314','20190324'),
(1006,3,507,'20190314','20190324'),
(1019,3,507,'20190314','20190324'),
(1001,1,508,'20190314','20190324'),
(1000,2,508,'20190314','20190324'),
(1004,3,508,'20190314','20190324'),
(1021,4,508,'20190314','20190324'),
(1022,4,508,'20190314','20190324'),
(1008,4,508,'20190314','20190324'),
(1010,4,508,'20190314','20190324')



USE LibraryData
GO
CREATE PROC Sharpstown_Tribe
AS
SELECT BranchName, Title, Number_Of_Copies
FROM Library_Branch
INNER JOIN Book_Copies
ON Book_Copies.BranchId = Library_Branch.BranchId
INNER JOIN Books
ON Books.BookId = Book_Copies.BookID
WHERE BranchName = 'Sharpstown'
AND
Title = 'The Lost Tribe'
GO

EXEC [dbo].[Sharpstown_Tribe]

USE LibraryData
GO
CREATE PROC Branches_Tribe
AS
SELECT BranchName, Title, Number_Of_Copies
FROM Library_Branch
INNER JOIN Book_Copies
ON Book_Copies.BranchId = Library_Branch.BranchId
INNER JOIN Books
ON Books.BookId = Book_Copies.BookID
WHERE Title = 'The Lost Tribe'
GO

EXEC [dbo].[Branches_Tribe]


USE LibraryData
GO
CREATE PROC NoCheckouts
AS
SELECT Borrower.Name, BookID
FROM Borrower
LEFT OUTER JOIN Book_Loans ON Borrower.CardNo = Book_Loans.CardNo
WHERE BookID IS NULL
GO

EXEC [dbo].[NoCheckouts]

USE LibraryData
GO
CREATE PROC Sharpstown_DueToday
AS
SELECT DateDue, Title, Borrower.Name, Borrower.Address
FROM Book_Loans
INNER JOIN Borrower ON Borrower.CardNo = Book_Loans.CardNo
INNER JOIN Books ON Books.BookId = Book_Loans.BookId
WHERE DateDue = getdate()
GO

EXEC [dbo].[Sharpstown_DueToday]

USE LibraryData
GO
CREATE PROC Books_Out
AS
SELECT
COUNT(Book_Loans.BookID) AS 'Total Out', BranchName
FROM
Book_Loans
INNER JOIN Library_Branch ON Library_Branch.BranchId = Book_Loans.BranchId
GROUP BY BranchName
GO

EXEC [dbo].[Books_Out]

USE LibraryData
GO
CREATE PROC Out_Over_5
AS
SELECT
Name, Address, COUNT(BookID) AS 'Total Out'
FROM
Book_Loans
INNER JOIN
Borrower
ON
Book_Loans.CardNo = Borrower.CardNo
GROUP BY Address, Name
HAVING COUNT(BookID) > 5
GO

EXEC [dbo].[Out_Over_5]

USE LibraryData
GO
CREATE PROC SKing_Central
AS
SELECT
BranchName, Title, AuthorName, Number_Of_Copies
FROM
Library_Branch
INNER JOIN
Book_Copies
ON
Book_Copies.BranchId = Library_Branch.BranchId
INNER JOIN
Books
ON
Books.BookId = Book_Copies.BookID
INNER JOIN
Book_Author
ON 
Book_Author.BookId = Books.BookId
WHERE
AuthorName = 'Steven King'
AND
Library_Branch.BranchId = 1
GO

EXEC [dbo].[SKing_Central]
