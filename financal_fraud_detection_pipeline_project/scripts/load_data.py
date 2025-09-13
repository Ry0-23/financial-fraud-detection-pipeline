import pandas as pd
from sqlalchemy import create_engine

# Load CSV
df = pd.read_csv("../data/transactions.csv")

# Create SQLite DB
engine = create_engine("sqlite:///../finance.db", echo=True)

# Write to DB
df.to_sql("transactions", con=engine, if_exists="replace", index=False)

print("✅ Data loaded into finance.db (table: transactions)")