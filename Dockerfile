FROM python:3.9.0

WORKDIR /home/

RUN echo "dwdwdwd"

RUN git clone https://github.com/sthax17/kay1.git

WORKDIR /home/kay1/

RUN echo "SECRET_KEY=django-insecure-" > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient


EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=kay1.settings.deploy && python manage.py migrate --settings=kay1.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=kay1.settings.deploy kay1.wsgi --bind 0.0.0.0:8000"]