from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser, FormParser
from django.core.files.storage import default_storage
import os
import random

from rest_framework.exceptions import AuthenticationFailed
from rest_framework_simplejwt.tokens import RefreshToken
from .serializers import (
    UserSerializer,
    LogoutSerializer,
    DataSerializer,
    ClockDataSerializer,
    SummarySerializer,
)
from rest_framework import status
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework import generics, status, views, permissions
from rest_framework_simplejwt.views import TokenObtainPairView


from .models import Data, Clock, Summary, User
from .serializers import MyTokenObtainPairSerializer
from .main import func
from .summary import func2


def listToString(s):
    str1 = s[0]
    for ele in s[1::]:
        str1 = str1 + "," + ele
    return str1


class MyTokenObtainPairView(TokenObtainPairView):
    permission_classes = (AllowAny,)
    serializer_class = MyTokenObtainPairSerializer


class RegisterView(APIView):
    def post(self, request):
        serializer = UserSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        user = User.objects.last()
        print(user)
        refresh = RefreshToken.for_user(user)

        return Response(
            {
                "userid": user.id,
                "refresh": str(refresh),
                "access": str(refresh.access_token),
            },
            status=status.HTTP_201_CREATED,
        )
        # print(MyTokenObtainPairView())
        # return Response({"data":MyTokenObtainPairView()})
        # return Response(serializer.data)


class LogoutView(APIView):
    serializer_class = LogoutSerializer
    permission_classes = (permissions.IsAuthenticated,)

    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()

        # return Response(status=status.HTTP_204_NO_CONTENT)
        return Response({"user": serializer.data, "status": "logged out"})


class DataView(APIView):
    serializer_class = DataSerializer
    permission_classes = (IsAuthenticated,)

    def post(self, request):
        diction = {
            "user": request.user.id,
            "wpm": request.data["wpm"],
            "totaltime": request.data["totaltime"],
        }
        serializer = DataSerializer(data=diction)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class HistoryView(APIView):
    permission_classes = (IsAuthenticated, )

    def get(self, request):
        user = self.request.user
        datas = list(Data.objects.filter(user=user.id))
        # print(datas[0].wpm) avg - 140 , 170, 0.5
        l = len(datas)
        print(l)
        sum_wpm = 0
        sum_tt = 0
        for i in range(l):
            sum_wpm += datas[i].wpm
            sum_tt += datas[i].totaltime
        avg_wpm = round(sum_wpm / l, 1)
        avg_tt = round(sum_tt / l, 1)

        print(avg_wpm)
        print(avg_tt)
        diction = {
            "user": user.id,
            "wpm_avg": avg_wpm,
            "tt_avg": avg_tt,
        }

        return JsonResponse(diction, status=status.HTTP_400_BAD_REQUEST)


class ClockDataView(APIView):
    permission_classes = (IsAuthenticated, )
    serializer_class = ClockDataSerializer

    def post(self, request):
        diction = {
            "user": request.user.id,
            "value": request.data["value"],
        }
        serializer = ClockDataSerializer(data=diction)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def get(self, request):
        user = self.request.user
        datas = list(Clock.objects.filter(user=user.id))
        history = []
        l = len(datas)
        for i in range(l):
            history.append({"value": datas[i].value, "timestamp": datas[i].created})

        return JsonResponse({"history": history}, status=status.HTTP_400_BAD_REQUEST)



class SummaryView(APIView):
    permission_classes = (IsAuthenticated,)
    serializer_class = SummarySerializer
    parser_classes = (MultiPartParser, FormParser)

    def post(self, request, *args, **kwargs):
        if "file" in request.FILES:
            file = request.FILES["file"]
            base, ext = os.path.splitext(file.name)
            url = str(request.user.id) + str(random.randint(0, 5000))
            default_storage.save(url + ".mp3", file)
            print(url + ".mp3")
            convid = func(url + ".mp3")
            print("inside convid", convid)
            lis = func2(convid)
            print("lis", lis)
            str1 = listToString(lis)
            diction = {
                "user": request.user.id,
                "summary": str1,
            }
            print(diction)
            serializer = SummarySerializer(data=diction)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def get(self, request):
        user = self.request.user
        datas = list(Summary.objects.filter(user=user.id))
        history = []
        l = len(datas)
        for i in range(l):
            history.append(
                {"keywords": datas[i].summary.split(","), "timestamp": datas[i].created}
            )

        return JsonResponse({"history": history}, status=status.HTTP_201_CREATED)


    
