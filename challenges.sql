-- Show all the psql users. (Hint: Look for a command to show roles)
\dg

-- Show all the tables in your apartmentlab database.
\dt
-- Show all the data in the owners table.
SELECT * FROM owner;
-- Add three owners: Donald (age 56), Elaine (age 24), and Emma (age 36).
INSERT INTO owner(id, name, age) VALUES(1, 'Donald', 56), (2, 'Elaine', 24), (3, 'Emma', 36);
-- Show the names of all owners.
SELECT name FROM owner;
-- Show the ages of all of the owners in ascending order.
SELECT age FROM owner;
-- Show the name of an owner whose name is Donald.
SELECT * FROM owner WHERE name = 'Donald';
-- Show the age of all owners who are older than 30.
SELECT * FROM owner WHERE age > 30 ORDER BY age;
-- Show the name of all owners whose name starts with an "E".
SELECT * FROM owner WHERE name LIKE 'E%';
-- Add an owner named John who is 33 years old.
INSERT INTO owner(name, age) VALUES(4, 'John', 33); 
-- Add an owner named Jane who is 43 years old.
INSERT INTO owner(name, age) VALUES(5, 'Jane', 43);
-- Change Jane's age to 30.
UPDATE owner SET age = 30 WHERE age = 43;
-- Change Jane's name to Janet.
UPDATE owner SET name = 'Janet', WHERE name = 'Jane';
-- Delete the owner named Janet.
DELETE FROM owner WHERE name = 'Janet' RETURNING *;
-- Add a property named Archstone that has 20 units.
INSERT INTO properties(name, num_units) VALUES('Archstone', 20);
-- Add two properties with names and numbers of units of your choice.
INSERT INTO properties(name, num_units)VALUES('Creek', 15), ('Lake Merritt', 24);
-- Show all of the properties in alphabetical order that are not named Archstone.
SELECT * FROM properties WHERE name <> 'Archstone' ORDER BY name ASC;
-- Count the total number of rows in the properties table.
SELECT COUNT (*) FROM properties;
-- Show the highest age of all the owners.
SELECT MAX(age) FROM owner;
-- Show the names of the first three owners in your owners table.
SELECT name FROM owner LIMIT 3; 'Donald', 'Elaine', 'Emma'
-- Use a FULL OUTER JOIN to show all of the information from the owners table and the properties table.
SELECT * FROM owner FULL OUTER JOIN properties ON owner.id = properties.owner_id;
-- Update at least one of your properties to belong to the owner with id 1.
UPDATE properties SET owner_id = 1 WHERE name = 'Archstone'; SELECT * FROM owner FULL OUTER JOIN properties ON owner.id = properties.owner_id;
-- Use an INNER JOIN to show all of the owners with associated properties.
SELECT * FROM owner INNER JOIN properties ON owner.id = properties.owner_id;
-- Use a CROSS JOIN to show all possible combinations of owners and properties.
SELECT * FROM owner CROSS JOIN properties WHERE owner.id = 1;