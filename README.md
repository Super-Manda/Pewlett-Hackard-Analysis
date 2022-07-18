# Pewlett-Hackard-Analysis :desktop_computer:

## Overview of the analysis  :older_adult:  :child:

###  - The purpose is to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. The analysis and summary will help prepare for the “silver tsunami” as many current employees reach retirement age.

- **The employee database is laid out as follows:**

![DB_Diagram](https://github.com/Super-Manda/Pewlett-Hackard-Analysis/blob/main/EmployeeDB.png)

## Results :older_man:  :boy:

### Four major points from the two analysis deliverables. 

-- **1.	First of all, some employees have taken promotions or title changes, so the duplicates were identified on the retirement_titles table and removed as shown:**

![Retirement_Titles](https://github.com/Super-Manda/Pewlett-Hackard-Analysis/blob/main/PNGs/retirement_titles_PNG.png)


**Then, using the birth years 1952 to 1955 as an approximation, the estimated number of distinct current employees eligible for retirement is 72,458.  Here is the same table with the duplicates removed, and with only current employees included:**

![unique_titles](https://github.com/Super-Manda/Pewlett-Hackard-Analysis/blob/main/PNGs/unique_titles.png)


-- **2.	Using the birth year 1965 as an approximation, there would be 1,549 people who are eligible for the mentorship program; however, this is only using a one-year span.  This number could be expanded in theory if the mentee parameter is expanded; nevertheless, an excerpt of this current roster is as follows:**

![Mentorship_Eligibility](https://github.com/Super-Manda/Pewlett-Hackard-Analysis/blob/main/PNGs/mentorship_eligibility_PNG.png)

-- **3.	There are only 7 job titles that would be affected by the silver tsunami, which are: Senior Engineer; Engineer; Assistant Engineer; Technique Leader; Manager; Senior Staff; and Staff.  Of these, only 2 people are Managers, which suggests that this job title has gone obsolete.  Senior Engineer and Senior Staff are by far the most populous categories.** 

![Retiring_Titles](https://github.com/Super-Manda/Pewlett-Hackard-Analysis/blob/main/PNGs/retiring_titles_PNG.png)


-- **4.	The technical titles of Senior Engineer, Engineer, Asst. Engineer, and Technique Leader would have 39,894 incumbents collectively, and these should ideally be the titles to target with the mentorship program because they are of more value to the company than generic jobs that can be learned from a textbook.  The technical jobs are likely associated with more institutional knowledge.** 

![prospective_technical_mentorship](https://github.com/Super-Manda/Pewlett-Hackard-Analysis/blob/main/PNGs/prospective_technical_mentors_PNG.png)

## Summary :older_woman:  :girl:

### Two Main Questions:
- **1.  How many roles will need to be filled as the "silver tsunami" begins to make an impact?**

- There are 72,458 distinct current employees whose positions would need to be refilled.


- **2.  Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?**

- No, there are only 1,549 with the current parameter of those with birth dates in the year 1965.  

### Two Additional Queries or Tables

###
**1.  Firstly, the department was added to the unique_titles table shown above so that HR can identify both the job title and the department code associated with each individual.  This is very critical.**

![Unique_Titles](https://github.com/Super-Manda/Pewlett-Hackard-Analysis/blob/main/PNGs/unique_titles_plus_department_added_PNG.png)

###
**As a continuation, the control sheets of where these 72,458 positions are located will also be quite helpful to HR when they conduct interviews because the same job title name may be used differently in different departments.  Thus, the following table would be more helpful to HR later:**

![ControlSheets_Prospective_Backfill_Positions](https://github.com/Super-Manda/Pewlett-Hackard-Analysis/blob/main/PNGs/prospective_backfill_positions_PNG.png)

**2.  Secondly, we must address the mismatch between mentors and mentees.  Rather than limit this organization to the year 1965, if eligibility is expanded to include 1963 to 1965, then suddenly, it becomes apparent that there are 38,401 total employees who fit that criteria, of which there are 20,907 of them in the titles of Senior Engineer, Engineer, Asst. Engineer, and Technique Leader.  This will greatly enhance the success of the program, and there would still be a decade on average between the ones whose retirements appear more imminent (1952 to 1955) and this 1963 to 1965 group.  Everyone would therefore take one more promotion upward and then the organization could backfill with trainee Assistant Engineers.**  

![expanded_eligibility](https://github.com/Super-Manda/Pewlett-Hackard-Analysis/blob/main/PNGs/prospective_mentees_expanded_eligibility_PNG.png)
