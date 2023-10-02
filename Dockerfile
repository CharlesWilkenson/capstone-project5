FROM python:3.9

WORKDIR /app

COPY app.py requirements.txt /app/

RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

EXPOSE 80

CMD ["python", "app.py"]