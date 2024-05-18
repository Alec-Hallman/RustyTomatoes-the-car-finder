# -*- coding: utf-8 -*-
"""
Created on Sat May 18 12:28:03 2024

@author: Michael
"""

import requests
import json
url = "https://us-east-1.aws.data.mongodb-api.com/app/data-fjjgdws/endpoint/data/v1/action/findOne"

payload = json.dumps({
    "collection": "<COLLECTION_NAME>",
    "database": "Car_Finder_Application",
    "dataSource": "Cluster0",
    "projection": {
        "_id": 1
    }
})
headers = {
  'Content-Type': 'application/json',
  'Access-Control-Request-Headers': '*',
  'api-key': 'idvQrrLGwcaRHYlBiNsxfXRn0wadg9qFFI1ftyPQHDpxirQGvn9wPDV4KBSXou9j',
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
