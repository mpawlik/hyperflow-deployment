```
cd docker
docker build -t hoppe/mdmaster:v5 images/master
docker build -t hoppe/mdworker:v5 images/worker
docker build -t docker_master master
export AWS_SECRET_ACCESS_KEY=<YOUR_KEY>
export AWS_ACCESS_KEY_ID=<YOUR_KEY>
cat worker/Dockerfile | envsubst | docker build --no-cache -t docker_worker -
docker-compose up
```
