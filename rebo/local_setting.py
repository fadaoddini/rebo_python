# import os
#
# SECRET_KEY = 'django-insecure-)l7^&$3*+x=-g7b^job8*d(qz98g3b5ahv2!lk*5amuk+7bi#n'
#
#
# DEBUG = True
# ALLOWED_HOSTS = ['*']
#
# ZARRINPAL_MERCHANT_ID = 'e701a7c2-73ae-11e8-b07d-005056a205be'
# DB_NAME = 'newrebo'
# DB_USER = 'newrebo'
# DB_PASS = 'newrebo'
# DB_HOST = 'localhost'
# DB_PORT = 5432
#
# API_MAX_SMS = 'oUSMoSz9YIujHc-XyaanUMimxpSq8rpbx3KHS1nMumA='
# CHANNEL_LAYERS = {
#     "default": {
#         "BACKEND": "channels_redis.core.RedisChannelLayer",
#         "CONFIG": {
#             "hosts": [("127.0.0.1", 6379)],
#         },
#     },
# }

import os
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
REDIS_PASSWORD = os.environ.get("REDIS_PASSWORD")
CHANNEL_LAYERS = {
    "default": {
        "BACKEND": "channels_redis.core.RedisChannelLayer",
        "CONFIG": {
            "hosts": [("redis://:."+REDIS_PASSWORD+"@rebo-ypl-service:6379/0")],
        },
    },
}

