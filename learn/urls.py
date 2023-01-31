from django.urls import path, re_path

from learn.views import Learning, LearningById, SectionLearn, LearningSection, Categoryl, LearningByCat, AllLearn, \
    AddLearn, AddSection, AddLesson

urlpatterns = [
    path('cat/', Categoryl.as_view(), name='cat-learn'),
    path('', Learning.as_view(), name='learn'),
    path('<int:pk>/', LearningById.as_view(), name='learn-by-id'),
    path('learn/<int:pk>/', LearningByCat.as_view(), name='learn-by-cat'),
    path('section/<int:pk>/', SectionLearn.as_view(), name='section'),
    path('lesson/<int:pk>/', LearningSection.as_view(), name='lesson'),
    path('all/', AllLearn.as_view(), name='learn-web'),
    path('add/', AddLearn.as_view(), name='add-learn-web'),
    path('section/', AddSection.as_view(), name='add-section-web'),
    path('lesson/', AddLesson.as_view(), name='add-lesson-web'),
]
