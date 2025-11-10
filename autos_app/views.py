from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from vehicles.models import Category, Brand, CarModel
from clients.forms import ClientForm
from vehicles.forms import CarModelForm
from maintenance.forms import MaintenanceForm

def home(request):
    # Información de la empresa y fotos de autos para mostrar en la página de inicio
    context = {
        'empresa_info': 'Somos una empresa dedicada a la venta y mantención de autos de alta calidad.',
        'fotos_autos': [
            'autos_app/911.jpg',
            'autos_app/Accord.jpg',
            'autos_app/Altima.webp',
            'autos_app/Aventador.jpg',
            'autos_app/Cayman.jpg',
            'autos_app/City.avif',
            'autos_app/Civic.avif',
            'autos_app/Colorado.webp',
            'autos_app/Elantra.jpg',
            'autos_app/F-150.png',
            'autos_app/ferrari_488.jpg',
            'autos_app/ferrari_roma.jpg',
            'autos_app/ferrari_sf90.jpg',
            'autos_app/Highlander.jpg',
            'autos_app/Hilux.avif',
            'autos_app/huracan.jpg',
            'autos_app/Land Cruiser.webp',
            'autos_app/Q5.jpg',
            'autos_app/Q7.avif',
            'autos_app/Q8.jpg',
            'autos_app/Ranger.jpg',
            'autos_app/Raptor.webp',
            'autos_app/RAV4.webp',
            'autos_app/S10.webp',
            'autos_app/Sentra.webp',
            'autos_app/Silverado.jpg',
            'autos_app/Sonata.jpg',
            'autos_app/Tacoma.jpg',
            'autos_app/Taycan.jpg',
            'autos_app/Tundra.jpg',
            'autos_app/Urus.jpg',
            'autos_app/Versa.jpg',
            'autos_app/X5.webp',
            'autos_app/X6.jpg',
            'autos_app/X7.jpg',
        ],
    }
    return render(request, 'autos_app/home.html', context)

@login_required
def admin_home(request):
    if request.method == 'POST':
        form_type = request.POST.get('form_type')
        if form_type == 'vehicle':
            form = CarModelForm(request.POST, request.FILES)
            if form.is_valid():
                form.save()
                messages.success(request, 'Vehículo creado exitosamente.')
                return redirect('admin_home')
        elif form_type == 'client':
            form = ClientForm(request.POST)
            if form.is_valid():
                form.save()
                messages.success(request, 'Cliente creado exitosamente.')
                return redirect('admin_home')
        elif form_type == 'maintenance':
            form = MaintenanceForm(request.POST)
            if form.is_valid():
                form.save()
                messages.success(request, 'Mantenimiento creado exitosamente.')
                return redirect('admin_home')
    else:
        vehicle_form = CarModelForm()
        client_form = ClientForm()
        maintenance_form = MaintenanceForm()

    context = {
        'vehicle_form': vehicle_form,
        'client_form': client_form,
        'maintenance_form': maintenance_form,
    }
    return render(request, 'autos_app/admin_home.html', context)

def mantenciones(request):
    return render(request, 'autos_app/mantenciones.html')

def quienes_somos(request):
    return render(request, 'autos_app/quienes_somos.html')

def venta(request):
    return render(request, 'autos_app/venta.html')

def index(request):
    tipos = Category.objects.all()
    return render(request, 'autos_app/index.html', {"tipos": tipos})

def marcas(request, tipo):
    tipo = tipo.title()
    marcas = Brand.objects.filter(carmodel__category__name=tipo).distinct()
    tipos = Category.objects.all()
    return render(request, 'autos_app/marcas.html', {"tipo": tipo, "marcas": marcas, "tipos": tipos})

def modelos(request, tipo, marca):
    tipo = tipo.title()
    marca = marca.title()
    modelos = CarModel.objects.filter(category__name=tipo, brand__name=marca)
    tipos = Category.objects.all()
    return render(request, 'autos_app/modelos.html', {"tipo": tipo, "marca": marca, "modelos": modelos, "tipos": tipos})

def detalle(request, tipo, marca, modelo):
    info = CarModel.objects.get(category__name=tipo, brand__name=marca, name=modelo)
    return render(request, 'autos_app/detalle.html', {"tipo": tipo, "marca": marca, "modelo": modelo, "info": info})

def logout_view(request):
    logout(request)
    return redirect('index')
