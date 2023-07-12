from django.urls import path, re_path

from chat.views import Index, Room

urlpatterns = [
    path('', Index.as_view(), name='send'),
    path('<str:room_name>/', Room.as_view(), name='room')
]
