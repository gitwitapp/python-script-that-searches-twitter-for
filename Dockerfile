FROM python:3.9-slim-buster
WORKDIR /app
COPY . /app
RUN pip install tweepy
RUN apt-get update && apt-get -y install cron
COPY crontab /etc/cron.d/twitter-cron
RUN chmod 0644 /etc/cron.d/twitter-cron
RUN touch /var/log/cron.log
CMD cron && tail -f /var/log/cron.log
