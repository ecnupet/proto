.PHONY: gen_swagger
swagger_gen:
	protoc \
	-I$(GOPATH)/src/grpc-gateway \
	-I$(GOPATH)/src/grpc-gateway/third_party/googleapis \
	-I. \
	--swagger_out=logtostderr=true,allow_delete_body=true:. \
	doc/hello.proto

ui_run:
	docker run -d -p 8080:8080 --name swagger-ui -e SWAGGER_JSON=/opt/hello.swagger.json -v `pwd`/doc:/opt swaggerapi/swagger-ui