FROM redis:alpine3.20




WORKDIR /app

COPY ./start.sh start.sh
RUN chmod +x start.sh 

ENTRYPOINT ["sh", "start.sh"]



