FROM python:3.7.3-stretch

WORKDIR /app

# Copy all files in the current directory to /app in the container
COPY . /app/

RUN pip install --no-cache-dir --upgrade pip===23.2.1 && \
    pip install --no-cache-dir -r requirements.txt

EXPOSE 80

CMD [ "python", "app.py" ]