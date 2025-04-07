📘 SQL Practice Project – Programmer & Software Database
📌 Overview
This project is a comprehensive SQL-based exploration of a relational database involving programmers, software, and study details. The queries are designed to answer real-world business and analytical questions using a normalized database structure, focusing on skill usage, sales, costs, gender analysis, and more.

🗃️ Database Structure
The project uses the following primary tables:

Programmer

Fields: pname, dob, gender, prof1, prof2, join_date

Describes individual programmers, their skills, and joining details.

Software

Fields: pname, developin, scost, dcost, sold

Records software developed by programmers along with development language and cost details.

Studies

Fields: pname, institute, course, course_fee

Contains information about where and what programmers have studied.

🔍 Core Objectives & Problem-Solving Techniques
The SQL queries address over 15 detailed business questions, such as:

Demographic Filtering

Retrieve software developed by male programmers born before 1965 and female programmers born after 1975.

Non-Contributing Programmers

Identify programmers who have not developed any software.

Duplicate Join Dates

Detect programmers who joined on the same date using HAVING COUNT(*) > 1.

Most Costly Packages

Find packages with the highest (scost + dcost).

Skill Utilization

Identify languages known by programmers but not used in any software development.

Revenue-Based Ranking

Highlight programmers generating the highest software revenue (scost * sold).

Low-Cost Institutes

Summarize packages developed by programmers from the cheapest course fee institutes.

Experience-Based Filtering

Identify packages developed by the most experienced programmers from a specific institute (BDPS).

Language Popularity

Count of programmers and total packages developed for each programming language (prof1, prof2, developin).

Profitability Check

Compare (scost * sold) with (2 * dcost) to detect profitable software.

🧠 Concepts Used
CTEs (Common Table Expressions)

UNION and UNION ALL

GROUP BY with HAVING

INNER and OUTER JOINS

Subqueries in WHERE clause

Aggregate functions: COUNT, SUM, AVG, MAX, MIN

Date and String functions

Nested queries

COALESCE for handling nulls

⚙️ Tools Used
Microsoft SQL Server

SSMS (SQL Server Management Studio)

Documentation: Microsoft Docs, SQL-style practice platforms

✅ Sample Query Highlight
sql
Copy
Edit
-- Languages known by programmers but not used in software development
WITH known_lang AS (
  SELECT prof1 AS lang FROM programmer
  UNION
  SELECT prof2 FROM programmer
),
used_lang AS (
  SELECT DISTINCT developin AS lang FROM software
)
SELECT lang
FROM known_lang
WHERE lang NOT IN (SELECT lang FROM used_lang);
💡 Key Takeaways
Strong hands-on practice with real-world SQL scenarios.

Practical understanding of data filtering, ranking, and summarizing.

Enhanced ability to interpret business logic and translate into efficient SQL queries.

Preparedness for technical SQL interviews.
