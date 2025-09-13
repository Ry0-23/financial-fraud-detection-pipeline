import pandas as pd
from sqlalchemy import create_engine
from sklearn.ensemble import IsolationForest

# Connect DB
engine = create_engine("sqlite:///../finance.db")
df = pd.read_sql("SELECT * FROM transactions", engine)

# Train anomaly detection
model = IsolationForest(contamination=0.1, random_state=42)
df["anomaly"] = model.fit_predict(df[["amount"]])

# Show flagged anomalies
anomalies = df[df["anomaly"] == -1]
print("🚨 Suspicious Transactions:")
print(anomalies)