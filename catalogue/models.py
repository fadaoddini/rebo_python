from django.contrib.auth.models import User
from django.db import models


class ProductType(models.Model):
    title = models.CharField(max_length=32, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    modified_time = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'Type'
        verbose_name_plural = 'Types'

    def __str__(self):
        return self.title


class ProductAttribute(models.Model):
    INTEGER = 1
    STRING = 2
    FLOAT = 3

    ATTRIBUTE_TYPES_FIELDS = (
        (INTEGER, "Integer"),
        (STRING, "String"),
        (FLOAT, "Float"),
    )
    title = models.CharField(max_length=32)
    product_type = models.ForeignKey(ProductType, on_delete=models.CASCADE, related_name='attributes')
    attribute_type = models.PositiveSmallIntegerField(default=INTEGER, choices=ATTRIBUTE_TYPES_FIELDS)

    class Meta:
        verbose_name = 'Attribute'
        verbose_name_plural = 'Attributes'

    def __str__(self):
        return self.title


class Category(models.Model):
    name = models.CharField(max_length=32)
    parent = models.ForeignKey('self', on_delete=models.CASCADE, related_name='children', null=True, blank=True)

    class Meta:
        verbose_name = 'Category'
        verbose_name_plural = "Categories"

    def __str__(self):
        return self.name


class Brand(models.Model):
    name = models.CharField(max_length=32)
    parent = models.ForeignKey('self', on_delete=models.CASCADE, related_name='children', null=True, blank=True)

    class Meta:
        verbose_name = 'Brand'
        verbose_name_plural = "Brands"

    def __str__(self):
        return self.name


class Product(models.Model):
    SELL = 1
    BUY = 2

    TYPES_SELL_OR_BUY = (
        (SELL, "sell"),
        (BUY, "buy"),
    )
    user = models.ForeignKey(User, related_name='products', on_delete=models.RESTRICT)
    sell_buy = models.PositiveSmallIntegerField(default=SELL, choices=TYPES_SELL_OR_BUY)
    product_type = models.ForeignKey(ProductType, on_delete=models.PROTECT, related_name='products')
    upc = models.BigIntegerField(unique=True)
    title = models.CharField(max_length=32)
    price = models.PositiveBigIntegerField()
    weight = models.PositiveIntegerField()
    description = models.TextField(blank=True)
    category = models.ForeignKey(Category, on_delete=models.PROTECT, related_name='products')
    brand = models.ForeignKey(Brand, on_delete=models.PROTECT, related_name='products')
    is_active = models.BooleanField(default=True)
    create_time = models.DateTimeField(auto_now_add=True)
    modified_time = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'Product'
        verbose_name_plural = "Products"

    def __str__(self):
        return self.title


class ProductImage(models.Model):
    image = models.ImageField(upload_to='products/')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='images')

    def __str__(self):
        return str(self.product)


class ProductAttributeValue(models.Model):
    product_attribute = models.ForeignKey(ProductAttribute, on_delete=models.PROTECT, related_name='values')
    value = models.CharField(max_length=48)
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='attribute')
    create_time = models.DateTimeField(auto_now_add=True)
    modified_time = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.product}({self.product_attribute}):{self.value}"

