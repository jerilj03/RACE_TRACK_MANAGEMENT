import streamlit as st
import Middleware
from create import create
from read import read
from update import update
from delete import delete
from execute import execute
from join import join
import mysql.connector

def main():
    st.set_page_config(layout="wide")
    st.title("Race Track Management ")
    placeholder = st.empty()
    if "page" not in st.session_state:
        st.session_state.page = 0
    if st.session_state.page == 0:
        with placeholder.container():
            st.header("User Authentication")
            login_username = st.text_input("Username")
            login_password = st.text_input("Password", type="password")
            if st.button('Log in'):
                if Middleware.validate(Middleware.mycursor, login_username, login_password):
                    st.session_state.page = 1
                    st.session_state.authenticated_user = True
                else:
                    st.error("Invalid username or password.")
    if "authenticated_user" not in st.session_state:
        st.session_state.authenticated_user = False

    if not st.session_state.authenticated_user:
        st.header("User Signup")
        signup_username = st.text_input("New Username")
        signup_password = st.text_input("New Password", type="password")
        # f = 0
        # if st.button("Sign Up"):
        # # if f == 0:
        #     if Middleware.validate(Middleware.mycursor,signup_username, signup_password):
        #         st.error("User already exists")
        #     if signup_password==None or signup_username==None:
        #         st.error("Invalide username")
            
        #     Middleware.signup(Middleware.mycursor, signup_username, signup_password)
        #     st.success("User signed up successfully.")
        if st.button("Sign Up"):
            if signup_username is None or signup_password is None or signup_username == "" or signup_password == "":
                st.error("Invalid username or password. Please fill in all the fields.")
            else:
                try:
                    if Middleware.validate(Middleware.mycursor, signup_username, signup_password):
                        st.error("User already exists")
                    else:
                        Middleware.signup(Middleware.mycursor, signup_username, signup_password)
                        st.success("User signed up successfully.")
                except mysql.connector.errors.IntegrityError as e:
                    # st.error(f"Error: {str(e)}. This username already exists. Please choose a different username.")
                    st.error("This username already exists")
                except Exception as e:
                    st.error(f"An error occurred: {str(e)}")

    if st.session_state.authenticated_user:
        if st.session_state.page == 1:
            with placeholder.container():    
                #menu = ["Add", "View","Join","Update", "Delete","Average Points","Execute Command"]
                menu = ["Add", "View","Join","Update","Average Points", "Delete","Leaderboard History"]
                choice = st.sidebar.selectbox("Menu", menu)
                if choice == "Add":
                    st.subheader("Add Details")
                    create()
                elif choice == "View":
                    st.subheader("View Details")
                    read()
                elif choice == "Update":
                    st.subheader("Update Details")
                    update()
                elif choice == "Delete":
                    st.subheader("Delete Details")
                    delete()
                elif choice == "Join":
                    st.subheader("Join Tables")
                    join()
                elif choice=="Average Points":
                    st.subheader("Average Driver Points")
                    average()
                elif choice=="Leaderboard History":
                    st.subheader("Leaderboard History")
                    history()
                else:
                    st.subheader("Execute Queries")
                    execute()
if __name__ == '__main__':
    main()