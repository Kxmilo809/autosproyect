from django.core.management.base import BaseCommand
from vehicles.models import Category, Brand, CarModel

class Command(BaseCommand):
    help = 'Populate the database with car data'

    def handle(self, *args, **options):
        catalogo = {
            "Deportivos": {
                "Ferrari": ["488", "Roma", "SF90"],
                "Lamborghini": ["Huracán", "Aventador", "Urus"],
                "Porsche": ["911", "Cayman", "Taycan"]
            },
            "SUV": {
                "Toyota": ["RAV4", "Land Cruiser", "Highlander"],
                "BMW": ["X5", "X6", "X7"],
                "Audi": ["Q5", "Q7", "Q8"]
            },
            "Pickups": {
                "Ford": ["F-150", "Ranger", "Raptor"],
                "Chevrolet": ["Silverado", "Colorado", "S10"],
                "Toyota": ["Hilux", "Tacoma", "Tundra"]
            },
            "Sedanes": {
                "Honda": ["Civic", "Accord", "City"],
                "Nissan": ["Sentra", "Altima", "Versa"],
                "Hyundai": ["Elantra", "Sonata", "Accent"]
            },
            "Eléctricos": {
                "Tesla": ["Model S", "Model 3", "Model X"],
                "BYD": ["Han", "Tang", "Dolphin"],
                "Nissan": ["Leaf", "Ariya"]
            }
        }

        detalles = {
            "488": {"año": 2021, "potencia": "670 HP", "precio": "330.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "V8 3.9L Twin-Turbo", "imagen": "ferrari_488.jpg"},
            "Roma": {"año": 2022, "potencia": "620 HP", "precio": "210.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "V8 3.9L Twin-Turbo", "imagen": "ferrari_roma.jpg"},
            "SF90": {"año": 2023, "potencia": "1000 HP", "precio": "500.000 USD", "combustible": "Híbrido", "transmision": "Automática", "motor": "V8 4.0L + 3 Eléctricos", "imagen": "ferrari_sf90.jpg"},
            "Huracán": {"año": 2022, "potencia": "640 HP", "precio": "260.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "V10 5.2L", "imagen": "huracan.jpg"},
            "Aventador": {"año": 2022, "potencia": "700 HP", "precio": "400.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "V12 6.5L", "imagen": "aventador.jpg"},
            "Urus": {"año": 2023, "potencia": "650 HP", "precio": "220.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "V8 4.0L Twin-Turbo", "imagen": "urus.jpg"},
            "911": {"año": 2021, "potencia": "450 HP", "precio": "120.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "6 Cilindros 3.0L Turbo", "imagen": "911.jpg"},
            "Cayman": {"año": 2022, "potencia": "320 HP", "precio": "70.000 USD", "combustible": "Gasolina", "transmision": "Manual", "motor": "6 Cilindros 2.0L Turbo", "imagen": "cayman.jpg"},
            "Taycan": {"año": 2023, "potencia": "402 HP", "precio": "80.000 USD", "combustible": "Eléctrico", "transmision": "Automática", "motor": "Eléctrico Dual", "imagen": "taycan.jpg"},
            "RAV4": {"año": 2022, "potencia": "203 HP", "precio": "28.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "4 Cilindros 2.5L", "imagen": "RAV4.webp"},
            "Land Cruiser": {"año": 2021, "potencia": "275 HP", "precio": "85.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "V6 3.5L Twin-Turbo", "imagen": "Land Cruiser.webp"},
            "Highlander": {"año": 2023, "potencia": "245 HP", "precio": "37.000 USD", "combustible": "Híbrido", "transmision": "Automática", "motor": "4 Cilindros 2.5L + Eléctrico", "imagen": "highlander.jpg"},
            "X5": {"año": 2022, "potencia": "375 HP", "precio": "55.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "6 Cilindros 3.0L Turbo", "imagen": "X5.webp"},
            "X6": {"año": 2023, "potencia": "375 HP", "precio": "65.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "6 Cilindros 3.0L Turbo", "imagen": "x6.jpg"},
            "X7": {"año": 2021, "potencia": "375 HP", "precio": "75.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "6 Cilindros 3.0L Turbo", "imagen": "x7.jpg"},
            "Q5": {"año": 2022, "potencia": "201 HP", "precio": "45.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "4 Cilindros 2.0L Turbo", "imagen": "q5.jpg"},
            "Q7": {"año": 2023, "potencia": "335 HP", "precio": "60.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "V6 3.0L Turbo", "imagen": "Q7.avif"},
            "Q8": {"año": 2021, "potencia": "335 HP", "precio": "70.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "V6 3.0L Turbo", "imagen": "q8.jpg"},
            "F-150": {"año": 2022, "potencia": "325 HP", "precio": "35.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "V6 3.3L", "imagen": "F-150.png"},
            "Ranger": {"año": 2023, "potencia": "270 HP", "precio": "25.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "4 Cilindros 2.3L Turbo", "imagen": "ranger.jpg"},
            "Raptor": {"año": 2021, "potencia": "450 HP", "precio": "55.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "V6 3.5L EcoBoost", "imagen": "Raptor.webp"},
            "Silverado": {"año": 2022, "potencia": "355 HP", "precio": "40.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "V8 5.3L", "imagen": "silverado.jpg"},
            "Colorado": {"año": 2023, "potencia": "200 HP", "precio": "25.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "4 Cilindros 2.5L", "imagen": "Colorado.webp"},
            "S10": {"año": 2021, "potencia": "200 HP", "precio": "20.000 USD", "combustible": "Gasolina", "transmision": "Manual", "motor": "4 Cilindros 2.5L", "imagen": "S10.webp"},
            "Hilux": {"año": 2022, "potencia": "150 HP", "precio": "30.000 USD", "combustible": "Diésel", "transmision": "Manual", "motor": "4 Cilindros 2.4L Turbo Diésel", "imagen": "Hilux.avif"},
            "Tacoma": {"año": 2023, "potencia": "278 HP", "precio": "28.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "4 Cilindros 2.4L Turbo", "imagen": "tacoma.jpg"},
            "Tundra": {"año": 2021, "potencia": "310 HP", "precio": "35.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "V6 3.5L Twin-Turbo", "imagen": "tundra.jpg"},
            "Civic": {"año": 2022, "potencia": "158 HP", "precio": "22.000 USD", "combustible": "Gasolina", "transmision": "Manual", "motor": "4 Cilindros 2.0L", "imagen": "Civic.avif"},
            "Accord": {"año": 2023, "potencia": "192 HP", "precio": "28.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "4 Cilindros 1.5L Turbo", "imagen": "accord.jpg"},
            "City": {"año": 2021, "potencia": "130 HP", "precio": "18.000 USD", "combustible": "Gasolina", "transmision": "Manual", "motor": "4 Cilindros 1.5L", "imagen": "City.avif"},
            "Sentra": {"año": 2022, "potencia": "149 HP", "precio": "20.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "4 Cilindros 2.0L", "imagen": "Sentra.webp"},
            "Altima": {"año": 2023, "potencia": "188 HP", "precio": "25.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "4 Cilindros 2.5L", "imagen": "Altima.webp"},
            "Versa": {"año": 2021, "potencia": "122 HP", "precio": "16.000 USD", "combustible": "Gasolina", "transmision": "Manual", "motor": "4 Cilindros 1.6L", "imagen": "versa.jpg"},
            "Elantra": {"año": 2022, "potencia": "147 HP", "precio": "19.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "4 Cilindros 2.0L", "imagen": "elantra.jpg"},
            "Sonata": {"año": 2023, "potencia": "191 HP", "precio": "24.000 USD", "combustible": "Gasolina", "transmision": "Automática", "motor": "4 Cilindros 2.5L", "imagen": "sonata.jpg"},
            "Accent": {"año": 2021, "potencia": "120 HP", "precio": "15.000 USD", "combustible": "Gasolina", "transmision": "Manual", "motor": "4 Cilindros 1.6L", "imagen": "default.jpg"},
            "Model S": {"año": 2022, "potencia": "670 HP", "precio": "80.000 USD", "combustible": "Eléctrico", "transmision": "Automática", "motor": "Eléctrico Dual", "imagen": "default.jpg"},
            "Model 3": {"año": 2023, "potencia": "283 HP", "precio": "40.000 USD", "combustible": "Eléctrico", "transmision": "Automática", "motor": "Eléctrico", "imagen": "default.jpg"},
            "Model X": {"año": 2021, "potencia": "670 HP", "precio": "90.000 USD", "combustible": "Eléctrico", "transmision": "Automática", "motor": "Eléctrico Dual", "imagen": "default.jpg"},
            "Han": {"año": 2022, "potencia": "204 HP", "precio": "35.000 USD", "combustible": "Eléctrico", "transmision": "Automática", "motor": "Eléctrico", "imagen": "default.jpg"},
            "Tang": {"año": 2023, "potencia": "245 HP", "precio": "40.000 USD", "combustible": "Eléctrico", "transmision": "Automática", "motor": "Eléctrico", "imagen": "default.jpg"},
            "Dolphin": {"año": 2021, "potencia": "95 HP", "precio": "25.000 USD", "combustible": "Eléctrico", "transmision": "Automática", "motor": "Eléctrico", "imagen": "default.jpg"},
            "Leaf": {"año": 2022, "potencia": "150 HP", "precio": "30.000 USD", "combustible": "Eléctrico", "transmision": "Automática", "motor": "Eléctrico", "imagen": "default.jpg"},
            "Ariya": {"año": 2023, "potencia": "214 HP", "precio": "45.000 USD", "combustible": "Eléctrico", "transmision": "Automática", "motor": "Eléctrico Dual", "imagen": "default.jpg"},
        }

        for cat_name, brands in catalogo.items():
            category, created = Category.objects.get_or_create(name=cat_name)
            for brand_name, models in brands.items():
                brand, created = Brand.objects.get_or_create(name=brand_name)
                for model_name in models:
                    detail = detalles.get(model_name, {})
                    price_str = detail.get('precio', '0 USD')
                    price_clean = price_str.split()[0].replace('.', '').replace(',', '')
                    try:
                        price = float(price_clean)
                    except ValueError:
                        price = 0.0
                    CarModel.objects.get_or_create(
                        category=category,
                        brand=brand,
                        name=model_name,
                        defaults={
                            'year': detail.get('año', 2021),
                            'price': price,
                            'potencia': detail.get('potencia', 'N/D'),
                            'combustible': detail.get('combustible', 'N/D'),
                            'transmision': detail.get('transmision', 'N/D'),
                            'motor': detail.get('motor', 'N/D'),
                            'imagen': detail.get('imagen', 'default.jpg'),
                        }
                    )
        self.stdout.write(self.style.SUCCESS('Successfully populated the database'))
