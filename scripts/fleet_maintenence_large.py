# Script to load CSV into PostgreSQL

import pandas as pd
from sqlalchemy import create_engine
import psycopg2  # Explicitly import psycopg2

# PostgreSQL connection string with psycopg2
DATABASE_URL = "postgresql+psycopg2://postgres:ashish@localhost:5432/maintenance_db"

# Create database engine using psycopg2
engine = create_engine(DATABASE_URL)

try:
    # Test database connection
    with engine.connect() as connection:
        print("Connected to PostgreSQL successfully!")
        
    # Load CSV data into a DataFrame
    df = pd.read_csv("fleet_maintenance_large.csv")

    # Insert data into PostgreSQL
    df.to_sql("fleet_maintenance", engine, if_exists="append", index=False, method="multi", chunksize=1000)

    print("Data loaded successfully!")

except Exception as e:
    print("Error:", e)
