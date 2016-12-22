from django.db import models


class User(models.Model):
    name = models.CharField(max_length=50, blank=False, default='')
    score = models.IntegerField(default='100')

    class Meta:
        ordering = ('name',)

class Game(models.Model):
    winner = models.ForeignKey('User', related_name="winner+")
    loser = models.ForeignKey('User', related_name="loser+")
    score = models.IntegerField(default=0)

    def save(self, *args, **kwargs):
        if not self.pk:  # object is being created, thus no primary key field yet
            if self.loser.score > 0:
                self.score = max(self.winner.score, self.loser.score)
                self.score /= 10
                if self.score < 1:
                    self.score = 1
                if self.winner.score > self.loser.score:
                    self.score /= (self.winner.score / self.loser.score)
                    if (self.score < 1):
                        self.score = 1
            else:
                self.score = 1
            self.winner.score += self.score
            self.loser.score -= self.score
            self.winner.save()
            self.loser.save()
        super(Game, self).save(*args, **kwargs)

