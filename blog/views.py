from django.http import HttpResponse


def blog_list(request, year=None, month=None):
    if month is not None:
        return HttpResponse(f"blog list {year} - {month}")
    if year is not None:
        return HttpResponse(f"blog list {year}")

    return HttpResponse(f"blog list")


def category_blog_list(request):
    return HttpResponse("category_blog_list")


def detail_blog(request, title):
    return HttpResponse(f"detail_blog {title}")
