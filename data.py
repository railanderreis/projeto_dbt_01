#%%
import psycopg2

#%%
conn = psycopg2.connect(database = "northwind", 
                        user = "northwind_user", 
                        host= 'localhost',
                        password = "thewindisblowing",
                        port = 5432)

# %%
cur = conn.cursor()
cur.execute("""CREATE TABLE order_details(
    order_id integer,
    product_id integer,
    unit_price float,
    quantity integer,
    discount float
);
""")
            
#%%            
with open('./db/order_details.csv', 'r') as f:
    # Notice that we don't need the csv module.
    next(f) # Skip the header row.
    cur.copy_from(f, 'order_details', sep=',')

conn.commit()
# %%
import duckdb
con = duckdb.connect('./db/dw_north.db')
con.close()

# %%
