from django.urls import path
from .views import (
    RegisterView,
    LogoutView,
    DataView,
    HistoryView,
    ClockDataView,
    ClockHistoryView,
    SummaryView,
    SummaryHistoryView,
)
from .views import MyTokenObtainPairView

from rest_framework_simplejwt.views import (
    TokenRefreshView,
)

urlpatterns = [
    path("login/", MyTokenObtainPairView.as_view(), name="token_obtain_pair"),
    path("login/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
    path("logout/", LogoutView.as_view()),
    path("register/", RegisterView.as_view()),
    path("data/", DataView.as_view()),
    path("history/", HistoryView.as_view()),
    path("clockdata/", ClockDataView.as_view()),
    path("clockhistory/", ClockHistoryView.as_view()),
    path("summary/", SummaryView.as_view()),
    path("summaryhistory/", SummaryHistoryView.as_view()),
]
