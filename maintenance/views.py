from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required, user_passes_test
from .models import Maintenance
from .forms import MaintenanceForm

def is_admin(user):
    return user.is_staff or user.is_superuser

def maintenance_list(request):
    maintenances = Maintenance.objects.all()
    return render(request, 'maintenance/maintenance_list.html', {'maintenances': maintenances})

@login_required
@user_passes_test(is_admin)
def maintenance_create(request):
    if request.method == 'POST':
        form = MaintenanceForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Mantenimiento creado exitosamente.')
            return redirect('maintenance_list')
    else:
        form = MaintenanceForm()
    return render(request, 'maintenance/maintenance_form.html', {'form': form, 'title': 'Crear Mantenimiento'})

@login_required
@user_passes_test(is_admin)
def maintenance_update(request, pk):
    maintenance = get_object_or_404(Maintenance, pk=pk)
    if request.method == 'POST':
        form = MaintenanceForm(request.POST, instance=maintenance)
        if form.is_valid():
            form.save()
            messages.success(request, 'Mantenimiento actualizado exitosamente.')
            return redirect('maintenance_list')
    else:
        form = MaintenanceForm(instance=maintenance)
    return render(request, 'maintenance/maintenance_form.html', {'form': form, 'title': 'Editar Mantenimiento'})

@login_required
@user_passes_test(is_admin)
def maintenance_delete(request, pk):
    maintenance = get_object_or_404(Maintenance, pk=pk)
    if request.method == 'POST':
        maintenance.delete()
        messages.success(request, 'Mantenimiento eliminado exitosamente.')
        return redirect('maintenance_list')
    return render(request, 'maintenance/maintenance_confirm_delete.html', {'maintenance': maintenance})
