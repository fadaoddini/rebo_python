from django.urls import path
from rebo.blog.views import blog_list, category_blog_list

urlpatterns = [
    path('list/', blog_list),
    path('categories/list/', category_blog_list),
]