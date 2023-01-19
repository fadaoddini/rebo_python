from rest_framework import serializers

from learn.models import Learn, Section, Lesson


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


class SectionByLearnIdSerializer(serializers.ModelSerializer):
    learn = serializers.CharField(source='learn.title')
    # learn = LearnDetailSerializer()

    class Meta:
        model = Section
        fields = ('title', 'learn', 'is_active', 'is_free')


class LessonBySectionIdSerializer(serializers.ModelSerializer):
    section = SectionByLearnIdSerializer()

    class Meta:
        model = Lesson
        fields = ('section', 'title', 'image', 'video', 'description', 'is_active', 'is_free')
