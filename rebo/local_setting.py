import os
import ssl
DEBUG = False
ALLOWED_HOSTS = ['*']
SECRET_KEY = os.environ.get("SECRET_KEY")
DB_NAME = os.environ.get("DB_NAME")
DB_USER = os.environ.get("DB_USER")
DB_PASS = os.environ.get("DB_PASS")
DB_HOST = os.environ.get("DB_HOST")
DB_PORT = os.environ.get("DB_PORT")

API_MAX_SMS = os.environ.get("API_MAX_SMS")
ZARRINPAL_MERCHANT_ID = os.environ.get("ZARRINPAL_MERCHANT_ID")
REDIS_PASSWORD = os.environ.get("REDIS_PASS")
REDIS_NAME = os.environ.get("REDIS_NAME")

ssl_context = ssl.SSLContext()
ssl_context.check_hostname = False

heroku_redis_ssl_host = {
    'adress': "rediss://:REDIS_PASSWORD@REDIS_NAME",
    'ssl': ssl_context
}

CHANNEL_LAYERS = {
    "default": {
        "BACKEND": "channels_redis.core.RedisChannelLayer",
        "CONFIG": {
            "hosts": [(heroku_redis_ssl_host)],
        },
    },
}

API_NESHAN = 'service.ad5200afd6b144a3a99f364d1f407016'

