FROM python:3.9-slim-buster
WORKDIR /app
COPY . /app
RUN pip install tweepy
RUN apt-get update && apt-get -y install gnupg
RUN apt-get update && apt-get -y install cron
COPY crontab /etc/cron.d/twitter-cron
RUN chmod 0644 /etc/cron.d/twitter-cron
RUN touch /var/log/cron.log
CMD cron && tail -f /var/log/cron.log
RUN echo 'deb http://security.debian.org/debian-security stretch/updates main' >> /etc/apt/sources.list.d/stretch.list
RUN echo 'deb http://deb.debian.org/debian stretch main' >> /etc/apt/sources.list.d/stretch.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B48AD6246925553
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7638D0442B90D010
RUN apt-get update
