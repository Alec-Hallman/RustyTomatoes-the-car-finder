# -*- coding: utf-8 -*-
"""
Created on Sat May 18 13:27:59 2024

@author: Michael
"""

from pymongo_create_database import get_database
from pandas import DataFrame
dbname = get_database()


def find_cars(key, element):
    
    collection_car = dbname["car"]
    # query the car db for key and element
    df_finder = DataFrame(collection_car.find({key : element}))
    #print(df_finder["car_id"])
    return df_finder["car_id"].tolist()

print(find_cars("car_doors",4))

def find_car_reviews_from_id(car_id):
    
    collection_car = dbname["review"]
    # query the car db for key and element
    df_finder = DataFrame(collection_car.find({"car_id" : car_id}))
   # print(df_finder["rev_id"])
    return df_finder["rev_id"].tolist()
    
print(find_car_reviews_from_id("CAR00010"))

# car id -> image url, car make, car model
# rev_id -> user, date, descr

def get_car_info(car_id):
    collection_car = dbname["car"]
    df_finder = DataFrame(collection_car.find({"car_id" : car_id}))
    
    lst = []
    lst.append(df_finder["car_make"][0])
    lst.append(df_finder["car_model"][0])
    lst.append(df_finder["car_photo"][0])
    return lst

def get_review_info(rev_id):
    collection_car = dbname["review"]
    df_finder = DataFrame(collection_car.find({"rev_id" : rev_id}))
    
    lst = []
    lst.append(df_finder["rev_review"][0])
    lst.append(df_finder["rev_date"][0])
    lst.append(df_finder["user_id"][0])
    return lst

print(get_car_info("CAR00010"))
print(get_review_info("REV00005"))