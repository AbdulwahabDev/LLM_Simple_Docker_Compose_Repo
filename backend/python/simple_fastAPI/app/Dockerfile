# FROM  python:3.10-slim
FROM --platform=linux/amd64 python:slim-bullseye 

WORKDIR /app
  
# commons start 
RUN apt-get update \
    && apt-get install -y libpq-dev gcc openssl \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir --upgrade pip 

COPY simple_fastAPI/app/requirements.txt app/requirements.txt 
RUN  pip install --no-cache-dir -r app/requirements.txt
# commons end 
 

COPY simple_fastAPI/app/start-reload.sh start-reload.sh
RUN chmod +x ./start-reload.sh 

COPY simple_fastAPI/app app

ENTRYPOINT ["sh", "./start-reload.sh"] 
 