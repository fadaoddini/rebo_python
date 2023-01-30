from rest_framework import serializers

from catalogue.models import Product, ProductImage, ProductAttribute, ProductAttributeValue

# test send git
class ProductSellSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()
    images = serializers.SerializerMethodField()
    name_type = serializers.SerializerMethodField()
    attr_value = serializers.SerializerMethodField()

    class Meta:
        model = Product
        fields = ('id', 'upc', 'title', 'brand', 'category', 'weight', 'price', 'name_type', 'product_type',
                  'is_active', 'user', 'description', 'create_time', 'images', 'attr_value')

    def get_user(self, obj):
        name2 = obj.user.info.name + " " + obj.user.info.family
        return name2

    def get_name_type(self, obj):
        id_type = obj.product_type
        return id_type.title

    def get_images(self, obj):
        return ImageSerializer(obj.images.all(), many=True).data

    def get_attr_value(self, obj):
        result = []
        id_type = obj.product_type
        attrs = ProductAttribute.objects.filter(product_type=id_type)
        for attr in attrs:
            value = ProductAttributeValue.objects.filter(product_attribute=attr.id).first()
            # result[attr.title] = value.value
            result.append((attr.title, value.value))
        return result


class ImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductImage
        fields = ('image', )