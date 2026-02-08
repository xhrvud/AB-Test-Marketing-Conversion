# A/B Test Analysis: Marketing Conversion Experiment

## Project Overview

This project presents a complete end-to-end **A/B test analysis** for a marketing experiment comparing two variants:

- **Ad** — marketing campaign with ads
- **PSA** — control group (public service announcement, no ads)

The goal of the experiment is to evaluate whether showing ads leads to a statistically and practically significant increase in user conversion rate.

The analysis covers:
- data validation and sanity checks (SQL),
- exploratory analysis,
- statistical hypothesis testing,
- effect size estimation,
- business interpretation and recommendation.

---

## Dataset

**Source:** Kaggle — *Marketing A/B Testing Dataset*  
**File:** `marketing_AB.csv`

Each row represents a unique user exposed to one of the test variants.

### Key Columns
- `user_id` — unique user identifier  
- `test_group` — experiment group (`ad` or `psa`)  
- `converted` — conversion outcome (True / False)  
- `total_ads` — number of ads shown to the user  
- `most_ads_day` — weekday with the highest ad exposure  
- `most_ads_hour` — hour with the highest ad exposure  

---

## Data Validation & Sanity Checks (SQL)

Before running the statistical analysis, the dataset was validated using SQL to ensure correctness and reliability of the experiment results.

### Checks Performed
- total number of rows,
- user distribution across test groups,
- baseline conversion rates,
- duplicate user detection,
- missing values validation.

### SQL File
sql/02_data_quality_checks.sql


All checks confirmed that:
- there are no duplicate users,
- no critical missing values are present,
- the dataset is suitable for A/B testing.

---

## Exploratory Metrics

Initial conversion metrics by test group:

| Test Group | Users | Conversions | Conversion Rate |
|----------|-------|-------------|-----------------|
| Ad       | 564,577 | 14,423 | 2.55% |
| PSA      | 23,524  | 420    | 1.78% |

A visible uplift is observed for the **Ad** variant, which is further validated statistically.

---

## Statistical Methodology

### Hypotheses
- **H₀ (Null):** Conversion rates are equal between Ad and PSA groups  
- **H₁ (Alternative):** Conversion rates differ between Ad and PSA groups  

### Test Used
- **Two-sided Z-test for proportions**
- Significance level: **α = 0.05**

### Additional Metrics
- absolute uplift (percentage points),
- relative uplift (%),
- 95% confidence interval for uplift.

---

## A/B Test Results

- **Conversion Rate (Ad):** 2.55%  
- **Conversion Rate (PSA):** 1.78%  

### Effect Size
- **Absolute uplift:** +0.77 pp  
- **Relative uplift:** +43.1%  

### Statistical Significance
- **Z-statistic:** 7.37  
- **p-value:** < 0.001  
- **95% CI (absolute uplift):** [0.60 pp, 0.94 pp]

The confidence interval does not include zero, confirming the robustness of the result.

---

## Traffic Split Check

User distribution between groups:
- **Ad:** ~96%
- **PSA:** ~4%

Despite the imbalance, both groups have sufficiently large sample sizes for reliable statistical inference.

---

## Visualization

A comparison of conversion rates between test groups was visualized using a bar chart.

![Alt text](https://github.com/xhrvud/AB-Test-Marketing-Conversion/blob/main/screenshots/conversion_rate_by_test_group.png?raw=true)

The visualization clearly highlights the performance gap between the two variants.

---

## Conclusion & Recommendation

- The **Ad** variant demonstrates a **statistically significant and practically meaningful uplift** in conversion rate compared to PSA.
- The effect size is large enough to justify business impact.
- Results are statistically robust based on hypothesis testing and confidence intervals.

### Recommendation
Roll out the **Ad** variant to 100% of traffic and continue monitoring post-rollout metrics to ensure long-term stability.

---

## Repository Structure
```
.
├── README.md
├── data
│ └── marketing_AB.csv
├── sql
│ └── 01_schema.sql
  └── 02_data_quality_checks.sql
├── notebooks
│ └── 01_ab_test_analysis.ipynb
└── screenshots
  └── conversion_rate_by_group.png
```

---

## Tools & Technologies

- SQL (PostgreSQL-style queries)
- Python (pandas, numpy, statsmodels, matplotlib)
- Jupyter Notebook
- Statistical hypothesis testing

---

## Author

**Levytskyi Bohdan**  
Junior Data Analyst

This project is part of a personal analytics portfolio focused on real-world business problems and decision-making.
