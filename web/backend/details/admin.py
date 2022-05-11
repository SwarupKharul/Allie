from django.contrib import admin
from .models import User, Data, Clock, Summary


class DataAdmin(admin.ModelAdmin):
    readonly_fields = ("created",)


class ClockAdmin(admin.ModelAdmin):
    readonly_fields = ("created",)


class SummaryAdmin(admin.ModelAdmin):
    readonly_fields = ("created",)


admin.site.register(User)
admin.site.register(Data, DataAdmin)
admin.site.register(Clock, ClockAdmin)
admin.site.register(Summary, SummaryAdmin)
