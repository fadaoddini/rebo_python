from django.urls import path, re_path

from blog.views import blog_list, category_blog_list, detail_blog



urlpatterns = [
    path('list/', blog_list),
    path('detail/<str:title>', detail_blog),
    path('categories/list/', category_blog_list),
    path('archive/<int:year>/', blog_list),
    re_path(r'archive/?P<year>[0-9]{4}/', blog_list),
    path('archive/<int:year>/<int:month>/', blog_list)
]
