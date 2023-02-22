FROM python:3.8
LABEL MAINTAINER = "fadaoddini fadaoddini@gmail.com"
ENV PYTHONUNBUFFERERD 1
RUN mkdir /rebo
WORKDIR /rebo
COPY . /rebo
ADD requirements.txt /rebo
RUN pip insatall --upgrade pip
RUN pip install -r requirements.txt


RUN python manage.py collectstatic --no-input
CMD ["gunicorn","--chdir","rebo","--bind",":8000","rebo.wsgi:application"]










