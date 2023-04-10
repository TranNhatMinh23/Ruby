# README
DHH: 

>Reference architecture for a highly-available, scalable, fault-tolerant and resilient infrastructure on AWS with VPC and EC2

DHH:

> Add Docker files by default to new apps: Dockerfile, .dockerignore, bin/docker-entrypoint. These files can be skipped with --skip-docker. They're intended as a starting point for a production deploy of the application. Not intended for development

> Example:

> ```bash
> docker build -t app .
> docker volume create app-storage
> docker run --rm -it -v app-storage:/rails/storage -p 3000:3000 --env RAILS_MASTER_KEY=<see config/master.key> app
> ```
> You can also start a console or a runner from this image:
> ```bash
> docker run --rm -it -v app-storage:/rails/storage --env RAILS_MASTER_KEY=<see config/master.key> app console
> ```
> To Install nginx:
> ```bash
> sudo apt install nginx 
> sudo nano /etc/nginx/sites-available/aws_video
> server {
>  listen 80;
 > server_name example.com; # thay thế bằng tên miền của bạn

  > location / {
   > proxy_pass http://localhost:3000;
   > proxy_http_version 1.1;
   > proxy_set_header Upgrade $http_upgrade;
   > proxy_set_header Connection 'upgrade';
   > proxy_set_header Host $host;
   > proxy_cache_bypass $http_upgrade;
 > }
> }
> sudo ln -s /etc/nginx/sites-available/aws_video /etc/nginx/sites-enabled/
> sudo nano /etc/nginx/nginx. conf
> sudo service nginx restart
> 
