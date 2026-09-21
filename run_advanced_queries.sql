-- Advanced Query 1: Display all books currently being borrowed, with branch and member info
------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW current_borrows AS
SELECT
    br.Name AS Branch,
    bd.Title AS Book,
    m.MemberID,
    m.FirstName AS Member_FName,
    m.LastName AS Member_LName,
    bw.BorrowDate
FROM borrows bw
JOIN book_copy bc ON bw.BookID = bc.BookID
JOIN book_details bd ON bc.ISBN = bd.ISBN
JOIN library_member m ON bw.MemberID = m.MemberID
JOIN branch br ON bc.BranchID = br.BranchID
WHERE bw.ReturnDate IS NULL;
SELECT * FROM current_borrows;
-- Advanced Query 2: Find the most popular book (borrowed the most times)
------------------------------------------------------------------------------------------
SELECT 
    bd.Title AS Most_Popular_Book,
    COUNT(*) AS Total_Borrows
FROM 
    borrows bw
    JOIN book_copy bc ON bw.BookID = bc.BookID
    JOIN book_details bd ON bc.ISBN = bd.ISBN
GROUP BY 
    bd.Title
HAVING 
    COUNT(*) = (
        SELECT MAX(COUNT(*))
        FROM borrows
        GROUP BY BookID
    );
-- Advanced Query 3: Find the earliest published book in the system
------------------------------------------------------------------------------------------
SELECT 
    bd.ReleaseYear AS Release_Year,
    bd.Title,
    p.Name AS Publisher
FROM book_details bd
JOIN publisher p ON bd.PublisherID = p.PublisherID
WHERE bd.ReleaseYear = (SELECT MIN(ReleaseYear) FROM book_details);
-- Advanced Query 4: Find the average release year per book genre
------------------------------------------------------------------------------------------
SELECT
    g.Name AS Genre,
    ROUND(AVG(bd.ReleaseYear)) AS Average_Year
FROM book_details bd
JOIN genre g ON g.CategoryID = bd.CategoryID
GROUP BY g.Name
ORDER BY Average_Year;
-- Advanced Query 5: Create a view of all members who currently have fines
------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW current_fines AS
SELECT 
    lm.MemberID,
    lm.FirstName,
    SUM(b.FineAmount) AS TotalFine
FROM library_member lm
JOIN borrows b ON lm.MemberID = b.MemberID
WHERE b.FineAmount > 0
GROUP BY lm.MemberID, lm.FirstName;
SELECT * FROM current_fines;
-- Advanced Query 6: List all library members who do not currently have a book borrowed
------------------------------------------------------------------------------------------
SELECT 
    lm.MemberID,
    lm.FirstName,
    lm.LastName
FROM library_member lm
WHERE NOT EXISTS (
    SELECT *
    FROM borrows b
    WHERE b.MemberID = lm.MemberID
    AND b.ReturnDate IS NULL
);
-- Advanced Query 7: List all library branches that do not have any Assistant Librarians
------------------------------------------------------------------------------------------
SELECT 
    b.BranchID, 
    b.Name, 
    b.Address
FROM branch b
MINUS
SELECT DISTINCT 
    b.BranchID, 
    b.Name, 
    b.Address
FROM branch b
JOIN librarian l ON b.BranchID = l.BranchID
WHERE l.StaffPosition = 'Assistant Librarian';