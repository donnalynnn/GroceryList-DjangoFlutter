# Generated by Django 5.0.3 on 2024-03-13 02:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='grocerylist',
            name='isBought',
            field=models.BooleanField(default=False),
        ),
    ]
