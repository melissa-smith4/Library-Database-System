-- Simple Query 1: List all branch names alphabetically
------------------------------------------------------------------------------------------
SELECT DISTINCT Name
FROM branch
ORDER BY Name ASC;
-- Simple Query 2: List all librarians sorted by last name
------------------------------------------------------------------------------------------
SELECT LibrarianID, FirstName, LastName, StaffPosition, BranchID
FROM librarian
ORDER BY LastName ASC;
-- Simple Query 3: List all library members sorted by last name
------------------------------------------------------------------------------------------
SELECT MemberID, FirstName, LastName, Email, BranchID
FROM library_member
ORDER BY LastName ASC;
