FROM python:3.9.0

WORKDIR /home/

RUN echo 'awdfsfeehe'

RUN git clone https://github.com/yeonnex/django_pinterest.git

WORKDIR /home/django_pinterest/

RUN echo "SECRET_KEY=FSJEO8F3JKF" > .env

RUN pip install -r requirements.txt

RUN pip install mysqlclient

RUN pip install gunicorn

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=gis_2ban_1.settings.deploy && python manage.py migrate --settings=gis_2ban_1.settings.deploy && gunicorn --env  DJANGO_SETTINGS_MODULE=gis_2ban_1.settings.deploy gis_2ban_1.wsgi --bind 0.0.0.0:8000"]
