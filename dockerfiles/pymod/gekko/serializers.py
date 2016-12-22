from rest_framework import serializers
from gekko.models import User, Game

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'name', 'score')

class GameSerializer(serializers.ModelSerializer):
    class Meta:
        model = Game
        fields = ('id', 'winner', 'loser', 'score')
