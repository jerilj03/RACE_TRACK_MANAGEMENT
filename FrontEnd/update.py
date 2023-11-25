import streamlit as st 
import pandas as pd 
from database import tables,columns,get_columns,update_details

def update():
    tables_list = tables()
    col1,col2 = st.columns(2)
    with col1:
        selected_table = st.selectbox('Select a table', tables_list)
        col_list = columns(selected_table)
        col_ids = get_columns(selected_table, col_list[0])
    with col2:
        selected_id = st.selectbox('Select an id', col_ids)

    dict1 = {}
    dict2 = {}
    col1,col2 = st.columns(2)
    for i in range(1,int(len(col_list)/2)+1):
        with col1:
            dict1[col_list[i]] = st.text_input(col_list[i] + ": ")
    for i in range(int(len(col_list)/2+1),len(col_list)):
        with col2:
            dict1[col_list[i]] = st.text_input(col_list[i] + ": ")
    
    if st.button("Update Details"):
        for key in dict1:
            temp = dict1[key]
            if temp.strip() == "":
                continue    
            try:
                temp2 = int(temp)
                dict2[key] = temp
            except Exception:
                dict2[key] = "'" +temp+"'"
        update_details(selected_table,dict2,col_list[0],selected_id)
        st.success("Successfully updated details")