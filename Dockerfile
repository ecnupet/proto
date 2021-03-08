FROM swaggerapi/swagger-ui
COPY ./doc/hello.swagger.json /opt
ENV SWAGGER_JSON=/opt/hello.swagger.json
