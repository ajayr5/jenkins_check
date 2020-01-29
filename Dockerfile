FROM python:3.6-stretch
COPY . /tmp/app
RUN pip install --upgrade pip
RUN cd /tmp/app
RUN pip install -r requirements.txt
