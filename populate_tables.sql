INSERT INTO branch (BranchID, Name, Address, PhoneNumber) VALUES (100, 'Meadowvale Library', '31 Pine Ave', '905-615-4710');
INSERT INTO branch (BranchID, Name, Address, PhoneNumber) VALUES (101, 'Toronto Public Library', '123 Main St', '416-395-5577');
INSERT INTO branch (BranchID, Name, Address, PhoneNumber) VALUES (102, 'Streetsville Library', '112 Queen St', '905-615-4785');
INSERT INTO branch (BranchID, Name, Address, PhoneNumber) VALUES (103, 'Hazel McCallion Library', '135 Maple Rd', '905-615-3500');
INSERT INTO branch (BranchID, Name, Address, PhoneNumber) VALUES (104, 'Woodlands Library', '42 Erindale Rd', '905-615-4825');
-- Populated Table: Branch
INSERT INTO librarian (LibrarianID, FirstName, LastName, StaffPosition, BranchID) VALUES (1000, 'Ava', 'Evans', 'Head Librarian', 100);
INSERT INTO librarian (LibrarianID, FirstName, LastName, StaffPosition, BranchID) VALUES (1001, 'Sasha', 'Smith', 'Assistant Librarian', 100);
INSERT INTO librarian (LibrarianID, FirstName, LastName, StaffPosition, BranchID) VALUES (1002, 'John', 'Winters', 'Head Librarian', 101);
INSERT INTO librarian (LibrarianID, FirstName, LastName, StaffPosition, BranchID) VALUES (1003, 'Paola', 'Santos', 'Head Librarian', 102);
INSERT INTO librarian (LibrarianID, FirstName, LastName, StaffPosition, BranchID) VALUES (1004, 'Craig', 'Pierce', 'Assistant Librarian', 102);
INSERT INTO librarian (LibrarianID, FirstName, LastName, StaffPosition, BranchID) VALUES (1006, 'Mariam', 'Gomez', 'Head Librarian', 103);
INSERT INTO librarian (LibrarianID, FirstName, LastName, StaffPosition, BranchID) VALUES (1005, 'Tanya', 'Lopez', 'Assistant Librarian', 103);
INSERT INTO librarian (LibrarianID, FirstName, LastName, StaffPosition, BranchID) VALUES (1007, 'Jordan', 'Brown', 'Head Librarian', 104);
-- Populated Table: Librarian
INSERT INTO library_member (MemberID, FirstName, LastName, Email, Address, PhoneNumber, BranchID) VALUES (1900, 'Joe', 'Brown', 'joebrown@icloud.com', '123 Winter Lane', '647-090-5434', 100);
INSERT INTO library_member (MemberID, FirstName, LastName, Email, Address, PhoneNumber, BranchID) VALUES (1901, 'Alyssa', 'Walters', 'a.walters@outlook.com', '2345 Willow Lane', '647-908-2378', 100);
INSERT INTO library_member (MemberID, FirstName, LastName, Email, Address, PhoneNumber, BranchID) VALUES (1902, 'Emily', 'Hastings', 'emilyhastings@gmail.com', '24 Cedarbrook Drive', '647-345-3434', 100);
INSERT INTO library_member (MemberID, FirstName, LastName, Email, Address, PhoneNumber, BranchID) VALUES (1903, 'Ricky', 'Chen', 'rchen3@outlook.com', '3856 Pinehill Road', '416-223-9872', 100);
INSERT INTO library_member (MemberID, FirstName, LastName, Email, Address, PhoneNumber, BranchID) VALUES (1904, 'Samir', 'Chopra', 'choprasamir@gmail.com', '2246 Snowberry Way', '905-335-2873', 100);
INSERT INTO library_member (MemberID, FirstName, LastName, Email, Address, PhoneNumber, BranchID) VALUES (1905, 'Amirah', 'Clarke', 'am.clarke3@icloud.com', '89 Maplewood Crescent', '647-223-8912', 100);
INSERT INTO library_member (MemberID, FirstName, LastName, Email, Address, PhoneNumber, BranchID) VALUES (1906, 'Kye', 'Bell', 'kylebell@outlook.com', '3476 Riverbend Court', '416-345-8972', 100);
INSERT INTO library_member (MemberID, FirstName, LastName, Email, Address, PhoneNumber, BranchID) VALUES (1907, 'Dianne', 'Choi', 'choidianne22@gmail.com', '143 Lakeview Terrace', '416-826-9056', 100);
-- Populated Table: Library Member
INSERT INTO author (AuthorID, FirstName, LastName) VALUES (123, 'Ali', 'Hazelwood');
INSERT INTO author (AuthorID, FirstName, LastName) VALUES (456, 'Jane', 'Austen');
INSERT INTO author (AuthorID, FirstName, LastName) VALUES (789, 'Nicholas', 'Sparks');
INSERT INTO author (AuthorID, FirstName, LastName) VALUES (321, 'Nora', 'Robers');
INSERT INTO author (AuthorID, FirstName, LastName) VALUES (543, 'Emily', 'Henry');
INSERT INTO author (AuthorID, FirstName, LastName) VALUES (111, 'Colleen', 'Hoover');
INSERT INTO author (AuthorID, FirstName, LastName) VALUES (740, 'John', 'Green');
INSERT INTO author (AuthorID, FirstName, LastName) VALUES (333, 'Rachael', 'Lippincott');
INSERT INTO author (AuthorID, FirstName, LastName) VALUES (602, 'Mikki', 'Daughtry');
INSERT INTO author (AuthorID, FirstName, LastName) VALUES (212, 'Tobias', 'Iaconis');
-- Populated Table: Author
INSERT INTO publisher (PublisherID, Name) VALUES (10, 'Atria Books');
INSERT INTO publisher (PublisherID, Name) VALUES (11, 'Harper Collins');
INSERT INTO publisher (PublisherID, Name) VALUES (12, 'Simon and Schuster');
INSERT INTO publisher (PublisherID, Name) VALUES (13, 'Penguin Books');
INSERT INTO publisher (PublisherID, Name) VALUES (14, 'Berkley');
-- Populated Table: Publisher
INSERT INTO genre (CategoryID, Name) VALUES (22, 'Poetry');
INSERT INTO genre (CategoryID, Name) VALUES (23, 'History');
INSERT INTO genre (CategoryID, Name) VALUES (24, 'Mystery');
INSERT INTO genre (CategoryID, Name) VALUES (25, 'Romance');
INSERT INTO genre (CategoryID, Name) VALUES (26, 'Science Fiction');
INSERT INTO genre (CategoryID, Name) VALUES (27, 'Fiction');
INSERT INTO genre (CategoryID, Name) VALUES (28, 'Biography');
INSERT INTO genre (CategoryID, Name) VALUES (29, 'Autobiography');
INSERT INTO genre (CategoryID, Name) VALUES (30, 'Non-Fiction');
INSERT INTO genre (CategoryID, Name) VALUES (31, 'Children');
INSERT INTO genre (CategoryID, Name) VALUES (32, 'Historical Fiction');
-- Populated Table: Genre
INSERT INTO book_copy (BookID, ISBN, BranchID) VALUES (1234, '34230', 100);
INSERT INTO book_copy (BookID, ISBN, BranchID) VALUES (5678, '23900', 101);
INSERT INTO book_copy (BookID, ISBN, BranchID) VALUES (9876, '23233', 100);
INSERT INTO book_copy (BookID, ISBN, BranchID) VALUES (4353, '23111', 104);
INSERT INTO book_copy (BookID, ISBN, BranchID) VALUES (2313, '94832', 102);
INSERT INTO book_copy (BookID, ISBN, BranchID) VALUES (2547, '97815', 101);
INSERT INTO book_copy (BookID, ISBN, BranchID) VALUES (7588, '81542', 103);
INSERT INTO book_copy (BookID, ISBN, BranchID) VALUES (6443, '52547', 103);
INSERT INTO book_copy (BookID, ISBN, BranchID) VALUES (9046, '25475', 100);
INSERT INTO book_copy (BookID, ISBN, BranchID) VALUES (2234, '90345', 101);
-- Populated Table: Book Copy
INSERT INTO book_details (ISBN, Title, PublisherID, CategoryID, ReleaseYear, BookType) VALUES ('34230', 'It ends with us', 10, 22, 2020, 'Ebook');
INSERT INTO book_details (ISBN, Title, PublisherID, CategoryID, ReleaseYear, BookType) VALUES ('23900', 'Maybe one day', 10, 26, 2024, 'Hardcover');
INSERT INTO book_details (ISBN, Title, PublisherID, CategoryID, ReleaseYear, BookType) VALUES ('23233', 'Book lovers', 14, 25, 2005, 'Paperback');
INSERT INTO book_details (ISBN, Title, PublisherID, CategoryID, ReleaseYear, BookType) VALUES ('23111', 'The fault in our stars', 13, 25, 2004, 'Hardcover');
INSERT INTO book_details (ISBN, Title, PublisherID, CategoryID, ReleaseYear, BookType) VALUES ('94832', 'Five feet apart', 12, 24, 2017, 'Hardcover');
INSERT INTO book_details (ISBN, Title, PublisherID, CategoryID, ReleaseYear, BookType) VALUES ('97815', 'Verity', 10, 24, 2017, 'Paperback');
INSERT INTO book_details (ISBN, Title, PublisherID, CategoryID, ReleaseYear, BookType) VALUES ('81542', 'Reminders of Him', 12, 25, 2022, 'Paperback');
INSERT INTO book_details (ISBN, Title, PublisherID, CategoryID, ReleaseYear, BookType) VALUES ('52547', 'The Fault in Our Stars', 12, 27, 2012, 'Hardcover');
INSERT INTO book_details (ISBN, Title, PublisherID, CategoryID, ReleaseYear, BookType) VALUES ('25475', 'Looking for Alaska', 13, 24, 2005, 'Hardcover');
INSERT INTO book_details (ISBN, Title, PublisherID, CategoryID, ReleaseYear, BookType) VALUES ('90345', 'Funny Story', 14, 25, 2020, 'Hardcover');
-- Populated Table: Book Details
INSERT INTO written_by (BookID, AuthorID) VALUES (1234, 123);
INSERT INTO written_by (BookID, AuthorID) VALUES (5678, 456);
INSERT INTO written_by (BookID, AuthorID) VALUES (9876, 789);
INSERT INTO written_by (BookID, AuthorID) VALUES (4353, 543);
INSERT INTO written_by (BookID, AuthorID) VALUES (1234, 111);
INSERT INTO written_by (BookID, AuthorID) VALUES (4353, 740);
INSERT INTO written_by (BookID, AuthorID) VALUES (2313, 333);
INSERT INTO written_by (BookID, AuthorID) VALUES (2313, 602);
INSERT INTO written_by (BookID, AuthorID) VALUES (2313, 212);
-- Populated Table: Written By
INSERT INTO borrows (MemberID, BookID, BorrowDate, ReturnDate, FineAmount) VALUES (1900, 1234, TO_DATE('2025-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-15', 'YYYY-MM-DD'), 0);
INSERT INTO borrows (MemberID, BookID, BorrowDate, ReturnDate, FineAmount) VALUES (1902, 5678, TO_DATE('2025-09-05', 'YYYY-MM-DD'), NULL, 0);
INSERT INTO borrows (MemberID, BookID, BorrowDate, ReturnDate, FineAmount) VALUES (1903, 9876, TO_DATE('2025-09-10', 'YYYY-MM-DD'), NULL, 0);
INSERT INTO borrows (MemberID, BookID, BorrowDate, ReturnDate, FineAmount) VALUES (1904, 4353, TO_DATE('2025-09-12', 'YYYY-MM-DD'), TO_DATE('2025-09-20', 'YYYY-MM-DD'), 5);
INSERT INTO borrows (MemberID, BookID, BorrowDate, ReturnDate, FineAmount) VALUES (1905, 2313, TO_DATE('2025-09-15', 'YYYY-MM-DD'), NULL, 0);
INSERT INTO borrows (MemberID, BookID, BorrowDate, ReturnDate, FineAmount) VALUES (1900, 4353, TO_DATE('2025-09-29', 'YYYY-MM-DD'), NULL, 0);
INSERT INTO borrows (MemberID, BookID, BorrowDate, ReturnDate, FineAmount) VALUES (1903, 1234, TO_DATE('2025-09-01', 'YYYY-MM-DD'), NULL, 7);
INSERT INTO borrows (MemberID, BookID, BorrowDate, ReturnDate, FineAmount) VALUES (1902, 4353, TO_DATE('2025-09-22', 'YYYY-MM-DD'), TO_DATE('2025-09-25', 'YYYY-MM-DD'), 0);
-- Populated Table: Borrows