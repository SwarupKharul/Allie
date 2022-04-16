import json
import requests
from .main import *

def func2(convid):
    conversationId = convid 
    print(conversationId) # Generated using Submit text end point
    baseUrl = 'https://api.symbl.ai/v1/conversations/5728469911601152/topics'.format(conversationId)
    print(baseUrl)

    url = baseUrl.format(conversationId=conversationId)

    # set your access token here. See https://docs.symbl.ai/docs/developer-tools/authentication
    access_token = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlFVUTRNemhDUVVWQk1rTkJNemszUTBNMlFVVTRRekkyUmpWQ056VTJRelUxUTBVeE5EZzFNUSJ9.eyJodHRwczovL3BsYXRmb3JtLnN5bWJsLmFpL3VzZXJJZCI6IjY2OTU1OTM3MTkxMDM0ODgiLCJpc3MiOiJodHRwczovL2RpcmVjdC1wbGF0Zm9ybS5hdXRoMC5jb20vIiwic3ViIjoiaXRwcmVNaXpEV3g2azdJRjhpMkR2NnVJcFJrNWhZRU1AY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vcGxhdGZvcm0ucmFtbWVyLmFpIiwiaWF0IjoxNjUwMDQzOTQ0LCJleHAiOjE2NTAxMzAzNDQsImF6cCI6Iml0cHJlTWl6RFd4Nms3SUY4aTJEdjZ1SXBSazVoWUVNIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.MC3pH2e-hgBnufDM3ad7ko__y5V1Q-cUc6LHl51H7raIdqgOh3nJGbE58AfyTDJ6Dc77LRD3nDLhy51zDYEAM1kxrbWQwPFTYFO0S6m7dPb5dP3P4ZiB6hEu3MvAaBz28-Fg52toD6mB1O5n6NJnfnhp1U8kvSBCa9t3xbUIdwoDZ_kofqt6ReG23zy580AVajkWAOlVPq8WKi3U-HaCtvzugm9VqWH-hksm33AiS2jxYmJ0LxR-mStEl3QwiUfCRXp3srn4H37zcoSMfpCGonMgzMWhykvsACVWSJ-Y2vbQRU8q9hZEgVW429Em24n6_yiCJ675TPD6gPZEWdFmtg'

    headers = {
        'Authorization': 'Bearer ' + access_token,
        'Content-Type': 'application/json'
    }

    params = {
        'sentiment': True,  # <Optional, boolean| Give you sentiment analysis on each topic in conversation.>
        'parentRefs': True,  # <Optional, boolean| Gives you topic hierarchy.>
    }

    responses = {
        401: 'Unauthorized. Please generate a new access token.',
        404: 'The conversation and/or it\'s metadata you asked could not be found, please check the input provided',
        500: 'Something went wrong! Please contact support@symbl.ai'
    }

    response = requests.request("GET", url, headers=headers, params=json.dumps(params))

    if response.status_code == 200:
        # Successful API execution
        print("topics => " + str(response.json()['topics']))  # topics object containing topics id, text, type, score, messageIds, sentiment object, parentRefs
    elif response.status_code in responses.keys():
        print(responses[response.status_code])  # Expected error occurred
    else:
        print("Unexpected error occurred. Please contact support@symbl.ai" + ", Debug Message => " + str(response.text))

    l = []
    for i in range(len(response.json()['topics'])):
        l.append(response.json()['topics'][i]['text'])
    print("--------",l)
    return l

