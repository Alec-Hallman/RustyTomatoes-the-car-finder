# -*- coding: utf-8 -*-
"""
Created on Fri May 17 23:04:09 2024

@author: Michael
"""
# Get the database store it in collection_name

# Get the database using the method we defined in pymongo_test_insert file

from pymongo_get_database import get_database
dbname = get_database()
collection_name = dbname["review"]

# %% adds a cluster of data to database
item_1 = {
  "car_id" : "CAR00001",
  "rev_id" : "REV00001",
  "rev_review" : "Just bought the car, dealership was great! I haven't even done my break in yet. Can't wait to drive it after."

}

item_2 = {
  "car_id" : "CAR00002",
  "rev_id" : "REV00002",
  "rev_review" : "Really enjoying driving already put on 10,000! Suspension is great. Can't wait for my warrenty to end so I can mod it."

}

item_3 = {
  "car_id" : "CAR00003",
  "rev_id" : "REV00003",
  "rev_review" : "One year in, costing me a fortune lol. Wish I just got a lexus. However, people do notice me in my blue rr."

}
collection_name.insert_many([item_1,item_2,item_3])

# %% adds a single document to our database
from dateutil import parser
expiry_date = '2021-07-13T00:00:00.000Z'
expiry = parser.parse(expiry_date)
item_3 = {
  "item_name" : "Bread",
  "quantity" : 2,
  "ingredients" : "all-purpose flour",
  "expiry_date" : expiry
}
collection_name.insert_one(item_3)