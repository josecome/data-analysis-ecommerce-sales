# By this script, tables are imported from MySQL Server
# Updates for this Script still ongoing
#=======================================Tables============================================
import pandas as pd
import sqlalchemy

#=======================================Tables============================================
suppliers = pd.DataFrame()
supplier_payments = pd.DataFrame()
categories = pd.DataFrame()
products = pd.DataFrame()
carts = pd.DataFrame()
payments = pd.DataFrame()
customers = pd.DataFrame()
#====================================Import tables from MySQL Server =====================
list_of_tables = ['prod_categories', 'products', 'carts', 'payments', 'suppliers', 'supplier_payments', 'customers']

engine = sqlalchemy.create_engine('mysql+pymysql://root:@localhost:3306/laravel')

for tbl in list_of_tables:
    query = f'SELECT * FROM {tbl}'
    if tbl == 'prod_categories':
        categories = pd.read_sql_query(query, engine)
    elif tbl == 'products':
        products = pd.read_sql_query(query, engine)
    elif tbl == 'carts':
        carts = pd.read_sql_query(query, engine)
    elif tbl == 'payments':
        payments = pd.read_sql_query(query, engine)
    elif tbl == 'suppliers':
        suppliers = pd.read_sql_query(query, engine)
    elif tbl == 'supplier_payments':
        supplier_payments = pd.read_sql_query(query, engine)
    elif tbl == 'customers':
        customers = pd.read_sql_query(query, engine)

#==================================Output Tables=========================================
suppliers.to_csv("suppliers.csv", index=False, quotechar='"')
supplier_payments.to_csv("supplier_payments.csv", index=False, quotechar='"')
categories.to_csv("categories.csv", index=False, quotechar='"')
products.to_csv("products.csv", index=False, quotechar='"')
payments.to_csv("payments.csv", index=False, quotechar='"')
payments.to_csv("payments.csv", index=False, quotechar='"')
customers.to_csv("customers.csv", index=False, quotechar='"')
