from django.contrib import admin
from .models import User,Data

class DataAdmin(admin.ModelAdmin):
    readonly_fields = ("created",)

admin.site.register(User)
admin.site.register(Data,DataAdmin)
