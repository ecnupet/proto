swagger_gen:
	protoc \
	-I$(GOPATH)/src/github.com/googleapis/googleapis \
	-I$(GOPATH)/src/github.com/googleapis \
	-I$(GOPATH)/src/github.com \
	-I. \
	--swagger_out=logtostderr=true,allow_delete_body=true:. \
	doc/hello.proto

ui_run:
	docker run -d -p 8080:8080 --name swagger-ui -e SWAGGER_JSON=/opt/hello.swagger.json -v `pwd`/doc:/opt swaggerapi/swagger-ui
