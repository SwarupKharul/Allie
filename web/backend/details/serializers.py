from rest_framework import serializers
from .models import User, Data, Clock, Summary
from rest_framework.exceptions import AuthenticationFailed
from rest_framework_simplejwt.tokens import RefreshToken, TokenError
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["id", "email", "password"]
        extra_kwargs = {"password": {"write_only": True}}

    def create(self, validated_data):
        password = validated_data.pop("password", None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password)
        instance.save()
        return instance


class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)
        token["email"] = user.email
        return token


class LogoutSerializer(serializers.Serializer):
    refresh = serializers.CharField()
    default_error_messages = {"bad_token": ("Token is expired or invalid")}

    def validate(self, attrs):
        self.token = attrs["refresh"]
        return attrs

    def save(self, **kwargs):
        try:
            RefreshToken(self.token).blacklist()
        except TokenError:
            self.fail("bad_token")


class DataSerializer(serializers.ModelSerializer):
    class Meta:
        model = Data
        fields = ["wpm", "totaltime", "user"]

    def create(self, validated_data):
        data = Data.objects.create(
            user=validated_data["user"],
            wpm=validated_data["wpm"],
            totaltime=validated_data["totaltime"],
        )
        return data


# class HistorySerializer(serializers.ModelSerializer):
#     class Meta:
#         model = History
#         fields = '__all__'

#     def create(self,validated_data):
#         data = History.objects.create(
#             user = validated_data['user'],
#             wpm_avg = validated_data['wpm_avg'],
#             tt_avg = validated_data['tt_avg'],
#             wpm_normal = validated_data['wpm_normal'],
#             tt_normal = validated_data['tt_normal'],
#             # wpm_diff = validated_data['wpm_diff'],
#             # tt_diff = validated_data['tt_diff'],
#         )
#         return data


class ClockDataSerializer(serializers.ModelSerializer):
    class Meta:
        model = Clock
        fields = "__all__"

        def create(self, validated_data):
            data = Data.objects.create(
                user=validated_data["user"], value=validated_data["value"]
            )
            return data


class SummarySerializer(serializers.ModelSerializer):
    class Meta:
        model = Summary
        fields = "__all__"

        def create(self, validated_data):
            # print(validated_data)
            data = Summary.objects.create(
                user=validated_data["user"], summary=validated_data["summary"]
            )
            return data
