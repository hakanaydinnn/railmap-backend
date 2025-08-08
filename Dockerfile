FROM python:3.12.11
EXPOSE 80

WORKDIR /app
COPY . .

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

CMD ["gunicorn","-k", "uvicorn.workers.UvicornWorker", "-w", "2", "-b", "0.0.0.0:80", "main:app"]