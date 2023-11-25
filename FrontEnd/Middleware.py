import mysql.connector
import datetime
import pandas as pd


mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="1915",
  database='race'
)
tables={1:'cars', 2:'drivers', 3:'race_tracks', 4:'races', 5:'teams'}

mycursor = mydb.cursor()

def select_table(cursor,table):#input table name
    # cursor.execute(f"Select * from {table};")
    # return [cursor.column_names,cursor.fetchall()]#returns a list that has a tuple containing column names a list of tuples containing row values
    cursor.execute(f"SELECT * FROM {table};")
    # column_names = [desc[0] for desc in cursor.description]
    data = cursor.fetchall()

    # Convert 'Duration' data to strings
    data1 = [[str(item) if isinstance(item, datetime.timedelta) else item for item in row] for row in data]

    return [cursor.column_names, data1]
def insert(cursor,table,vals):#input table name and values to be inserted in a tuple
    cursor.execute(f'insert into {table} values{vals}')
    mydb.commit()
def delete(cursor,table,vals):
    sel=select_table(cursor,table)[0]
    cursor.execute(f'delete from {table} where({sel[0]}={vals})')
    mydb.commit()
def signup(cursor,username,password):
    insert(cursor,'users',(username,password))
def validate(cursor,username,password):
    cursor.execute(f"SELECT * FROM users;")
    sel=[cursor.column_names,cursor.fetchall()]
    if (username,password) in sel[1]:
        return True
    return False


# insert(mycursor,"drivers",(2,"Driver2","1990-05-16",0,2))
# insert(mycursor,"cars",(7,1,7))
# print(select_table(mycursor,"cars"))

# print(select_table(mycursor, "cars"))
# col_names, data = select_table(mycursor, "cars")
# # col_names += ("",)
# n = len(data)
# d = ["del"]*n
# # print(d)
# df = pd.DataFrame(data, columns = col_names)
# df = df.assign(delete = d)
# print(df)

# print(pd)
# while True:
#     print("""press 1 for selecting table
# press 2 for inserting into table
# press 3 for deleting from table
# press 4 to exit         
# """)
#     t=int(input(':'))
#     if t==1:
# print('''1 for table cars,
# 2 for table drivers,
# 3 for table race_tracks,
# 4 for table races,
# 5 for table teams''')
# t1=int(input(':'))
# table_name = tables.get(t1)
# sel=select_table(mycursor,table_name)
# print(sel)
#     elif t==2:
# print('''1 for table cars,
# 2 for table drivers,
# 3 for table race_tracks,
# 4 for table races,
# 5 for table teams''')
# t1=int(input(':'))
# table_name = tables.get(t1)
# ins=insert(mycursor,table_name,(3,150,3))
# print(ins)
#     elif t==3:
#         print('''1 for table cars,
# 2 for table drivers,
# 3 for table race_tracks,
# 4 for table races,
# 5 for table teams''')
#         t1=int(input(':'))
#         table_name = tables.get(t1)
#         ins=delete(mycursor,table_name,(8,450,1))
#         print(ins)
#     else:
#         1
#         break