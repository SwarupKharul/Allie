# Generated by Django 4.0.4 on 2022-04-16 09:12

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('details', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='summary',
            name='file',
        ),
    ]
