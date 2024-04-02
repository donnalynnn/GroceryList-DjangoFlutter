from rest_framework.serializers import ModelSerializer
from .models import GroceryList

class GroceryListSerializer(ModelSerializer):
    class Meta:
        model = GroceryList
        fields = '__all__'