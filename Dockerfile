FROM ubuntu

MAINTAINER fadaoddini <fadaoddini@gmail.com>

RUN mkdir /rebo

WORKDIR /rebo

RUN apt update

RUN apt install python3-pip

ADD requirements.txt /rebo

RUN pip3 install -r requirements.txt

ADD . /rebo






