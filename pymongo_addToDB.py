# -*- coding: utf-8 -*-
"""
Created on Sat May 18 03:40:36 2024

@author: Michael
"""

# create a user profile

from pymongo_create_database import get_database
from pandas import DataFrame
dbname = get_database()

# %% add user

def create_and_add_user(dbname, user_id, user_name, user_pass):
    
    # db_name -> the name of database to open
    # user_id -> user id
    # user_name -> user first and last name
    # user_pass -> the user's password
    
    # opens DB
    collection_name = dbname["user"]
    
    # create item
    item = {
      "user_id" : user_id,
      "user_name" : user_name,
      "user_pass" : user_pass

    }
    
    # check if user already exists
    df_checker = DataFrame(collection_name.find({"user_id" : user_id}))
    if df_checker.empty == True:
        collection_name.insert_one(item)
    else:
        print("User already exists")
    

# %% add car

def create_and_add_car(dbname, user_id, car_id, car_make, car_model, car_doors=None, car_price=None, car_engine_type=None,
                        car_engine_size=None, car_year=None, car_body_type=None, car_drivetrain=None, car_transmission=None, car_seats=None,
                        car_classification=None, car_colour=None, car_interior_fabric=None):
    
    # db_name -> the name of database to open
    # user_id -> user id
    # user_name -> user first and last name
    # user_pass -> the user's password
    
    # opens DB
    collection_user = dbname["user"]
    collection_name = dbname["car"]
    
    # create item
    item = {
      "user_id" : user_id,
      "car_id" : car_id,
      "car_make" : car_make,
      "car_model" : car_model,
      "car_doors" : car_doors,
      "car_price" : car_price,
      "car_engine_type" : car_engine_type,
      "car_engine_size" : car_engine_size,
      "car_year" : car_year,
      "car_body_type" : car_body_type,
      "car_drivetrain" : car_drivetrain,
      "car_transmission" : car_transmission,
      "car_seats" : car_seats,
      "car_classification" : car_classification,
      "car_colour" : car_colour,
      "car_interior_fabric" : car_interior_fabric
    
    }
    
    # check if car already exists in user portfolio
    df_checker = DataFrame(collection_user.find({"user_id" : user_id}))
    if df_checker.empty == True:
        print("User DNE")
    else:
        df_checker = DataFrame(collection_name.find({"car_id" : car_id}))
        if df_checker.empty == True:
            collection_name.insert_one(item)
        else:
            print("Car already exists")

# %% add review

def create_and_add_rev(dbname, car_id, rev_id, rev_review):
    
    # db_name -> the name of database to open
    # user_id -> user id
    # user_name -> user first and last name
    # user_pass -> the user's password
    
    # opens DB
    collection_car = dbname["car"]
    collection_name = dbname["review"]
    
    # create item
    item = {
      "car_id" : car_id,
      "rev_id" : rev_id,
      "rev_review" : rev_review
    
    }
    
    # check if car already exists in user portfolio
    df_checker = DataFrame(collection_car.find({"car_id" : car_id}))
    if df_checker.empty == True:
        print("Car DNE")
    else:
        df_checker = DataFrame(collection_name.find({"rev_id" : rev_id}))
        if df_checker.empty == True:
            collection_name.insert_one(item)
        else:
            print("Review already exists")

# %% run stuff

create_and_add_user(dbname, "USR00004", "Garfield Cat", "Gogurt123")
create_and_add_car(dbname, "USR00004", "CAR00004", "Mercedes-Benz", "S 500")
create_and_add_rev(dbname, "CAR00004", "REV00004", "Meow meow meeeeoooooow....hkhkkkkkhkkhk.....meow")
