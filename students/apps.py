#from django.apps import AppConfig


#class StudentsConfig(AppConfig):
 #   name = 'students'
# students/apps.py

from django.apps import AppConfig

class StudentsConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'students'
