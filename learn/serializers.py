from rest_framework import serializers

from learn.models import Learn, Section


class LearnAllSerializer(serializers.ModelSerializer):
    class Meta:
        model = Learn
        fields = ('id', 'title', 'image', 'type', 'is_active', 'is_free', 'auther', 'price')

    def create(self, validated_data):
        key = validated_data.pop('key')
        instance = super().create(validated_data)
        return instance


class LearnDetailSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()

    class Meta:
        model = Learn
        fields = ('id', 'title', 'image', 'type', 'is_active', 'is_free', 'auther', 'price', 'user')

    def get_user(self, obj):
        name2 = obj.user.info.name + " " + obj.user.info.family
        return name2


class SectionByLearnId(serializers.ModelSerializer):
    learn = serializers.SerializerMethodField()

    class Meta:
        model = Section
        fields = ('title', 'learn', 'is_active', 'is_free')

    def get_learn(self, obj):
        new_learn = obj.learn.title
        return new_learn