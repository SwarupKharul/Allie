from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.exceptions import AuthenticationFailed
from django.contrib.auth.decorators import login_required
from .serializers import UserSerializer, LogoutSerializer, DataSerializer
from rest_framework import status
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework import generics,status,views,permissions
from .models import User
import jwt, datetime

from rest_framework_simplejwt.views import TokenObtainPairView
from .serializers import MyTokenObtainPairSerializer

class MyTokenObtainPairView(TokenObtainPairView):
    permission_classes = (AllowAny,)
    serializer_class = MyTokenObtainPairSerializer

class RegisterView(APIView):
    def post(self,request):
        serializer = UserSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

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