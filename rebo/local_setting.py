# SECURITY WARNING: keep the secret key used in production secret!
import os
# cccccccccccccccccccccccccccccccc
# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False
ALLOWED_HOSTS = ['*']
SECRET_KEY = os.environ.get("SECRET_KEY")
ZARRINPAL_MERCHANT_ID = os.environ.get("ZARRINPAL_MERCHANT_ID")
DB_NAME = os.environ.get("DB_NAME")
DB_USER = os.environ.get("DB_USER")
DB_PASS = os.environ.get("DB_PASS")
DB_HOST = os.environ.get("DB_HOST")
DB_PORT = os.environ.get("DB_PORT")
API_MAX_SMS = os.environ.get("API_MAX_SMS")