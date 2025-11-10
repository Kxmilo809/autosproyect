from django.test import TestCase
from .models import Brand, CarModel

class VehiclesModelTests(TestCase):
    def setUp(self):
        self.brand = Brand.objects.create(name="TestBrand")
        self.car_model = CarModel.objects.create(brand=self.brand, name="TestModel", year=2023, price=50000)

    def test_brand_str(self):
        self.assertEqual(str(self.brand), "TestBrand")

    def test_car_model_str(self):
        self.assertEqual(str(self.car_model), "TestBrand TestModel")

    def test_car_model_fields(self):
        self.assertEqual(self.car_model.year, 2023)
        self.assertEqual(self.car_model.price, 50000)
