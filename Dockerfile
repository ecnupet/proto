FROM hydria/swagger-ui:latest
COPY ./doc/hello.swagger.json /opt
ENV SWAGGER_JSON=/opt/hello.swagger.json
