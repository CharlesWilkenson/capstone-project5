FROM python:3.7.3-stretch

 

WORKDIR /app

 

# Copy all files in the current directory to /app in the container
COPY . .

 

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

 

EXPOSE 80

 

CMD [ "python", "app.py" ]