CREATE DATABASE bank_churn;
USE bank_churn;
SELECT * FROM bank_churn_cleaned LIMIT 10;
SELECT * FROM bank_churn_cleaned;

-- -------------------------------------------------------
-- Business Insights Questions
-- -------------------------------------------------------

-- 1. What is the overall churn rate?
SELECT * FROM bank_churn_cleaned;

SELECT 
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    COUNT(*) - SUM(Exited) AS retained_customers,
    ROUND(AVG(Exited)*100, 2) AS churn_rate_percentage
FROM bank_churn_cleaned;

-- ? Business Problem :- How many customers are leaving the bank?

-- Impact :-
        -- Helps understand the scale of churn problem
        -- Gives a baseline metric to track over time
        -- Helps set retention targets
            
-- 2. Which Geography has the highest churn rate?
SELECT * FROM bank_churn_cleaned;

SELECT
        Geography,
        ROUND(AVG(Exited),2)*100 AS churn_rate
FROM bank_churn_cleaned
GROUP BY Geography
ORDER BY churn_rate DESC;

-- ? Business Problem :- Which region is losing the most customers?

-- Impact :-
        -- Helps target region-specific retention campaigns
        -- Identifies where service improvement is needed
        -- Guides regional marketing strategy
 
 -- 3. What is the churn rate by Gender?
SELECT * FROM bank_churn_cleaned;
SELECT
    Gender,
    ROUND(AVG(Exited)*100, 2) AS churn_rate
FROM bank_churn_cleaned
GROUP BY Gender;
 
-- ? Business Problem :- Are female or male customers churning more?

-- Impact :-
        -- Helps design gender-specific retention offers
        -- Identifies underserved customer segment
        -- Improves customer satisfaction strate
        
-- 4. What is the churn rate by Activity Status?
SELECT * FROM bank_churn_cleaned;
SELECT
    ActivityStatus,
    ROUND(AVG(Exited)*100, 2) AS churn_rate
FROM bank_churn_cleaned
GROUP BY ActivityStatus;
 
-- ? Business Problem :- Do inactive members churn more than active ones?
-- Impact :-
        -- Helps identify at-risk inactive customers early
        -- Guides re-engagement campaigns
        -- Reduces preventable churn

-- 5. Which Age Group churns the most?
SELECT * FROM bank_churn_cleaned;
SELECT
      AgeGroup, 
      ROUND(AVG(Exited),2)*100 AS churn_rate
FROM bank_churn_cleaned
GROUP BY AgeGroup
ORDER BY churn_rate DESC;

-- ? Business Problem :- Which age segment is most likely to leave?

-- Impact :-
        -- Helps create age-specific loyalty programs
        -- Identifies high-risk age segments
        -- Supports targeted communication strategy
        
-- 6. What is the churn rate by Balance Category?
SELECT * FROM bank_churn_cleaned;
SELECT
    BalanceCategory,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned,
    ROUND(AVG(Exited)*100, 2) AS churn_rate
FROM bank_churn_cleaned
GROUP BY BalanceCategory
ORDER BY churn_rate DESC;
 
-- ? Business Problem :- Do high balance customers churn more?

-- Impact :-
        -- High balance churners = high revenue loss
        -- Helps prioritize which customers to retain
        -- Guides premium customer retention strategy
 
-- 7. What is the churn rate by Number of Products?
SELECT * FROM bank_churn_cleaned;
SELECT
    NumOfProducts,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned,
    ROUND(AVG(Exited)*100, 2) AS churn_rate
FROM bank_churn_cleaned
GROUP BY NumOfProducts
ORDER BY NumOfProducts;
 
-- ? Business Problem :- Does having more products reduce churn?
-- Impact :-
        -- Helps understand product bundling effect on retention
        -- Guides cross-selling strategy
        -- Identifies product saturation risk
 
-- 8. What is the churn rate by Credit Card ownership?
SELECT * FROM bank_churn_cleaned;
SELECT
    HasCrCard,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned,
    ROUND(AVG(Exited)*100, 2) AS churn_rate
FROM bank_churn_cleaned
GROUP BY HasCrCard;
 
-- ? Business Problem :- Does having a credit card affect churn?
-- Impact :-
        -- Helps evaluate credit card as a retention tool
        -- Guides credit card promotion decisions
 
-- 9. Churned vs Retained customers — average comparison?
SELECT * FROM bank_churn_cleaned;
SELECT
    CASE Exited WHEN 1 THEN 'Churned' ELSE 'Retained' END AS customer_status,
    ROUND(AVG(CreditScore), 2) AS avg_CreditScore,
    ROUND(AVG(Age), 2) AS avg_Age,
    ROUND(AVG(Balance), 2) AS avg_Balance,
    ROUND(AVG(Tenure), 2) AS avg_Tenure,
    ROUND(AVG(EstimatedSalary), 2) AS avg_Salary,
    ROUND(AVG(NumOfProducts), 2) AS avg_Products
FROM bank_churn_cleaned
GROUP BY Exited;
 
-- ? Business Problem :- What is the profile of a churned customer?
-- Impact :-
        -- Helps build a churn risk profile
        -- Enables proactive identification of at-risk customers
        -- Supports data-driven retention decisions
 
-- 10. Geography + AgeGroup combined churn rate
SELECT * FROM bank_churn_cleaned;
SELECT
    Geography,
    AgeGroup,
    ROUND(AVG(Exited)*100, 2) AS churn_rate
FROM bank_churn_cleaned
GROUP BY Geography, AgeGroup
ORDER BY churn_rate DESC;
 
-- ? Business Problem :- Which region + age group combination churns the most?
-- Impact :-
        -- Enables hyper-targeted retention campaigns
        -- Identifies highest risk customer segments
        -- Maximizes impact of retention budget
 
-- 11. Geography + Gender combined churn rate?
SELECT * FROM bank_churn_cleaned;
SELECT
    Geography,
    Gender,
    COUNT(*) AS total_customers,
    ROUND(AVG(Exited)*100, 2) AS churn_rate
FROM bank_churn_cleaned
GROUP BY Geography, Gender
ORDER BY churn_rate DESC;
 
-- ? Business Problem :- Which gender in which region churns most?
-- Impact :-
        -- Helps design region + gender specific campaigns
        -- Identifies most vulnerable customer segments
 
USE bank_churn;
SHOW TABLES;

