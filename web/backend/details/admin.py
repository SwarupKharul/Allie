from django.contrib import admin
from .models import User,Data,Clock

class DataAdmin(admin.ModelAdmin):
    readonly_fields = ("created",)
class ClockAdmin(admin.ModelAdmin):
    readonly_fields = ("created",)

admin.site.register(User)
admin.site.register(Data,DataAdmin)
admin.site.register(Clock,ClockAdmin)
