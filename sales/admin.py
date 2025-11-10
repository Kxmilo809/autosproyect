from django.contrib import admin
from .models import Sale, SaleItem

@admin.register(Sale)
class SaleAdmin(admin.ModelAdmin):
    list_display = ('date', 'total')
    list_filter = ('date',)
    search_fields = ('date',)
    verbose_name = "Venta"
    verbose_name_plural = "Ventas"

@admin.register(SaleItem)
class SaleItemAdmin(admin.ModelAdmin):
    list_display = ('sale', 'car_model', 'quantity', 'price')
    search_fields = ('car_model__name',)
    verbose_name = "Item de Venta"
    verbose_name_plural = "Items de Venta"
