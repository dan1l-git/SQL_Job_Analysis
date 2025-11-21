/*
Question: What skills are required for the top-paying Data Analyst jobs?
    - Use the top 10 highest-paying Data Analyst jobs from first query
    - Add the specific skills required for these roles
    - Why? It provides a detailed look at which high-paying jobs demand certain skills,
        helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT job_id,
           job_title,
           salary_year_avg,
           name AS company_name
    FROM job_postings_fact
             LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
      AND job_location = 'Anywhere'
      AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
    Key Insights:
    - SQL is the most frequently mentioned skill, appearing in 8 job postings. This highlights the foundational
        importance of database querying and management for data-centric roles.
    - Python follows closely with 7 mentions, underscoring its dominance as a primary programming language for
        data analysis and automation.
    - Tableau is the leading visualization tool, with 6 mentions, indicating a strong demand for skills in
        presenting data insights.
    - R remains relevant, appearing 4 times, likely for specialized statistical analysis.
    - Other notable skills include Snowflake, Pandas, Excel, Azure, Bitbucket, and Go, reflecting a mix of cloud
        platforms, data manipulation libraries, and version control tools.
*/