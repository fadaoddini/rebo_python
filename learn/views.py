from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.utils.decorators import method_decorator
from django.views import View
from rest_framework.generics import get_object_or_404
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from learn import forms
from learn.forms import LearnForm, SectionForm, LessonForm
from learn.models import Learn, Section, Category
from learn.serializers import LearnDetailSerializer, LearnAllSerializer, SectionByLearnIdSerializer, \
    LessonBySectionIdSerializer, CategorySerializer


class LearningById(APIView):
    #permission_classes = (IsAuthenticated,)
    def get(self, request, pk, *args, **kwargs):
        learn = get_object_or_404(Learn, **{'pk': pk})
        serializer = LearnDetailSerializer(learn)
        return Response(serializer.data, content_type='application/json; charset=UTF-8')


class LearningByCat(APIView):
    # permission_classes = (IsAuthenticated,)
    def get(self, request, pk, *args, **kwargs):
        #pk --> id category
        category = Category.objects.filter(pk=pk).first()
        learns = category.learns
        serializer = LearnDetailSerializer(learns, many=True)
        return Response(serializer.data, content_type='application/json; charset=UTF-8')


class Learning(APIView):
    #permission_classes = (IsAuthenticated,)
    def get(self, request, *args, **kwargs):
        learns = Learn.objects.all()
        serializer = LearnAllSerializer(learns, many=True)
        return Response(serializer.data, content_type='application/json; charset=UTF-8')

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
        return Response(serializer.data, content_type='application/json; charset=UTF-8')


class LearningSection(APIView):
    def get(self, request, pk, *args, **kwargs):
        section = get_object_or_404(Section, **{'pk': pk})
        lessons = section.lessons.all()
        serializer = LessonBySectionIdSerializer(lessons, many=True)
        return Response(serializer.data, content_type='application/json; charset=UTF-8')


class Categoryl(APIView):
    def get(self, request, *args, **kwargs):
        category = Category.objects.all()
        serializer = CategorySerializer(category, many=True)
        return Response(serializer.data, content_type='application/json; charset=UTF-8')


class AllLearn(View):
    template_name = 'learn/learn.html'

    def get(self, request, *args, **kwargs):
        learns = Learn.objects.all()
        return render(request, template_name=self.template_name, context={'learns': learns},
                      content_type=None, status=None, using=None)


class AddLearn(View):
    template_name_learn = 'learn/learn.html'
    template_name = 'learn/addlearn.html'

    def get(self, request, *args, **kwargs):
        context = dict()
        form_learn = LearnForm()
        context['form_learn'] = form_learn
        return render(request, template_name=self.template_name, context=context,
                      content_type=None, status=None, using=None)

    def post(self, request, *args, **kwargs):
        learns = Learn.objects.all()
        form = forms.LearnForm(request.POST, request.FILES)
        if form.is_valid():
            learning = form.save(commit=False)
            learning.user = request.user
            learning.save()
            messages.info(request, "آموزش با موفقیت ثبت شد")
        else:
            messages.error(request, "با خطا روبرو شد!")

        return render(request, template_name=self.template_name_learn, context={'learns': learns},
                      content_type=None, status=None, using=None)


class AddSection(View):
    template_name_section = 'learn/learn.html'
    template_name = 'learn/addsection.html'

    def get(self, request, *args, **kwargs):
        context = dict()
        form_section = SectionForm()
        context['form_section'] = form_section
        return render(request, template_name=self.template_name, context=context,
                      content_type=None, status=None, using=None)

    def post(self, request, *args, **kwargs):
        learns = Learn.objects.all()
        form = forms.SectionForm(request.POST)
        if form.is_valid():
            section = form.save(commit=False)
            section.user = request.user
            section.save()
            messages.info(request, "بخش آموزشی با موفقیت ثبت شد")
        else:
            messages.error(request, "با خطا روبرو شد!")

        return render(request, template_name=self.template_name_learn, context={'learns': learns},
                      content_type=None, status=None, using=None)


class AddLesson(View):
    template_name_lesson = 'learn/learn.html'
    template_name = 'learn/addlesson.html'

    def get(self, request, *args, **kwargs):
        context = dict()
        form_lesson = LessonForm()
        context['form_lesson'] = form_lesson
        return render(request, template_name=self.template_name, context=context,
                        content_type=None, status=None, using=None)

    def post(self, request, *args, **kwargs):
        learns = Learn.objects.all()
        form = forms.LessonForm(request.POST, request.FILES)
        if form.is_valid():
            lesson = form.save(commit=False)
            lesson.user = request.user
            lesson.save()
            messages.info(request, "درس با موفقیت ثبت شد")
        else:
            messages.error(request, "با خطا روبرو شد!")

        return render(request, template_name=self.template_name_lesson, context={'learns': learns},
                        content_type=None, status=None, using=None)

