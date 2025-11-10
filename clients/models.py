from django.db import models
from django.core.validators import RegexValidator, MinLengthValidator, MinValueValidator

class Client(models.Model):
    name = models.CharField(
        max_length=100,
        verbose_name="Nombre",
        validators=[MinLengthValidator(2)]
    )
    email = models.EmailField(
        verbose_name="Correo Electrónico",
        unique=True
    )
    phone = models.CharField(
        max_length=20,
        verbose_name="Teléfono",
        validators=[RegexValidator(r'^\+?[\d\s\-\(\)]+$', 'Formato de teléfono inválido. Solo números, espacios, guiones, paréntesis y el símbolo +.')]
    )

    class Meta:
        verbose_name = "Cliente"
        verbose_name_plural = "Clientes"
        db_table = "clientes"

    def __str__(self):
        return self.name

class Purchase(models.Model):
    client = models.ForeignKey(Client, on_delete=models.CASCADE, verbose_name="Cliente")
    date = models.DateTimeField(auto_now_add=True, verbose_name="Fecha")
    total = models.DecimalField(
        max_digits=10,
        decimal_places=2,
        verbose_name="Total",
        validators=[MinValueValidator(0.01)]
    )

    class Meta:
        verbose_name = "Compra"
        verbose_name_plural = "Compras"
        db_table = "compras"

    def __str__(self):
        return f"Compra de {self.client.name} el {self.date}"
