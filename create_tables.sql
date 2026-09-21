-- Created table: Branch
CREATE TABLE branch (
    BranchID INT PRIMARY KEY,
    Name VARCHAR2(30) NOT NULL,
    Address VARCHAR2(30),
    PhoneNumber VARCHAR2(15)
);
-- Created table: Librarian
CREATE TABLE librarian (
    LibrarianID INT PRIMARY KEY,
    FirstName VARCHAR2(25) NOT NULL,
    LastName VARCHAR2(25) NOT NULL,
    StaffPosition VARCHAR2(30),
    BranchID INT REFERENCES branch(BranchID)
);
-- Created table: Library Member
CREATE TABLE library_member (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR2(25) NOT NULL,
    LastName VARCHAR2(25) NOT NULL,
    Email VARCHAR2(40) UNIQUE,
    Address VARCHAR2(60),
    PhoneNumber VARCHAR2(15),
    BranchID INT REFERENCES branch(BranchID)
);
-- Created table: Author
CREATE TABLE author (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR2(25) NOT NULL,
    LastName VARCHAR2(25) NOT NULL
);
-- Created table: Publisher
CREATE TABLE publisher (
    PublisherID INT PRIMARY KEY,
    Name VARCHAR2(50) NOT NULL
);
-- Created table: Genre
CREATE TABLE genre (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR2(30) NOT NULL
);
-- Created table: Book Copy
CREATE TABLE book_copy (
    BookID INT PRIMARY KEY,
    ISBN VARCHAR2(20) UNIQUE,
    BranchID INT REFERENCES branch(BranchID)
);
-- Created table: Book Details
CREATE TABLE book_details (
    ISBN VARCHAR2(20) PRIMARY KEY,
    Title VARCHAR2(50) NOT NULL,
    PublisherID INT REFERENCES publisher(PublisherID) ,
    CategoryID INT REFERENCES genre(CategoryID),
    ReleaseYear INT,
    BookType VARCHAR2(10)
);
-- Created table: Written By
CREATE TABLE written_by (
    BookID INT REFERENCES book_copy(BookID),
    AuthorID INT REFERENCES author(AuthorID),
    PRIMARY KEY(BookID, AuthorID)
);
-- Created table: Borrows
CREATE TABLE borrows (
    MemberID INT REFERENCES library_member(MemberID),
    BookID INT REFERENCES book_copy(BookID),
    PRIMARY KEY (MemberID, BookID),
    BorrowDate DATE DEFAULT SYSDATE,
    ReturnDate DATE DEFAULT NULL,
    FineAmount NUMBER DEFAULT 0
);