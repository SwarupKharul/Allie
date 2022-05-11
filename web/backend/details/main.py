import json
import requests


def func(filename):
    url = "https://api.symbl.ai/v1/process/audio"
    payload = None
    numberOfBytes = 0

    try:
        audio_file = open(
            "media/" + "3232.mp3", "rb"
        )  # use (r"path/to/file") when using windows path
        payload = audio_file.read()
        numberOfBytes = len(payload)
    except FileNotFoundError:
        print("Could not read the file provided.")

    access_token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlFVUTRNemhDUVVWQk1rTkJNemszUTBNMlFVVTRRekkyUmpWQ056VTJRelUxUTBVeE5EZzFNUSJ9.eyJodHRwczovL3BsYXRmb3JtLnN5bWJsLmFpL3VzZXJJZCI6IjU3NDExNDc5MjUyNTAwNDgiLCJpc3MiOiJodHRwczovL2RpcmVjdC1wbGF0Zm9ybS5hdXRoMC5jb20vIiwic3ViIjoiNTM1UU82UDQ2OU9JQnFYS3BGb2tRc1pPVWc5b2h1Y0xAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vcGxhdGZvcm0ucmFtbWVyLmFpIiwiaWF0IjoxNjUyMzAxMjU2LCJleHAiOjE2NTIzODc2NTYsImF6cCI6IjUzNVFPNlA0NjlPSUJxWEtwRm9rUXNaT1VnOW9odWNMIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.EyI7ioDIYajHeHyyHdZukIYyWjgNG46iyfXT2UmtgKc6A1kevUpw7QY8RtZ1hWaS65ekldy8GS5iOFRrFwUz9z6Px4G5ZMOEFWqQMgO6uF11p3vPkzRFiKa0zb3m7qr_RRzHw8t6oH6MHEb3KsFVujllsF14yA_vWettcHuw5y70Tp953susH4SsPhyY4x8VmwMtWxw1p8fLmLhF3AudmZmeXASwbNcdN61U7Jk9A6TxQamf1VYzBLJApK0XHMzwaYV1f-FZJ_V-z-7riCcFyvoQ9l6iUNfSqpaUud3HrCu7zKkGhlmXJDKK39Yw_G6lQJ-DzHiqSnLE5HtUuejtZw"

    headers = {
        "Authorization": "Bearer " + access_token,
        "Content-Length": str(
            numberOfBytes
        ),  # This should correctly indicate the length of the request body in bytes.
        "Content-Type": "audio/mp3",
    }

    params = {
        "name": "BusinessMeeting",
        "confidenceThreshold": 0.6,
    }

    responses = {
        400: "Bad Request! Please refer docs for correct input fields.",
        401: "Unauthorized. Please generate a new access token.",
        404: "The conversation and/or it's metadata you asked could not be found, please check the input provided",
        429: "Maximum number of concurrent jobs reached. Please wait for some requests to complete.",
        500: "Something went wrong! Please contact support@symbl.ai",
    }

    response = requests.request(
        "POST", url, headers=headers, data=payload, params=json.dumps(params)
    )

    if response.status_code == 201:
        # Successful API execution
        conversationid = response.json()["conversationId"]
        print(
            "conversationId => " + response.json()["conversationId"]
        )  # ID to be used with Conversation API.
        print("jobId => " + response.json()["jobId"])  # ID to be used with Job API.
    elif response.status_code in responses.keys():
        print(responses[response.status_code])  # Expected error occurred
    else:
        print(
            "Unexpected error occurred. Please contact support@symbl.ai"
            + ", Debug Message => "
            + str(response.text)
        )

    print(type(conversationid))
    return conversationid
