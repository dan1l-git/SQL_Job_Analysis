/*
Question: What are the top skills based on salary?
    - Look at the average salary associated with each skill for Data Analyst positions
    - Focuses on roles with specified salaries, regardless of location
    - Why? It reveals how different skills impact salary levels for Data Analyst and
        helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg),2) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
Key Insights:
    * Specialized & Niche Skills Command Premiums:
        - SVN tops the list at $400,000. Note that SVN (Subversion) is a legacy version control system. Its excessively
            high average salary likely reflects a specific, senior-level, or niche role (e.g., a legacy system migration
            expert or a high-level architect) rather than a broad market trend for the tool itself.
        - Solidity ($179,000) takes second place, highlighting the high value placed on blockchain and smart contract
            development skills within analytics roles.
    * Shift Towards Engineering & DevOps:
        - Many top skills are traditionally associated with DevOps and Data Engineering rather than pure analysis.
        - Tools like Terraform ($146k), Ansible ($124k), Puppet ($129k), GitLab, and Kafka ($130k) suggest that
            "Data Analysts" who can handle infrastructure, deployment pipelines, and streaming data are extremely valuable.
    * AI & Machine Learning Frameworks:
        - There is a strong presence of deep learning libraries: MxNet ($149k), Keras ($127k), PyTorch ($125k),
            Hugging Face ($124k), and TensorFlow ($120k).
        - DataRobot ($155k), an automated machine learning platform, ranks very high, indicating a premium on efficiency
            in building ML models.
    * Programming Languages:
        - Beyond Python and SQL, languages like Golang ($155k), Perl ($124k), and Scala ($115k) are highly paid.
            This often correlates with roles that require handling high-performance systems or legacy codebases.
    * Collaboration Tools:
        - Surprisingly, proficiency in collaboration and project management tools like Notion, Atlassian, and Bitbucket
            correlates with high salaries (~$116k–118k). This likely points to senior roles where process management
            and team coordination are key responsibilities.

Summary: The "Data Analyst" title for these high-paying roles is likely a hybrid one. To reach these salary bands,
an analyst typically needs to branch out into Machine Learning Engineering, DevOps/Infrastructure, or Specialized
Domains like Blockchain (Solidity).
*/