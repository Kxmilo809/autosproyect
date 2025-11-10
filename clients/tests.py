from django.test import TestCase
from .models import Client, Purchase

class ClientsModelTests(TestCase):
    def setUp(self):
        self.client_obj = Client.objects.create(name="Test Client", email="test@example.com", phone="123456789")
        self.purchase = Purchase.objects.create(client=self.client_obj, total=1000)

    def test_client_str(self):
        self.assertEqual(str(self.client_obj), "Test Client")

    def test_purchase_str(self):
        self.assertIn("Compra de Test Client", str(self.purchase))

    def test_purchase_total(self):
        self.assertEqual(self.purchase.total, 1000)
