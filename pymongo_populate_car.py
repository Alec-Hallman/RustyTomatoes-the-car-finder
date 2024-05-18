# -*- coding: utf-8 -*-
"""
Created on Fri May 17 23:04:09 2024

@author: Michael
"""
# Get the database store it in collection_name

# Get the database using the method we defined in pymongo_test_insert file

from pymongo_get_database import get_database
dbname = get_database()
collection_name = dbname["car"]

# %% adds a cluster of data to database
item_1 = {
  "user_id" : "USR00001",
  "car_id" : "CAR00001",
  "car_make" : "Mercedes-Benz",
  "car_model" : "S 580",
  "car_doors" : "4",
  "car_price" : "235340",
  "car_engine_type" : "V8",
  "car_engine_size" : "4.0",
  "car_year" : "2024",
  "car_body_type" : "Sedan",
  "car_drivetrain" : "AWD",
  "car_transmission" : "Automatic",
  "car_seats" : "4",
  "car_classification" : "Luxury",
  "car_colour" : "White",
  "car_interior_fabric" : "Leather"

}

item_2 = {
  "user_id" : "USR00002",
  "car_id" : "CAR00002",
  "car_make" : "Porsche",
  "car_model" : "Panamera",
  "car_doors" : "4",
  "car_price" : "220776",
  "car_engine_type" : "V6",
  "car_engine_size" : "2.9",
  "car_year" : "2024",
  "car_body_type" : "Hatchback",
  "car_drivetrain" : "AWD",
  "car_transmission" : "Automatic",
  "car_seats" : "4",
  "car_classification" : "Luxury",
  "car_colour" : "Green",
  "car_interior_fabric" : "Fabric"

}

item_3 = {
  "user_id" : "USR00003",
  "car_id" : "CAR00003",
  "car_make" : "Rolls-Royce",
  "car_model" : "Spectre",
  "car_doors" : "2",
  "car_price" : "771104",
  "car_engine_type" : "Electric Dual Motor",
  "car_engine_size" : "N/A",
  "car_year" : "2023",
  "car_body_type" : "Coupe",
  "car_drivetrain" : "AWD",
  "car_transmission" : "Automatic",
  "car_seats" : "4",
  "car_classification" : "Luxury",
  "car_colour" : "Blue",
  "car_interior_fabric" : "Leather"

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