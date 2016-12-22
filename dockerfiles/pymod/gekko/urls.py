from django.conf.urls import url
from gekko import views

urlpatterns = [
    url(r'^v1/users/$', views.UserList.as_view()),
    url(r'^v1/users/(?P<pk>[0-9]+)/$', views.UserDetail.as_view()),
    url(r'^v1/games/$', views.GameList.as_view()),
    url(r'^v1/games/(?P<pk>[0-9]+)/$', views.GameDetail.as_view()),

]
