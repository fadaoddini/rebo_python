from django.contrib import admin
from django.contrib.admin import register

from catalogue.models import Category, Brand, Product, ProductType, ProductAttribute, ProductAttributeValue


class ProductAttributeInline(admin.TabularInline):
    model = ProductAttribute
    extra = 1


class ProductAttributeValueInline(admin.TabularInline):
    model = ProductAttributeValue
    extra = 1


@register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('title', 'product_type', 'upc', 'category_id', 'brand_id', 'is_active')
    list_filter = ('is_active',)
    list_editable = ('is_active',)
    search_fields = ('upc', 'title', 'category_id__name', 'brand_id__name')
    actions = ('active_all',)
    inlines = [ProductAttributeValueInline]

    def active_all(self, request, queryset):
        pass


@register(ProductType)
class ProductTypeAdmin(admin.ModelAdmin):
    list_display = ('title',)
    search_fields = ('title',)
    inlines = [ProductAttributeInline]


@register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'parent')
    search_fields = ('name',)


@register(Brand)
class BrandAdmin(admin.ModelAdmin):
    list_display = ('name', 'parent')
    search_fields = ('name',)



