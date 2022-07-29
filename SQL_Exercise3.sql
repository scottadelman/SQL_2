/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT p.name, c.name
FROM products p 
INNER JOIN categories c
ON p.CategoryID = c.CategoryID
WHERE c.Name = "Computers";


/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 
SELECT p.Name, p.Price, r.rating
From products p
LEFT JOIN reviews r
ON p.ProductID = r.ProductID
where r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT e.FirstName, e.LastName, Sum(s.Quantity) as Sum
FROM sales s
INNER JOIN employees e
on e.EmployeeID = s.EmployeeID
group by e.FirstName, e.LastName
order by Sum Desc
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT d.Name, c.Name
FROM departments d
INNER JOIN categories c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = 'Appliances' or c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
SELECT p.Name, Sum(s.Quantity), (p.price * Sum(s.quantity))
FROM products p
INNER JOIN sales s
ON p.ProductID = s.ProductID
WHERE p.Name LIKE "Eagles: Hotel California"
GROUP BY p.Name, p.Price;
 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE products.Name LIKE "Visio TV"
ORDER BY reviews.Rating
Limit 1;