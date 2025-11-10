from django.contrib import admin
from django.utils.html import format_html
from .models import Category, Brand, CarModel

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name',)
    verbose_name = "Categoría"
    verbose_name_plural = "Categorías"

@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):
    list_display = ('name',)
    verbose_name = "Marca"
    verbose_name_plural = "Marcas"

@admin.register(CarModel)
class CarModelAdmin(admin.ModelAdmin):
    list_display = ('name', 'brand', 'category', 'year', 'price', 'imagen_preview')
    list_filter = ('brand', 'category', 'year')
    search_fields = ('name', 'brand__name')
    readonly_fields = ('imagen_preview',)
    verbose_name = "Modelo de Auto"
    verbose_name_plural = "Modelos de Autos"

    def imagen_preview(self, obj):
        if obj.imagen:
            return format_html('<img src="/static/autos_app/{}" style="max-height: 200px;"/>', obj.imagen)
        return ""
    imagen_preview.short_description = 'Vista previa de la imagen'
