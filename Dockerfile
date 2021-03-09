FROM pentusha/swagger-ui-crossbuild:latest
COPY ./doc/hello.swagger.json /opt
ENV SWAGGER_JSON=/opt/hello.swagger.json
