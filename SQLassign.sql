CREATE TABLE Authors(AuthorID INT PRIMARY KEY NOT NULL,
FirstName VARCHAR(50),
LastName VARCHAR(50));

SELECT * FROM Authors;

CREATE TABLE Books(
BookID INT PRIMARY KEY NOT NULL,
Title VARCHAR(30),
AuthorID INT FOREIGN KEY REFERENCES Authors(AuthorID));

SELECT * FROM Books;

INSERT INTO Authors (AuthorID, FirstName, LastName)
VALUES (1, 'John', 'Doe'), (2, 'Jane', 'Smith'), (3, 'David', 'Johnson');

SELECT * FROM Authors;

INSERT INTO Books (BookID, Title, AuthorID)
VALUES (1, 'Book1', 1), (2, 'Book2', 2), (3, 'Book3', 3);

SELECT * FROM Books;

SELECT *
FROM Books
WHERE Title = 'Book2';

UPDATE Authors
SET LastName = 'Smithson'
WHERE AuthorID = (
    SELECT AuthorID
    FROM Books
    WHERE Title = 'Book1'
);

SELECT * FROM Authors;

DELETE FROM Books
WHERE AuthorID = 3;

DELETE FROM Authors
WHERE AuthorID = 3;

SELECT COUNT(*) AS TotalBooks
FROM Books;

SELECT Books.Title, Authors.FirstName, Authors.LastName
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID;



