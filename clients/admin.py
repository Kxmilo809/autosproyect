from django.contrib import admin
from .models import Client, Purchase

@admin.register(Client)
class ClientAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'phone')
    search_fields = ('name', 'email', 'phone')

@admin.register(Purchase)
class PurchaseAdmin(admin.ModelAdmin):
    list_display = ('client', 'date', 'total')
    list_filter = ('date',)
    search_fields = ('client__name',)
