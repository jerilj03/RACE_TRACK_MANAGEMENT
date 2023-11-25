import streamlit as st
import pandas as pd
from database import driver_avg_points

def average():
    cols=["Average"]
    df=pd.DataFrame(driver_avg_points(),columns=cols)
    st.dataframe(df, use_container_width=True)
    