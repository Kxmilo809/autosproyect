from django.db import models
from django.core.validators import MinValueValidator, MinLengthValidator

class Maintenance(models.Model):
    vehicle = models.ForeignKey('vehicles.CarModel', on_delete=models.CASCADE, verbose_name="Vehículo")
    date = models.DateField(
        verbose_name="Fecha"
    )
    description = models.TextField(
        verbose_name="Descripción",
        validators=[MinLengthValidator(10)]
    )
    cost = models.DecimalField(
        max_digits=10,
        decimal_places=2,
        verbose_name="Costo",
        validators=[MinValueValidator(0.01)]
    )

    class Meta:
        verbose_name = "Mantenimiento"
        verbose_name_plural = "Mantenimientos"
        db_table = "mantenimientos"
        ordering = ['-date']

    def __str__(self):
        return f"Mantenimiento de {self.vehicle} el {self.date}"
