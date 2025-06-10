# 🏫 School Management System — SQL Analytics

This project simulates a brazilian school management system, using SQL to explore and extract educational insights from a relational database. A total of 25 analytical SQL scripts were developed, covering areas such as academic performance, attendance, enrollment, faculty, and more.
All data are fictitious and intended for portfolio and learning purposes only.

---

🧠 **Key Skills Demonstrated**

* SQL (CTEs, joins, aggregations, ranking functions)
* Data modeling & healthcare KPIs
* Analytical thinking and storytelling
* Realistic database simulation with Brazilian health plan structure

---

## 🗃️ Database Structure

The project uses the following core tables (in .csv format):

- `alunos` (students): personal information (name, age, neighborhood, enrollment/completion dates)
- `turmas` (classes): class data per academic year and shift
- `disciplinas` (subjects): list of subjects offered
- `professor`: teacher records
- `professor_disciplina`: links teachers to subjects
- `historico`: historical records per student, including grades, attendance, status, year, and class

---

## 📑 Developed Scripts

### 📊 Academic Performance

1. Ranking of students by final average in each class  
2. Students who failed by subject and grade  
3. Average grades by subject and grade  
4. Evolution of student performance over the years (per student)  
5. Analysis of attendance vs. approval (correlation between absences and failure)  

### 🎒 Enrollment and Retention

6. Number of enrollments per academic year  
7. Average age at enrollment per year  
8. School dropout rate by year/grade  
9. Number of students per class  
10. Student age group distribution per academic year  

### 👨🏻‍🏫 Teachers and Subjects

11. Teachers who teach more than one subject  
12. Total workload per teacher (based on subjects taught)  
13. List of active teachers by school shift  
14. Distribution of teachers by age group and gender  
15. Number of classes coordinated by each teacher  

### 📚 Classes

16. Number of students per class/grade  
17. Most crowded school shifts (morning/afternoon) per year  
18. Average performance comparison between classes A, B, and C of the same grade  
19. Relationship between grade, average student age, and academic year  
20. Classes with the highest approval rate  

### 🧾 Extras

21. Students with no father’s name and above-average performance  
22. Top 10 students with highest attendance per year  
23. Subject ranking by number of failures  
24. Neighborhoods with the highest approval rates  
25. Students with high attendance but low academic performance  

---

## 🛠️ Tools Used

- SQL (MySQL)
- DBeaver (or any database manager of your choice)

---

🗃️ **Files**

/1 - Academic Perfomance – 5 SQL scripts (.sql format)

/2 - Enrollment and Retention – 5 SQL scripts (.sql format)

/3 - Teachers and Subjects – 5 SQL scripts (.sql format)

/4 - Classes – 5 SQL scripts (.sql format)

/5 - Extras – 5 SQL scripts (.sql format)

/Creating Database – Database tables in CSV

README.md – Project documentation

---

🚀 **How to Use**

You can import the .csv files into any relational database (like MySQL, PostgreSQL, SQLite) and execute the scripts directly.

---

📌 **Important Notes**

This dataset was entirely generated with Python and does not reflect real patient data.

Some scripts use CTEs (WITH), window functions like ROW_NUMBER(), and date functions like DATEDIFF().

---

## 📬 Contact

- Email: gioferracini97@gmail.com
- LinkedIn: [linkedin.com/in/giovanni-ferracini](https://www.linkedin.com/in/giovanni-ferracini/)

---

⭐ If you found this analysis useful or insightful, feel free to star the repository!
