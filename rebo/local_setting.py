import os


SECRET_KEY = 'django-insecure-)l7^&$3*+x=-g7b^job8*d(qz98g3b5ahv2!lk*5amuk+7bi#n'


DEBUG = True
ALLOWED_HOSTS = ['*']

ZARRINPAL_MERCHANT_ID = 'e701a7c2-73ae-11e8-b07d-005056a205be'
DB_NAME = 'newrebo'
DB_USER = 'newrebo'
DB_PASS = 'newrebo'
DB_HOST = 'localhost'
DB_PORT = 5432
API_MAX_SMS = 'oUSMoSz9YIujHc-XyaanUMimxpSq8rpbx3KHS1nMumA='

CHANNEL_LAYERS = {
    "default": {
        "BACKEND": "channels_redis.core.RedisChannelLayer",
        "CONFIG": {
            "hosts": [("127.0.0.1", 6379)],
        },
    },
}

#
# REDIS_NAME = 'USERNAME'
# REDIS_PASSWORD = 'PASSWORD'
# HOST_REDIS = f"redis://{REDIS_PASSWORD}@{REDIS_NAME}"
#
# CHANNEL_LAYERS = {
#     "default": {
#         "BACKEND": "channels_redis.core.RedisChannelLayer",
#         "CONFIG": {
#             "hosts": [(HOST_REDIS, 6379)],
#         },
#     },
# }


# import os
# import ssl
# DEBUG = False
# ALLOWED_HOSTS = ['*']
# SECRET_KEY = os.environ.get("SECRET_KEY")
# DB_NAME = os.environ.get("DB_NAME")
# DB_USER = os.environ.get("DB_USER")
# DB_PASS = os.environ.get("DB_PASS")
# DB_HOST = os.environ.get("DB_HOST")
# DB_PORT = os.environ.get("DB_PORT")
#
# API_MAX_SMS = os.environ.get("API_MAX_SMS")
# ZARRINPAL_MERCHANT_ID = os.environ.get("ZARRINPAL_MERCHANT_ID")
# REDIS_PASSWORD = os.environ.get("REDIS_PASS")
# REDIS_NAME = os.environ.get("REDIS_NAME")
#
# ssl_context = ssl.SSLContext()
# ssl_context.check_hostname = False
#
# heroku_redis_ssl_host = {
#     'adress': "rediss://:REDIS_PASSWORD@REDIS_NAME",
#     'ssl': ssl_context
# }
#
# CHANNEL_LAYERS = {
#     "default": {
#         "BACKEND": "channels_redis.core.RedisChannelLayer",
#         "CONFIG": {
#             "hosts": [(heroku_redis_ssl_host)],
#         },
#     },
# }




#
#
#
# REDIS_PASSWORD = os.environ.get("REDIS_PASSword")
# REDIS_NAME = 'rebo-redis2-kwi-service'
# HOST_REDIS = f"redis://{REDIS_PASSWORD}@{REDIS_NAME}"
# ssl_context = ssl.SSLContext()
# ssl_context.check_hostname = False
# host_redis = f"rediss://:{REDIS_PASSWORD}@{REDIS_NAME}:6379/0"
# heroku_redis_ssl_host = {
#     'adress': host_redis,
#     'ssl': ssl_context
# }
#
# CHANNEL_LAYERS = {
#     "default": {
#         "BACKEND": "channels_redis.core.RedisChannelLayer",
#         "CONFIG": {
#             "hosts": [(heroku_redis_ssl_host),]
#         },
#     },
# }