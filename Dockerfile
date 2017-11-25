FROM node:6.10.3-slim
RUN apt-get update \    
    && apt-get install -y Nginx
WORKDIR /app
COPY . /app/
EXPOSE 80
RUN  npm install \     
     && npm run build \     
     && cp -r dist/* /var/www/html \     
     && rm -rf /app
CMD ["Nginx","-g","daemon off;"]