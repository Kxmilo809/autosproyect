from django import forms
from .models import Maintenance

class MaintenanceForm(forms.ModelForm):
    class Meta:
        model = Maintenance
        fields = ['vehicle', 'date', 'description', 'cost']
        widgets = {
            'vehicle': forms.Select(attrs={'class': 'form-control'}),
            'date': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
            'description': forms.Textarea(attrs={'class': 'form-control'}),
            'cost': forms.NumberInput(attrs={'class': 'form-control'}),
        }

    def clean_cost(self):
        cost = self.cleaned_data.get('cost')
        if cost <= 0:
            raise forms.ValidationError('El costo debe ser mayor a 0.')
        return cost
