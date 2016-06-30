FROM hoppe/mdmaster:v5

WORKDIR "/"
RUN npm install https://github.com/hopped/hyperflow/archive/develop.tar.gz

WORKDIR "/hyperflow-deployment"
RUN git checkout develop
RUN git pull

WORKDIR "/hyperflow-deployment/scripts/master"
RUN bash install.sh

EXPOSE 51483 5672 51404
CMD ["bash", "start.sh", "/tmp", "paasage-bucket", "results/" ]

