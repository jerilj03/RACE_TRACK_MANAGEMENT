import time
import mysql.connector 
mydb = mysql.connector.connect(host="localhost", user="root", password="1915",database="rtmgmt")
cur = mydb.cursor()

def tables():
    cur.execute('SHOW TABLES')
    data = cur.fetchall()
    return [i[0] for i in data if i[0]!='users']

def validate(username,password):
    cur.execute(f"SELECT * FROM users;")
    sel=[cur.column_names,cur.fetchall()]
    if (username,password) in sel[1]:
        return True
    return False

def signup(username,password):
    query = "INSERT INTO users (username, password) VALUES (%s, %s)"
    values = (username, password)
    cur.execute(query, values)
    mydb.commit()
    
def columns(table_name):
    cur.execute(f"SHOW COLUMNS FROM {table_name}")
    data = cur.fetchall()
    return [i[0] for i in data]

def add_data(table_name, data): 
    col_names = ",".join(data.keys())
    vals = ",".join(data.values())
    cur.execute(f"INSERT INTO {table_name} ({col_names}) VALUES ({vals})")
    mydb.commit()

def view_all(table_name): 
    cur.execute(f"SELECT * FROM {table_name}") 
    data = cur.fetchall()
    return data

def view_id(table_name):
    cur.execute(f"SELECT * FROM {table_name}")
    data = cur.fetchall()
    return [i[0] for i in data]

def get_columns(table_name,col):
    cur.execute(f"SELECT {col} FROM {table_name}")
    data = cur.fetchall()
    return [i[0] for i in data]

def update_details(table_name,data,name1,value1):
    name_eq_val = ""
    for k in data:
        name_eq_val += k + " = " + data[k] + ","      
    name_eq_val = name_eq_val[:-1]     
    cur.execute(f"UPDATE {table_name} SET {name_eq_val} WHERE {name1}='{value1}'")
    mydb.commit()

def delete_details(table_name,name1,value1):
    cur.execute(f"DELETE FROM {table_name} WHERE {name1}='{value1}'")
    mydb.commit()

def execute_queries(query):
    cur.execute(f"{query}")
    data = cur.fetchall()
    mydb.commit()
    return data

def join_teams():
    query='''SELECT
    t.TEAMID,
    t.T_NAME AS Team_Name,
    t.DRIVER1ID,
    d1.D_Name AS Driver1_Name,
    t.DRIVER2ID,
    d2.D_Name AS Driver2_Name,
    d1.Dpoints AS Driver1_Points,
    d2.Dpoints AS Driver2_Points,
    t.Tpts
FROM
    teams t
JOIN
    drivers d1 ON t.DRIVER1ID = d1.DRIVERID
JOIN
    drivers d2 ON t.DRIVER2ID = d2.DRIVERID;
'''
    cur.execute(query)
    return cur.fetchall()

def driver_avg_points():
    cur.callproc("CalculateAveragePTS")
    for result in  cur.stored_results():
        final_res=result.fetchone()
    return final_res

def driver_history(dname):
    query=f'''SELECT R.RACEID, R.time, R.date,
       CASE
           WHEN R.P1DRIVERID = (SELECT DRIVERID FROM drivers WHERE D_Name = '{dname}') THEN 'P1'
           WHEN R.P2DRIVERID = (SELECT DRIVERID FROM drivers WHERE D_Name = '{dname}') THEN 'P2'
           WHEN R.P3DRIVERID = (SELECT DRIVERID FROM drivers WHERE D_Name = '{dname}') THEN 'P3'
           WHEN R.P4DRIVERID = (SELECT DRIVERID FROM drivers WHERE D_Name = '{dname}') THEN 'P4'
           WHEN R.P5DRIVERID = (SELECT DRIVERID FROM drivers WHERE D_Name = '{dname}') THEN 'P5'
           ELSE 'Not Participated'
       END AS Position
FROM races R
WHERE (SELECT DRIVERID FROM drivers WHERE D_Name = '{dname}') IN (R.P1DRIVERID, R.P2DRIVERID, R.P3DRIVERID, R.P4DRIVERID, R.P5DRIVERID)
   OR NOT EXISTS (SELECT 1 FROM drivers WHERE D_Name = '{dname}');
'''
    cur.execute(query)
    return cur.fetchall()