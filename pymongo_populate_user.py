# -*- coding: utf-8 -*-
"""
Created on Fri May 17 23:04:09 2024

@author: Michael
"""
# Get the database store it in collection_name

# Get the database using the method we defined in pymongo_test_insert file

from pymongo_get_database import get_database
dbname = get_database()
collection_name = dbname["user"]

# %% adds a cluster of data to database
item_1 = {
  "user_id" : "USR00001",
  "user_name" : "Michael D'Onofrio",
  "user_pass" : "00000000"

}

item_2 = {
  "user_id" : "USR00002",
  "user_name" : "Alec Hallman",
  "user_pass" : "00000000"

}

item_3 = {
  "user_id" : "USR00003",
  "user_name" : "Jot Sandhu",
  "user_pass" : "00000000"

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