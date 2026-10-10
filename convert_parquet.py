import pandas as pd

# Define filenames
input_parquet = 'yellow_tripdata_2023-01.parquet'
output_csv = 'yellow_tripdata_2023-01.csv'

print("Loading Parquet file into memory...")
df = pd.read_parquet(input_parquet)

print(f"Dataset successfully loaded. Total rows: {len(df):,}")
print("Converting to CSV format... This will take a moment.")

# Convert to CSV
df.to_csv(output_csv, index=False)

print("Success! CSV file created in your Raw_Data folder.")