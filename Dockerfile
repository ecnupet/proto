FROM hydria/swagger-ui:latest
COPY ./doc/hello.swagger.json /opt
ENV BASE_URL=/doc
ENV SWAGGER_JSON=/opt/hello.swagger.json
