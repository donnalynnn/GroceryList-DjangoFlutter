from django.urls import path
from . import views

urlpatterns = [
    path('',views.getRoutes),
    path('grocerylist/', views.getGroceryList),
    path('grocerylist/create/', views.createList),
    path('grocerylist/<str:pk>/update/', views.updateProduct),
    path('grocerylist/<str:pk>/delete/', views.deleteProduct),
    path('grocerylist/<str:pk>/', views.getProduct),
    
]