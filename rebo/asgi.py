import os

from django.core.asgi import get_asgi_application


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'rebo.settings')
django_asgi_app = get_asgi_application()


application = django_asgi_app

