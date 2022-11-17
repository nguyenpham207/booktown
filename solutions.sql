-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject;
-- 2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;
-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT books.title
FROM books JOIN subjects ON books.subject_id = subjects.id
WHERE subjects.subject = 'Computers';
-- 7. Find all books and display a result table with ONLY the following columns

SELECT books.title, authors.first_name, authors.last_name, subjects.subject
FROM books 
JOIN authors ON books.author_id = authors.id
JOIN subjects ON books.subject_id = subjects.id;
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
-- 8. Find all books that are listed in the stock table
SELECT books.title, stock.retail
FROM stock
JOIN editions ON stock.isbn = editions.isbn
JOIN books ON editions.book_id = books.id
ORDER BY stock.retail DESC;
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- 9. Find the book "Dune" and display ONLY the following columns
SELECT books.title, editions.isbn, publishers.name, stock.retail
FROM books
JOIN editions ON books.id = editions.book_id
JOIN publishers ON editions.publisher_id = publishers.id
JOIN stock ON editions.isbn = stock.isbn
WHERE books.title = 'Dune';

-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- SELECT shipments.ship_date, customers.first_name, customers.last_name, books.title
-- FROM shipments
-- JOIN customers ON shipments.customer_id = customers.id
-- JOIN editions ON shipments.isbn = editions.isbn
-- JOIN books ON editions.book_id = books.id;
-- ORDER BY shipments.ship_date DESC; 
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT count(*) FROM books;
-- 12. Get the COUNT of all Locations
SELECT count(*) FROM Locations;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, count(location) FROM subjects GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.title, books.id, count(editions.book_id)
FROM books
JOIN editions ON books.id = editions.book_id
GROUP BY books.id;