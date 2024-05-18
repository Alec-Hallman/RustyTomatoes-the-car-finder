# -*- coding: utf-8 -*-
"""
Created on Sat May 18 04:31:55 2024

@author: Michael
"""

from pymongo_create_database import get_database
from pandas import DataFrame
dbname = get_database()

# %% remove review

def delete_rev(dbname, rev_id):
    collection_name = dbname["review"]
    
    # check if review exists
    df_checker = DataFrame(collection_name.find({"rev_id" : rev_id}))
    if df_checker.empty == True:
        print("Review DNE")
    else: # if exists delete it
        collection_name.delete_one({ "rev_id": rev_id })
        print("dropped")
        
# %% remove user

def delete_user(dbname, user_id):
    collection_car = dbname["car"]
    collection_user = dbname["user"]
    collection_rev = dbname["review"]
    
    # check if review exists
    df_checker = DataFrame(collection_user.find({"user_id" : user_id}))
    if df_checker.empty == True:
        print("User DNE")
    else: # delete all reviews user has, then all cars the user has, then delete user
        collection_rev.delete_many({ "user_id": user_id })
        collection_car.delete_many({ "user_id": user_id })
        collection_user.delete_one({ "user_id": user_id })
        print("dropped")
        
# %% remove car

def delete_car(dbname, car_id):
    collection_car = dbname["car"]
    collection_rev = dbname["review"]
    
    # check if car exists
    df_checker = DataFrame(collection_car.find({"car_id" : car_id}))
    if df_checker.empty == True:
        print("Car DNE")
    else: # if exists, delete every review for the car, then delete the car
        collection_rev.delete_many({ "car_id": car_id })
        collection_car.delete_one({ "car_id": car_id })
        print("dropped")
    
# %% run stuff

#delete_rev(dbname, "REV00011")
#delete_car(dbname, "CAR00004")
delete_user(dbname, "USR00005")