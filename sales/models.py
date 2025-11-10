from django.db import models
from django.core.validators import MinValueValidator

class Sale(models.Model):
    date = models.DateTimeField(auto_now_add=True, verbose_name="Fecha")
    total = models.DecimalField(
        max_digits=10,
        decimal_places=2,
        verbose_name="Total",
        validators=[MinValueValidator(0.01)]
    )

    class Meta:
        verbose_name = "Venta"
        verbose_name_plural = "Ventas"
        db_table = "ventas"
        ordering = ['-date']

    def __str__(self):
        return f"Venta el {self.date}"

class SaleItem(models.Model):
    sale = models.ForeignKey(Sale, on_delete=models.CASCADE, verbose_name="Venta")
    car_model = models.ForeignKey('vehicles.CarModel', on_delete=models.CASCADE, verbose_name="Modelo de Auto")
    quantity = models.IntegerField(
        verbose_name="Cantidad",
        validators=[MinValueValidator(1)]
    )
    price = models.DecimalField(
        max_digits=10,
        decimal_places=2,
        verbose_name="Precio",
        validators=[MinValueValidator(0.01)]
    )

    class Meta:
        verbose_name = "Item de Venta"
        verbose_name_plural = "Items de Venta"
        db_table = "items_venta"
        unique_together = ['sale', 'car_model']

    def __str__(self):
        return f"{self.quantity} x {self.car_model.name}"
