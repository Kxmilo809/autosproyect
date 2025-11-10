from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator, MinLengthValidator, RegexValidator

class Category(models.Model):
    name = models.CharField(
        max_length=100,
        verbose_name="Nombre",
        validators=[MinLengthValidator(2)],
        unique=True
    )

    class Meta:
        verbose_name = "Categoría"
        verbose_name_plural = "Categorías"
        db_table = "categorias"

    def __str__(self):
        return self.name

class Brand(models.Model):
    name = models.CharField(
        max_length=100,
        verbose_name="Nombre",
        validators=[MinLengthValidator(2)],
        unique=True
    )

    class Meta:
        verbose_name = "Marca"
        verbose_name_plural = "Marcas"
        db_table = "marcas"

    def __str__(self):
        return self.name

class CarModel(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, null=True, blank=True, verbose_name="Categoría")
    brand = models.ForeignKey(Brand, on_delete=models.CASCADE, verbose_name="Marca")
    name = models.CharField(
        max_length=100,
        verbose_name="Nombre",
        validators=[MinLengthValidator(2)]
    )
    year = models.IntegerField(
        verbose_name="Año",
        validators=[MinValueValidator(1900), MaxValueValidator(2030)]
    )
    price = models.DecimalField(
        max_digits=10,
        decimal_places=2,
        verbose_name="Precio",
        validators=[MinValueValidator(0.01)]
    )
    potencia = models.CharField(
        max_length=100,
        null=True,
        blank=True,
        verbose_name="Potencia",
        validators=[RegexValidator(r'^[a-zA-Z0-9\s\-\.]+$', 'La potencia solo puede contener letras, números, espacios, guiones y puntos.')]
    )
    combustible = models.CharField(
        max_length=100,
        null=True,
        blank=True,
        verbose_name="Combustible",
        choices=[
            ('Diésel', 'Diésel'),
            ('Gasolina 93', 'Gasolina 93'),
            ('Gasolina 95', 'Gasolina 95'),
            ('Gasolina 97', 'Gasolina 97'),
        ]
    )
    transmision = models.CharField(
        max_length=100,
        null=True,
        blank=True,
        verbose_name="Transmisión",
        choices=[
            ('Mecánica', 'Mecánica'),
            ('Automática', 'Automática'),
        ]
    )
    motor = models.CharField(
        max_length=200,
        null=True,
        blank=True,
        verbose_name="Motor",
        validators=[RegexValidator(r'^[a-zA-Z0-9\s\-\.\,]+$', 'El motor solo puede contener letras, números, espacios, guiones, puntos y comas.')]
    )
    imagen = models.ImageField(
        upload_to='autos_app/',
        null=True,
        blank=True,
        verbose_name="Imagen"
    )

    class Meta:
        verbose_name = "Modelo de Auto"
        verbose_name_plural = "Modelos de Autos"
        db_table = "modelos_autos"
        unique_together = ['brand', 'name', 'year']

    def __str__(self):
        return f"{self.brand.name} {self.name} ({self.year})"
