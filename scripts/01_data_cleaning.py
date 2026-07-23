import pandas as pd

# 1. Load the raw data
df = pd.read_csv('../data/raw/data.csv', encoding='ISO-8859-1')

# 2. Convert InvoiceDate to actual datetime
df['InvoiceDate'] = pd.to_datetime(df['InvoiceDate'])

# 3. Drop rows with missing CustomerID
df_clean = df.dropna(subset=['CustomerID']).copy()

# 4. Convert CustomerID from float to integer
df_clean['CustomerID'] = df_clean['CustomerID'].astype(int)

# 5. Remove cancelled orders (InvoiceNo starting with 'C') and zero/negative prices
df_clean = df_clean[~df_clean['InvoiceNo'].str.startswith('C', na=False)]
df_clean = df_clean[(df_clean['Quantity'] > 0) & (df_clean['UnitPrice'] > 0)]

# 6. Add Total Sales column
df_clean['TotalAmount'] = df_clean['Quantity'] * df_clean['UnitPrice']

# 7. Save the cleaned dataset into data/processed/
df_clean.to_csv('../data/processed/cleaned_ecommerce.csv', index=False)

print("Data successfully cleaned and saved!")
print("Cleaned Data Shape:", df_clean.shape)