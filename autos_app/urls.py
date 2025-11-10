from django.urls import path
from django.contrib.auth import views as auth_views
from . import views
urlpatterns = [
    path('', views.index, name='index'),
    path('mantenciones/', views.mantenciones, name='mantenciones'),
    path('quienes_somos/', views.quienes_somos, name='quienes_somos'),
    path('venta/', views.venta, name='venta'),
    path('marcas/<str:tipo>/', views.marcas, name='marcas'),
    path('modelos/<str:tipo>/<str:marca>/', views.modelos, name='modelos'),
    path('detalle/<str:tipo>/<str:marca>/<str:modelo>/', views.detalle, name='detalle'),
    path('login/', auth_views.LoginView.as_view(template_name='autos_app/login.html', next_page='admin_home'), name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('admin-home/', views.admin_home, name='admin_home'),
]
