import json
import requests
from .main import *
import time


def func2(convid):
    print(convid)  # Generated using Submit text end point
    baseUrl = "https://api.symbl.ai/v1/conversations/{conversationId}/topics" 

    url = baseUrl.format(conversationId=convid)
    print("from func2 => ",url)

    # set your access token here. See https://docs.symbl.ai/docs/developer-tools/authentication
    access_token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlFVUTRNemhDUVVWQk1rTkJNemszUTBNMlFVVTRRekkyUmpWQ056VTJRelUxUTBVeE5EZzFNUSJ9.eyJodHRwczovL3BsYXRmb3JtLnN5bWJsLmFpL3VzZXJJZCI6IjU3NDExNDc5MjUyNTAwNDgiLCJpc3MiOiJodHRwczovL2RpcmVjdC1wbGF0Zm9ybS5hdXRoMC5jb20vIiwic3ViIjoiNTM1UU82UDQ2OU9JQnFYS3BGb2tRc1pPVWc5b2h1Y0xAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vcGxhdGZvcm0ucmFtbWVyLmFpIiwiaWF0IjoxNjUyMzAxMjU2LCJleHAiOjE2NTIzODc2NTYsImF6cCI6IjUzNVFPNlA0NjlPSUJxWEtwRm9rUXNaT1VnOW9odWNMIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.EyI7ioDIYajHeHyyHdZukIYyWjgNG46iyfXT2UmtgKc6A1kevUpw7QY8RtZ1hWaS65ekldy8GS5iOFRrFwUz9z6Px4G5ZMOEFWqQMgO6uF11p3vPkzRFiKa0zb3m7qr_RRzHw8t6oH6MHEb3KsFVujllsF14yA_vWettcHuw5y70Tp953susH4SsPhyY4x8VmwMtWxw1p8fLmLhF3AudmZmeXASwbNcdN61U7Jk9A6TxQamf1VYzBLJApK0XHMzwaYV1f-FZJ_V-z-7riCcFyvoQ9l6iUNfSqpaUud3HrCu7zKkGhlmXJDKK39Yw_G6lQJ-DzHiqSnLE5HtUuejtZw"

    headers = {
        "Authorization": "Bearer " + access_token,
        "Content-Type": "application/json",
    }

    params = {
        "sentiment": True,  # <Optional, boolean| Give you sentiment analysis on each topic in conversation.>
        "parentRefs": True,  # <Optional, boolean| Gives you topic hierarchy.>
    }

    responses = {
        401: "Unauthorized. Please generate a new access token.",
        404: "The conversation and/or it's metadata you asked could not be found, please check the input provided",
        500: "Something went wrong! Please contact support@symbl.ai",
    }

    time.sleep(5)

    response = requests.request("GET", url, headers=headers, params=json.dumps(params))

    if response.status_code == 200:
        # Successful API execution
        print(
            "topics => " + str(response.json()["topics"])
        )  # topics object containing topics id, text, type, score, messageIds, sentiment object, parentRefs
    elif response.status_code in responses.keys():
        print(responses[response.status_code])  # Expected error occurred
    else:
        print(
            "Unexpected error occurred. Please contact support@symbl.ai"
            + ", Debug Message => "
            + str(response.text)
        )

    l = []
    for i in range(len(response.json()["topics"])):
        l.append(response.json()["topics"][i]["text"])
    print("--------", l)
    return l
