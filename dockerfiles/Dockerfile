FROM django
MAINTAINER ville.rantamaula@gmail.com
RUN pip install djangorestframework
RUN cd; django-admin.py startproject greedisgood; cd greedisgood; django-admin.py startapp gekko;
COPY pymod /root/greedisgood/
RUN cd; cd greedisgood; python manage.py makemigrations gekko; python manage.py migrate
EXPOSE 8000
CMD cd; cd greedisgood; python manage.py runserver 0.0.0.0:8000
