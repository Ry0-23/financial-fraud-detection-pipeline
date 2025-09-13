# 💳 Finance Transactions Pipeline + Fraud Monitoring

## 📌 Project Overview
This project simulates a financial transactions monitoring system.  
It builds a **data pipeline** that ingests bank transaction data, processes it with SQL + dbt transformations, detects suspicious activities using **machine learning (Isolation Forest)**, and visualizes the results with **Tableau / Power BI** dashboards.  

---

## ⚙️ Tech Stack
- **Python** (Pandas, SQLAlchemy, Scikit-learn)
- **SQLite** (transaction database)
- **dbt** (transformations, aggregations, fraud flags)
- **Tableau / Power BI** (dashboards & visualization)

---

## 📂 Project Structure

finance_pipeline/
├── data/
│ └── transactions.csv # Sample dataset
├── scripts/
│ ├── load_data.py # Loads CSV → SQLite database
│ ├── anomaly_detection.py # ML-based anomaly detection
├── dbt_project/ # dbt models (aggregations, fraud flags)
├── finance.db # SQLite database (created after running load_data.py)
├── requirements.txt # Python dependencies
└── README.md # Project documentation
---

## 🚀 Setup & Installation

### 1. Clone Repository
```bash
git clone <your-repo-url>
cd finance_pipeline

Create Virtual Environment (Optional but Recommended)
python -m venv venv
source venv/bin/activate   # Mac/Linux
venv\Scripts\activate      # Windows


3. Install Dependencies
pip install -r requirements.txt

📊 Run the Pipeline
Step 1: Load Transactions into Database
python scripts/load_data.py


✅ Creates a finance.db SQLite database with a transactions table.

Step 2: Run Anomaly Detection
python scripts/anomaly_detection.py


✅ Uses Isolation Forest to detect suspicious/high-risk transactions.

Step 3: dbt Transformations (Optional, Advanced)

Install dbt + SQLite adapter:

pip install dbt-core dbt-sqlite


Initialize dbt:

cd dbt_project
dbt run


This will generate:

spending_aggregations → Monthly & yearly spending

fraud_flags → Flags for high-value & rapid transactions

📈 Dashboards (Tableau / Power BI)

Connect Tableau / Power BI to finance.db

Use tables:

transactions

spending_aggregations

fraud_flags

Suggested Visuals:

Monthly & yearly spending trends

High-value flagged transactions

Suspicious activity patterns

KPI: Count of anomalies detected

🔮 Future Enhancements

Deploy pipeline on PostgreSQL for enterprise scalability

Integrate real-time streaming with Kafka

Build fraud risk scoring model with deep learning

Automate dashboard refresh with dbt + scheduler
