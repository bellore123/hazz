FROM nginx:latest
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
DOCKER DEPLOYMENT – COMPLETE CODE

1. HTML FILE (index.html)

<!DOCTYPE html>

<html>
<head>
    <title>My App</title>
</head>
<body>
    <h1>Hello! Docker App Running Successfully</h1>
</body>
</html>

2. DOCKERFILE

FROM nginx:alpine
COPY . /usr/share/nginx/html
EXPOSE 80

3. BUILD DOCKER IMAGE

docker build -t my-html-app .

4. RUN DOCKER CONTAINER

docker run -d -p 30010:80 my-html-app

5. CHECK RUNNING CONTAINER

docker ps

6. APPLICATION LINK

http://localhost:30010

RESULT:
The HTML application is successfully containerized and deployed using Docker, and it is accessible through the browser.
