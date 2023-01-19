from django.urls import path, re_path

from learn.views import Learning, LearningById, SectionLearn, LearningSection

urlpatterns = [
    path('', Learning.as_view(), name='learn'),
    path('<int:pk>/', LearningById.as_view(), name='learn'),
    path('section/<int:pk>/', SectionLearn.as_view(), name='section'),
    path('lesson/<int:pk>/', LearningSection.as_view(), name='lesson'),
]
