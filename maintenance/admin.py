from django.contrib import admin
from .models import Maintenance

@admin.register(Maintenance)
class MaintenanceAdmin(admin.ModelAdmin):
    list_display = ('vehicle', 'date', 'description', 'cost')
    list_filter = ('date', 'vehicle__brand')
    search_fields = ('vehicle__name', 'description')
