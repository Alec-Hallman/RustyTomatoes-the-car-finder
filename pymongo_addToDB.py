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
                        car_classification=None, car_colour=None, car_interior_fabric=None, car_photo=None):
    
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
      "car_interior_fabric" : car_interior_fabric,
      "car_photo" : car_photo
    
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

def create_and_add_rev(dbname, user_id, car_id,rev_id, rev_review, rev_date):
    
    # db_name -> the name of database to open
    # user_id -> user id
    # user_name -> user first and last name
    # user_pass -> the user's password
    
    # opens DB
    collection_user = dbname["user"]
    collection_car = dbname["car"]
    collection_name = dbname["review"]
    
    # create item
    item = {
      "user_id" : user_id,
      "car_id" : car_id,
      "rev_id" : rev_id,
      "rev_review" : rev_review,
      "rev_date" : rev_date
    
    }
    
    # check if review already exists in car portfolio
    df_checker = DataFrame(collection_user.find({"user_id" : user_id}))
    if df_checker.empty == True:
        print("User DNE")
    else:
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

#create_and_add_user(dbname, "USR00005", "Harman Bains", "66Degrees")
create_and_add_car(dbname, "USR00001", "CAR00010", "Kia", "Coup",car_doors=4, car_photo="URL")
create_and_add_car(dbname, "USR00001", "CAR00002", "Mercedes-Benz", "S 500",car_doors=4,car_photo="URL")
create_and_add_car(dbname, "USR00001", "CAR00004", "Honda", "Civic",car_doors=4,car_photo="URL")
create_and_add_car(dbname, "USR00001", "CAR00001", "Toyota", "Corolla",car_doors=4,car_photo="URL")
create_and_add_rev(dbname, "USR00003", "CAR00001","REV00011", "Review", "2024-05-18")

# %% add random user

import random as rnd

_user = "USR"+str(rnd.randint(10000, 99999))

create_and_add_user(dbname, _user, "TestName", "TestPass")

# %% add random car

_carMakes = ["Volvo","Toyota","Ford","BMW","Kia"]
_carModels = ["F150","Alaska","Century","Corolla","Land Cruiser"]

_car = "CAR"+str(rnd.randint(10000, 99999))

create_and_add_car(dbname, _user, _car, rnd.choice(_carMakes), rnd.choice(_carModels),car_price=rnd.randint(10000, 100000),car_year=rnd.randint(1990, 2024))

# %% add random review

_review = "REV"+str(rnd.randint(10000, 99999))

_randReviews = ["Good car. Had it for a while now and it handles milage like a champ. Havent had to take it to the 'chanic for anything non standard",
                "Had this car for a while now, its terrible. I've had to take it into the machanic now 6 times because it's broken down so many times. As someone who relies on this car for their family I would not recommend.",
                "Update: had to take the car into the mechanic for the first time today which is shocking since I got it way back in may last year! Rides great and has only broken down the one time which is shocking since I've put this car through some abuse lol",
                "Had to get the car reapolstered today, was a bit costly but from the damage my kids have done it's like i'm looking at a new car lol. This car has been a real help with my family of 6, I couldn't get through the day without it!"]

create_and_add_rev(dbname, _user, _car, _review, rnd.choice(_randReviews))
