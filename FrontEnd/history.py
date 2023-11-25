import streamlit as st
import pandas as pd
from database import driver_history,view_all

def history():
    drivers = view_all("drivers")
    menu=[x[1] for x in drivers]
    dname = st.sidebar.selectbox("Drivers", menu)
    cols = ["RACEID", "time", "date", "Position"]
    df = pd.DataFrame(driver_history(dname), columns=cols)
    df['time'] = df['time'].astype(str).apply(lambda x: x.split()[2])

    st.dataframe(df, use_container_width=True)
    # st.table(df)