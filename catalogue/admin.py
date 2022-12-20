from django.contrib import admin
from django.contrib.admin import register

from catalogue.models import Category, Brand, Product, ProductType, ProductAttribute, ProductAttributeValue, \
    ProductImage


class ProductAttributeInline(admin.TabularInline):
    model = ProductAttribute
    extra = 1


class ProductAttributeValueInline(admin.TabularInline):
    model = ProductAttributeValue
    extra = 1


class ProductImageInline(admin.TabularInline):
    model = ProductImage
    extra = 2


@register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('title', 'price', 'weight', 'sell_buy', 'product_type', 'user',
                    'upc', 'category_id', 'brand_id', 'is_active')
    list_filter = ('is_active', 'sell_buy')
    list_editable = ('is_active',)
    search_fields = ('upc', 'title', 'category_id__name', 'user', 'brand_id__name')
    actions = ('active_all',)
    inlines = [ProductImageInline, ProductAttributeValueInline]

    def active_all(self, request, queryset):
        pass


class ProductImageAdmin(admin.ModelAdmin):
    list_display = ('images',)


@register(ProductType)
class ProductTypeAdmin(admin.ModelAdmin):
    list_display = ('title',)
    search_fields = ('title',)
    inlines = [ProductAttributeInline]


@register(ProductAttributeValue)
class ProductAttributeValueAdmin(admin.ModelAdmin):
    list_display = ('product', 'value', 'product_attribute')


@register(ProductAttribute)
class ProductAttributeAdmin(admin.ModelAdmin):
    list_display = ('title', 'product_type', 'attribute_type')


@register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'parent')
    search_fields = ('name',)


@register(Brand)
class BrandAdmin(admin.ModelAdmin):
    list_display = ('name', 'parent')
    search_fields = ('name',)



