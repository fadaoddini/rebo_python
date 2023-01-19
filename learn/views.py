from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.utils.decorators import method_decorator
from django.views import View
from rest_framework.generics import get_object_or_404
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from learn.models import Learn, Section
from learn.serializers import LearnDetailSerializer, LearnAllSerializer, SectionByLearnIdSerializer, \
    LessonBySectionIdSerializer


class LearningById(APIView):
    permission_classes = (IsAuthenticated,)
    def get(self, request, pk, *args, **kwargs):
        learn = get_object_or_404(Learn, **{'pk': pk})
        serializer = LearnDetailSerializer(learn)
        return Response(serializer.data)


class Learning(APIView):
    permission_classes = (IsAuthenticated,)
    def get(self, request, *args, **kwargs):
        learns = Learn.objects.all()
        serializer = LearnAllSerializer(learns, many=True)
        return Response(serializer.data)

    def post(self, request, *args, **kwargs):
        serializer = LearnAllSerializer(data=request.data)
        if serializer.is_valid():
            instance = serializer.save()
            return Response(status=status.HTTP_201_CREATED)
        return Response(status=status.HTTP_400_BAD_REQUEST)

    def put(self, request, *args, **kwargs):
        pass

    def delete(self, request, *args, **kwargs):
        pass


class SectionLearn(APIView):
    def get(self, request, pk, *args, **kwargs):
        learn = get_object_or_404(Learn, **{'pk': pk})
        sections = learn.sections.all()
        serializer = SectionByLearnIdSerializer(sections, many=True)
        return Response(serializer.data)


class LearningSection(APIView):
    def get(self, request, pk, *args, **kwargs):
        section = get_object_or_404(Section, **{'pk': pk})
        lessons = section.lessons.all()
        serializer = LessonBySectionIdSerializer(lessons, many=True)
        return Response(serializer.data)
