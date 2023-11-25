import streamlit as st 
import pandas as pd 
from database import execute_queries

def execute():
    commandline = st.text_input("Enter to execute: ")
    if st.button("Execute Query"):
        res = execute_queries(commandline)
        st.success("Successfully Executed Queries")
        if res:
            with st.expander("View Details"):
                st.dataframe(res)