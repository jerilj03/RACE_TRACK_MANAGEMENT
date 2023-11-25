import streamlit as st
from database import add_data, tables, columns, view_all, view_id

def create():
    tables_list = tables()
    selected_table = st.selectbox('Select a table', tables_list)
    col_list = columns(selected_table)
    dict1 = {}
    col1,col2 = st.columns(2)
    dict1[col_list[0]]=str(int(view_id(selected_table)[-1])+1)
    for i in range(1,int(len(col_list)/2)):
        with col1:
            dict1[col_list[i]] = st.text_input(col_list[i] + ": ")
    for i in range(int(len(col_list)/2),len(col_list)):
        with col2:
            dict1[col_list[i]] = st.text_input(col_list[i] + ": ")
    # if "time" in  dict1:
    #     dict1["time"] = "'"+dict1["time"]+"'"
    # if "date" in  dict1:
    #     dict1["date"] = "'"+dict1["date"]+"'"
    # if "DOB" in dict1:
    #     dict1["DOB"] = "'"+dict1["DOB"]+"'"
    for key in dict1:
        temp = dict1[key]
        # if temp is None or temp.strip() == "":
        #     st.error("Invalid input: Text inputs cannot be empty.")
        #     break
        # else:
        try:
            temp2 = int(temp)
            dict1[key] = temp
        except ValueError:
            dict1[key] = "'" + temp + "'"
    if st.button("Add Data"):
        # try:
        #     # Check for empty values in dict1
            # if any(value is None or value.strip() == "" for value in dict1.values()):
            #     st.error("Invalid input: Text inputs cannot be empty.")
            # else:
            #     add_data(selected_table, dict1)
            #     st.success("Successfully added the data")
        # except Exception as e:
        #     st.error(f"An error occurred: {str(e)}")
        
        try:
            if any(value is None or value.strip() == "" for value in dict1.values()):
                st.error("Invalid input: Text inputs cannot be empty.")
            else:    
                add_data(selected_table, dict1)
                st.success("Successfully added the data")
        except Exception as e:
            st.error(f"An error occurred: {str(e)}")

