from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser, FormParser
from django.core.files.storage import default_storage
import os
import json
import requests
import random

from rest_framework.exceptions import AuthenticationFailed
from django.contrib.auth.decorators import login_required
from rest_framework_simplejwt.tokens import RefreshToken
from .serializers import UserSerializer, LogoutSerializer, DataSerializer,ClockDataSerializer, SummarySerializer
from .models import Data,Clock,Summary
from rest_framework import status
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework import generics,status,views,permissions
from .models import User
import jwt, datetime
from .main import *


from rest_framework_simplejwt.views import TokenObtainPairView
from .serializers import MyTokenObtainPairSerializer

def func2(convid):
    conversationId = convid 
    print(convid) # Generated using Submit text end point
    baseUrl = 'https://api.symbl.ai/v1/conversations/'+"6733857515634688"+"/topics"
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


def listToString(s): 
    str1 = s[0] 
    for ele in s[1::]: 
        str1 = str1 + "," + ele 
    return str1 

class MyTokenObtainPairView(TokenObtainPairView):
    permission_classes = (AllowAny,)
    serializer_class = MyTokenObtainPairSerializer

class RegisterView(APIView):
    def post(self,request):
        serializer = UserSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        user = User.objects.last()
        print(user)
        refresh = RefreshToken.for_user(user)

        return Response({ 
            'userid':user.id,
        'refresh': str(refresh),
        'access': str(refresh.access_token),
        },status=status.HTTP_201_CREATED)
        # print(MyTokenObtainPairView())
        # return Response({"data":MyTokenObtainPairView()})
        # return Response(serializer.data)

class LogoutView(APIView):
    serializer_class = LogoutSerializer
    def post(self, request):
        permission_classes = (permissions.IsAuthenticated,)
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()

        # return Response(status=status.HTTP_204_NO_CONTENT)
        return Response({"user":serializer.data,"status":"logged out"})


class DataView(APIView):
    serializer_class = DataSerializer
    def post(self,request):
        permission_classes = (IsAuthenticated,)
        diction = {'user':request.user.id,
        'wpm':request.data['wpm'],
        'totaltime':request.data['totaltime']
        }
        serializer = DataSerializer(data=diction)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class HistoryView(APIView):
    def get(self,request):
        permission_classes = (IsAuthenticated,)
        user = self.request.user
        datas = list(Data.objects.filter(user = user.id))
        # print(datas[0].wpm) avg - 140 , 170, 0.5
        l = len(datas)
        print(l)
        sum_wpm=0
        sum_tt=0
        for i in range(l):
            sum_wpm += datas[i].wpm
            sum_tt += datas[i].totaltime
        avg_wpm = round(sum_wpm/l,1)
        avg_tt = round(sum_tt/l,1)
        
        print(avg_wpm)
        print(avg_tt)
        diction = {'user':user.id,
        'wpm_avg':avg_wpm,
        'tt_avg':avg_tt,
        }
        
        return JsonResponse(diction, status=status.HTTP_400_BAD_REQUEST)

class ClockDataView(APIView):
    serializer_class = ClockDataSerializer
    def post(self,request):
        permission_classes = (IsAuthenticated,)
        diction = {'user':request.user.id,
        'value':request.data['value'],
        }
        serializer =  ClockDataSerializer(data=diction)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class ClockHistoryView(APIView):
    def get(self,request):
        permission_classes = (IsAuthenticated,)
        user = self.request.user
        datas = list(Clock.objects.filter(user = user.id))
        history = []
        l = len(datas)
        for i in range(l):
            history.append({
                "value" :  datas[i].value,
                "timestamp": datas[i].created
            })
        
        return JsonResponse({"history":history}, status=status.HTTP_400_BAD_REQUEST)

class SummaryView(APIView):
    serializer_class = SummarySerializer
    parser_classes = (MultiPartParser, FormParser)
    def post(self,request,*args, **kwargs):
        if "file" in request.FILES:
            file = request.FILES["file"]
            base, ext = os.path.splitext(file.name)
            url = str(request.user.id) + str(random.randint(0, 5000))
            default_storage.save(url + ".mp3", file)
            print(url + ".mp3")
            convid = func(url + ".mp3")
            print("inside convid", convid)
            lis = func2(convid)
            print("lis",lis)
            permission_classes = (IsAuthenticated,)
            str1 = listToString(lis)
            diction = {
                'user':request.user.id,
                'summary':str1,
            }
            print(diction)
            serializer = SummarySerializer(data=diction)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class SummaryHistoryView(APIView):
    def get(self,request):
        permission_classes = (IsAuthenticated,)
        user = self.request.user
        datas = list(Summary.objects.filter(user = user.id))
        history = []
        l = len(datas)
        for i in range(l):
            history.append({
                "keywords" : datas[i].summary.split(','),
                "timestamp": datas[i].created
            })
        
        return JsonResponse({"history":history}, status=status.HTTP_201_CREATED)