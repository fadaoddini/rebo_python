from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.utils.decorators import method_decorator
from django.views import View


# Create your views here.
class Index(View):
    @method_decorator(login_required)
    def get(self, request):
        context = dict()

        return render(request, 'chat/receive.html', context=context)


class Room(View):
    @method_decorator(login_required)
    def get(self, request, room_name):
        context = dict()

        context['room_name'] = room_name
        return render(request, 'chat/room.html', context=context)

