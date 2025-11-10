from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required, user_passes_test
from .models import CarModel
from .forms import CarModelForm

def is_admin(user):
    return user.is_staff or user.is_superuser

def vehicle_list(request):
    vehicles = CarModel.objects.all()
    return render(request, 'vehicles/vehicle_list.html', {'vehicles': vehicles})

@login_required
@user_passes_test(is_admin)
def vehicle_create(request):
    if request.method == 'POST':
        form = CarModelForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, 'Vehículo creado exitosamente.')
            return redirect('vehicle_list')
    else:
        form = CarModelForm()
    return render(request, 'vehicles/vehicle_form.html', {'form': form, 'title': 'Crear Vehículo'})

@login_required
@user_passes_test(is_admin)
def vehicle_update(request, pk):
    vehicle = get_object_or_404(CarModel, pk=pk)
    if request.method == 'POST':
        form = CarModelForm(request.POST, request.FILES, instance=vehicle)
        if form.is_valid():
            form.save()
            messages.success(request, 'Vehículo actualizado exitosamente.')
            return redirect('vehicle_list')
    else:
        form = CarModelForm(instance=vehicle)
    return render(request, 'vehicles/vehicle_form.html', {'form': form, 'title': 'Editar Vehículo'})

@login_required
@user_passes_test(is_admin)
def vehicle_delete(request, pk):
    vehicle = get_object_or_404(CarModel, pk=pk)
    if request.method == 'POST':
        vehicle.delete()
        messages.success(request, 'Vehículo eliminado exitosamente.')
        return redirect('vehicle_list')
    return render(request, 'vehicles/vehicle_confirm_delete.html', {'vehicle': vehicle})
