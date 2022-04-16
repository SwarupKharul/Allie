import json
import requests


def func():
    url = "https://api.symbl.ai/v1/process/audio"
    conversationid = ''
    payload = None
    numberOfBytes = 0
    
    try:
        audio_file = open('media/voice.mp3', 'rb')  # use (r"path/to/file") when using windows path
        payload = audio_file.read()
        numberOfBytes = len(payload)
    except FileNotFoundError:
        print("Could not read the file provided.")
        exit()

    access_token = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlFVUTRNemhDUVVWQk1rTkJNemszUTBNMlFVVTRRekkyUmpWQ056VTJRelUxUTBVeE5EZzFNUSJ9.eyJodHRwczovL3BsYXRmb3JtLnN5bWJsLmFpL3VzZXJJZCI6IjY2OTU1OTM3MTkxMDM0ODgiLCJpc3MiOiJodHRwczovL2RpcmVjdC1wbGF0Zm9ybS5hdXRoMC5jb20vIiwic3ViIjoiaXRwcmVNaXpEV3g2azdJRjhpMkR2NnVJcFJrNWhZRU1AY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vcGxhdGZvcm0ucmFtbWVyLmFpIiwiaWF0IjoxNjUwMDQzOTQ0LCJleHAiOjE2NTAxMzAzNDQsImF6cCI6Iml0cHJlTWl6RFd4Nms3SUY4aTJEdjZ1SXBSazVoWUVNIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.MC3pH2e-hgBnufDM3ad7ko__y5V1Q-cUc6LHl51H7raIdqgOh3nJGbE58AfyTDJ6Dc77LRD3nDLhy51zDYEAM1kxrbWQwPFTYFO0S6m7dPb5dP3P4ZiB6hEu3MvAaBz28-Fg52toD6mB1O5n6NJnfnhp1U8kvSBCa9t3xbUIdwoDZ_kofqt6ReG23zy580AVajkWAOlVPq8WKi3U-HaCtvzugm9VqWH-hksm33AiS2jxYmJ0LxR-mStEl3QwiUfCRXp3srn4H37zcoSMfpCGonMgzMWhykvsACVWSJ-Y2vbQRU8q9hZEgVW429Em24n6_yiCJ675TPD6gPZEWdFmtg'

    headers = {
        'Authorization': 'Bearer ' + access_token,
        'Content-Length': str(numberOfBytes),  # This should correctly indicate the length of the request body in bytes.
        'Content-Type': 'audio/mp3'
    }

    params = {
        'name': "BusinessMeeting",
        'confidenceThreshold': 0.6,

    }

    responses = {
        400: 'Bad Request! Please refer docs for correct input fields.',
        401: 'Unauthorized. Please generate a new access token.',
        404: 'The conversation and/or it\'s metadata you asked could not be found, please check the input provided',
        429: 'Maximum number of concurrent jobs reached. Please wait for some requests to complete.',
        500: 'Something went wrong! Please contact support@symbl.ai'
    }

    response = requests.request("POST", url, headers=headers, data=payload, params=json.dumps(params))

    if response.status_code == 201:
        # Successful API execution
        conversationid = response.json()['conversationId']
        print("conversationId => " + response.json()['conversationId'])  # ID to be used with Conversation API.
        print("jobId => " + response.json()['jobId'])  # ID to be used with Job API.
    elif response.status_code in responses.keys():
        print(responses[response.status_code])  # Expected error occurred
    else:
        print("Unexpected error occurred. Please contact support@symbl.ai" + ", Debug Message => " + str(response.text))

    print(type(conversationid))
    return conversationid


