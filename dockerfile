FROM python:3.10-alpine

WORKDIR /app

RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev \
    jpeg-dev zlib-dev

COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000
CMD ["python","manage.py","migrate"]
CMD ["python","manage.py","runserver","0.0.0.0:8000"]
