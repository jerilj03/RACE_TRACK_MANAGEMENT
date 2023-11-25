import streamlit as st
import pandas as pd
from database import tables,view_all,columns
import streamlit_pandas as sp

def read():
    tables_list = tables()
    # tables_list = [i for i in tables_list1 if i!="users"]
    selected_viewtable = st.selectbox("Table to View : ", tables_list)
    cols = columns(selected_viewtable)
    df = pd.DataFrame(view_all(selected_viewtable), columns=cols)
    
    # if "button_click" not in st.session_state:
    #     st.session_state.button_click = False
    
    # def callback():
    #     st.session_state.button_click = True
    if 'time' in df.columns:
        df['time'] = df['time'].astype(str).apply(lambda x: x.split()[2])
    if df.empty:
        st.dataframe(df,use_container_width=True)    
    else:
        all_widgets = sp.create_widgets(df)
        res = sp.filter_df(df, all_widgets)
        st.dataframe(res,use_container_width=True)
    # # Convert DataFrame to HTML with centered text
    # html_table = df.style.set_properties(**{'text-align': 'center'}).render()

    # # Display HTML using st.markdown
    # st.markdown(html_table, unsafe_allow_html=True)
    # st.dataframe(df)