from django import forms
from .models import CarModel

class CarModelForm(forms.ModelForm):
    class Meta:
        model = CarModel
        fields = ['category', 'brand', 'name', 'year', 'price', 'potencia', 'combustible', 'transmision', 'motor', 'imagen']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
            'year': forms.NumberInput(attrs={'class': 'form-control'}),
            'price': forms.NumberInput(attrs={'class': 'form-control'}),
            'potencia': forms.TextInput(attrs={'class': 'form-control'}),
            'combustible': forms.Select(attrs={'class': 'form-control'}),
            'transmision': forms.Select(attrs={'class': 'form-control'}),
            'motor': forms.TextInput(attrs={'class': 'form-control'}),
            'imagen': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }

    def clean_year(self):
        year = self.cleaned_data.get('year')
        if year < 1900 or year > 2025:
            raise forms.ValidationError('El año debe estar entre 1900 y 2025.')
        return year

    def clean_price(self):
        price = self.cleaned_data.get('price')
        if price <= 0:
            raise forms.ValidationError('El precio debe ser mayor a 0.')
        return price
