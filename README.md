# 🐘 SQL Queries For Practice and Training

[![GitHub repo size](https://img.shields.io/github/repo-size/youneskara1699-zero/SQL-queries-For-practice-and-training)](https://github.com/youneskara1699-zero/SQL-queries-For-practice-and-training)
[![GitHub last commit](https://img.shields.io/github/last-commit/youneskara1699-zero/SQL-queries-For-practice-and-training)](https://github.com/youneskara1699-zero/SQL-queries-For-practice-and-training/commits/main)

A comprehensive collection of **150 essential SQL queries** for practicing and training, based on a realistic **HR Database**. Perfect for beginners and intermediate users looking to strengthen their SQL skills.

---

## 📚 What's Inside

- **`sql_queries_150_essential_practice_HR_Database.sql`**  
  Contains 150 SQL queries of varying difficulty: basic `SELECT`, filtering, joins, aggregations, subqueries, window functions, and more.

- **`HR_Database.bak`**  
  A backup file of the sample **Human Resources (HR) database**. Restore it to SQL Server (or compatible) to have the exact dataset used for the queries.

- **`README.md`** (this file)

---

## 🗄️ About the HR Database

The HR database simulates a real company's employee structure, including tables like:

- `employees` – personal and job details  
- `departments` – department list  
- `jobs` – job titles and salary ranges  
- `locations` – company office locations  
- `countries` / `regions` – geographical data  
- `dependents` – employee family members

> **Note**: The `.bak` file is likely created with **Microsoft SQL Server**. You can also adapt the queries to MySQL, PostgreSQL, or SQLite with minor syntax changes.

---

## 🚀 How to Use This Repository

### 1. Restore the HR Database (SQL Server)

```sql
RESTORE DATABASE HR_Database
FROM DISK = 'C:\path\to\HR_Database.bak'
WITH REPLACE;

For other DBMS (MySQL, PostgreSQL):
Use the .sql file to create tables and insert data manually, or search online for an HR schema script in your dialect.

2. Run the Practice Queries
Open the sql_queries_150_essential_practice_HR_Database.sql file in your SQL client and execute the queries one by one or in sections.

3. Learn and Experiment
Modify WHERE conditions

Add new JOIN combinations

Try to rewrite a query using a different approach (e.g., EXISTS vs IN)

📋 Example Query (from the collection)

-- Find the highest paid employee in each department
SELECT 
    d.department_name,
    e.first_name,
    e.last_name,
    e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE (e.department_id, e.salary) IN (
    SELECT department_id, MAX(salary)
    FROM employees
    GROUP BY department_id
);

📊 Query Difficulty Breakdown
Level	Description	Example Topics
🟢 Basic	Foundational queries	SELECT, WHERE, ORDER BY, LIMIT
🔵 Intermediate	Multi-table operations	JOINs, GROUP BY, HAVING, subqueries
🔴 Advanced	Complex analytics	Window functions, CTEs, recursive queries
🎯 Practice Goals
After completing these 150 queries, you will be able to:

✅ Write complex SELECT statements with multiple conditions
✅ Master all types of JOIN (INNER, LEFT, RIGHT, FULL, SELF)
✅ Use aggregate functions effectively (COUNT, SUM, AVG, MAX, MIN)
✅ Implement subqueries and correlated subqueries
✅ Apply window functions (ROW_NUMBER, RANK, LAG, LEAD)
✅ Work with Common Table Expressions (CTEs)
✅ Optimize query performance using indexes and execution plans

🛠️ Recommended Tools
Tool	Purpose
SQL Server Management Studio (SSMS)	Best for .bak restore
Azure Data Studio	Cross-platform alternative
DBeaver	Universal database tool
MySQL Workbench	For MySQL users
pgAdmin	For PostgreSQL users

📈 Sample Database Schema

┌─────────────┐     ┌──────────────┐     ┌─────────┐
│ departments │     │   employees  │     │  jobs   │
├─────────────┤     ├──────────────┤     ├─────────┤
│ department_id│◄───│department_id │     │ job_id  │◄──┐
│ department_name│   │ employee_id  │     │ job_title│  │
│ location_id │     │ first_name   │     │ min_salary│  │
└─────────────┘     │ last_name    │     │ max_salary│  │
                    │ email        │     └─────────┘  │
                    │ phone_number │                  │
                    │ hire_date    │                  │
                    │ job_id       │──────────────────┘
                    │ salary       │
                    │ manager_id   │───────┐
                    └──────────────┘       │
                         │                 │
                    ┌────▼─────┐       ┌───▼──────┐
                    │dependents│       │employees │
                    ├──────────┤       │(self-ref)│
                    │dependent_id│     └──────────┘
                    │employee_id│
                    └──────────┘

🧪 Testing Your Knowledge
Try these challenges after practicing:

Find employees who earn more than their manager

Calculate the salary percentile for each employee

Find departments with average salary above company average

Identify employees hired in the last 30 days

Create a report showing salary growth over time

🤝 Contributing
Found a bug or have an improved version of a query?
Feel free to open an Issue or submit a Pull Request. All contributions are welcome.

Contribution Guidelines
Fork the repository

Create a feature branch (git checkout -b improve-query)

Commit your changes (git commit -m 'Improve query #42')

Push to the branch (git push origin improve-query)

Open a Pull Request

❓ Frequently Asked Questions
Q: Can I use these queries with MySQL?
A: Yes, with minor syntax adjustments (e.g., TOP → LIMIT, GETDATE() → NOW()).

Q: Do I need to restore the .bak file?
A: Only if you want the exact dataset. Otherwise, create your own tables.

Q: Are there solutions to these queries?
A: The .sql file contains the queries themselves. Study them to understand the solutions.

Q: Can I share these queries in my course/tutorial?
A: Yes, with proper attribution to this repository.

📚 Additional Resources
SQL Tutorial by W3Schools

SQL Practice on LeetCode

Mode Analytics SQL Tutorial

PostgreSQL Documentation

MySQL Reference Manual

🙏 Acknowledgments
Inspired by classic HR database schemas used in SQL training

Thanks to all contributors who help improve this resource

Special thanks to the open-source SQL community




