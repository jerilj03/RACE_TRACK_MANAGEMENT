import streamlit as st
import pandas as pd
from database import join_teams

def join():
    cols=["Team ID",'Team Name',"Driver 1 ID","Driver 1 Name","Driver 2 ID","Driver 2 Name","Driver 1 Points","Driver 2 Points","Team Points"]
    df=pd.DataFrame(join_teams(),columns=cols)
    st.dataframe(df, use_container_width=True)
    # st.table(df)