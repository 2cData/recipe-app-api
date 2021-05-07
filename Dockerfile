FROM python:3.7-alpine
MAINTAINER 2C Data

# this is recommented for Docker so output just prints right away
ENV PYTHONUNBUFFERED 1

# take the requirements.txt file from the local directory and copy it to the docker image.
# then pip in all the requirements
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# create a folder for python source code
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# create a user that runs applications only and switch to that user
# otherwise, the application will run as root
RUN adduser -D user
USER user
