import streamlit as st
from database import tables,columns,get_columns,delete_details

def delete():
    tables_list = tables()
    col1,col2 = st.columns(2)
    with col1:
        selected_table = st.selectbox('Select a table', tables_list)
        col_list = columns(selected_table)
        col_ids = get_columns(selected_table, col_list[0])
    with col2:
        selected_id = st.selectbox('Select an id', col_ids)
    
    if st.button("Delete Details"):
        delete_details(selected_table,col_list[0],selected_id)
        st.success("Successfully deleted details")