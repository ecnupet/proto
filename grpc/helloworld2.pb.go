// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.23.0
// 	protoc        v3.15.5
// source: grpc/helloworld2.proto

package test

import (
	context "context"
	proto "github.com/golang/protobuf/proto"
	_ "google.golang.org/genproto/googleapis/api/annotations"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

// This is a compile-time assertion that a sufficiently up-to-date version
// of the legacy proto package is being used.
const _ = proto.ProtoPackageIsVersion4

// The request message containing the user's name.
type HelloRequest2 struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Name string `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
}

func (x *HelloRequest2) Reset() {
	*x = HelloRequest2{}
	if protoimpl.UnsafeEnabled {
		mi := &file_grpc_helloworld2_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *HelloRequest2) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*HelloRequest2) ProtoMessage() {}

func (x *HelloRequest2) ProtoReflect() protoreflect.Message {
	mi := &file_grpc_helloworld2_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use HelloRequest2.ProtoReflect.Descriptor instead.
func (*HelloRequest2) Descriptor() ([]byte, []int) {
	return file_grpc_helloworld2_proto_rawDescGZIP(), []int{0}
}

func (x *HelloRequest2) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

type HelloRequest3 struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Name string `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
}

func (x *HelloRequest3) Reset() {
	*x = HelloRequest3{}
	if protoimpl.UnsafeEnabled {
		mi := &file_grpc_helloworld2_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *HelloRequest3) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*HelloRequest3) ProtoMessage() {}

func (x *HelloRequest3) ProtoReflect() protoreflect.Message {
	mi := &file_grpc_helloworld2_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use HelloRequest3.ProtoReflect.Descriptor instead.
func (*HelloRequest3) Descriptor() ([]byte, []int) {
	return file_grpc_helloworld2_proto_rawDescGZIP(), []int{1}
}

func (x *HelloRequest3) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

// The response message containing the greetings
type HelloReply2 struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Message string `protobuf:"bytes,1,opt,name=message,proto3" json:"message,omitempty"`
}

func (x *HelloReply2) Reset() {
	*x = HelloReply2{}
	if protoimpl.UnsafeEnabled {
		mi := &file_grpc_helloworld2_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *HelloReply2) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*HelloReply2) ProtoMessage() {}

func (x *HelloReply2) ProtoReflect() protoreflect.Message {
	mi := &file_grpc_helloworld2_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use HelloReply2.ProtoReflect.Descriptor instead.
func (*HelloReply2) Descriptor() ([]byte, []int) {
	return file_grpc_helloworld2_proto_rawDescGZIP(), []int{2}
}

func (x *HelloReply2) GetMessage() string {
	if x != nil {
		return x.Message
	}
	return ""
}

var File_grpc_helloworld2_proto protoreflect.FileDescriptor

var file_grpc_helloworld2_proto_rawDesc = []byte{
	0x0a, 0x16, 0x67, 0x72, 0x70, 0x63, 0x2f, 0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x77, 0x6f, 0x72, 0x6c,
	0x64, 0x32, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x0b, 0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x77,
	0x6f, 0x72, 0x6c, 0x64, 0x32, 0x1a, 0x1c, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x61, 0x70,
	0x69, 0x2f, 0x61, 0x6e, 0x6e, 0x6f, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x22, 0x23, 0x0a, 0x0d, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x52, 0x65, 0x71, 0x75,
	0x65, 0x73, 0x74, 0x32, 0x12, 0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x22, 0x23, 0x0a, 0x0d, 0x48, 0x65, 0x6c, 0x6c,
	0x6f, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x33, 0x12, 0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d,
	0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x22, 0x27, 0x0a,
	0x0b, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x52, 0x65, 0x70, 0x6c, 0x79, 0x32, 0x12, 0x18, 0x0a, 0x07,
	0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x6d,
	0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x32, 0x69, 0x0a, 0x08, 0x47, 0x72, 0x65, 0x65, 0x74, 0x65,
	0x72, 0x32, 0x12, 0x5d, 0x0a, 0x08, 0x53, 0x61, 0x79, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x12, 0x1a,
	0x2e, 0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x77, 0x6f, 0x72, 0x6c, 0x64, 0x32, 0x2e, 0x48, 0x65, 0x6c,
	0x6c, 0x6f, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x32, 0x1a, 0x18, 0x2e, 0x68, 0x65, 0x6c,
	0x6c, 0x6f, 0x77, 0x6f, 0x72, 0x6c, 0x64, 0x32, 0x2e, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x52, 0x65,
	0x70, 0x6c, 0x79, 0x32, 0x22, 0x1b, 0x82, 0xd3, 0xe4, 0x93, 0x02, 0x15, 0x22, 0x10, 0x2f, 0x76,
	0x31, 0x2f, 0x65, 0x78, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x2f, 0x65, 0x63, 0x68, 0x6f, 0x3a, 0x01,
	0x2a, 0x42, 0x08, 0x5a, 0x06, 0x2e, 0x3b, 0x74, 0x65, 0x73, 0x74, 0x62, 0x06, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x33,
}

var (
	file_grpc_helloworld2_proto_rawDescOnce sync.Once
	file_grpc_helloworld2_proto_rawDescData = file_grpc_helloworld2_proto_rawDesc
)

func file_grpc_helloworld2_proto_rawDescGZIP() []byte {
	file_grpc_helloworld2_proto_rawDescOnce.Do(func() {
		file_grpc_helloworld2_proto_rawDescData = protoimpl.X.CompressGZIP(file_grpc_helloworld2_proto_rawDescData)
	})
	return file_grpc_helloworld2_proto_rawDescData
}

var file_grpc_helloworld2_proto_msgTypes = make([]protoimpl.MessageInfo, 3)
var file_grpc_helloworld2_proto_goTypes = []interface{}{
	(*HelloRequest2)(nil), // 0: helloworld2.HelloRequest2
	(*HelloRequest3)(nil), // 1: helloworld2.HelloRequest3
	(*HelloReply2)(nil),   // 2: helloworld2.HelloReply2
}
var file_grpc_helloworld2_proto_depIdxs = []int32{
	0, // 0: helloworld2.Greeter2.SayHello:input_type -> helloworld2.HelloRequest2
	2, // 1: helloworld2.Greeter2.SayHello:output_type -> helloworld2.HelloReply2
	1, // [1:2] is the sub-list for method output_type
	0, // [0:1] is the sub-list for method input_type
	0, // [0:0] is the sub-list for extension type_name
	0, // [0:0] is the sub-list for extension extendee
	0, // [0:0] is the sub-list for field type_name
}

func init() { file_grpc_helloworld2_proto_init() }
func file_grpc_helloworld2_proto_init() {
	if File_grpc_helloworld2_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_grpc_helloworld2_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*HelloRequest2); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_grpc_helloworld2_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*HelloRequest3); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_grpc_helloworld2_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*HelloReply2); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_grpc_helloworld2_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   3,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_grpc_helloworld2_proto_goTypes,
		DependencyIndexes: file_grpc_helloworld2_proto_depIdxs,
		MessageInfos:      file_grpc_helloworld2_proto_msgTypes,
	}.Build()
	File_grpc_helloworld2_proto = out.File
	file_grpc_helloworld2_proto_rawDesc = nil
	file_grpc_helloworld2_proto_goTypes = nil
	file_grpc_helloworld2_proto_depIdxs = nil
}

// Reference imports to suppress errors if they are not otherwise used.
var _ context.Context
var _ grpc.ClientConnInterface

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
const _ = grpc.SupportPackageIsVersion6

// Greeter2Client is the client API for Greeter2 service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://godoc.org/google.golang.org/grpc#ClientConn.NewStream.
type Greeter2Client interface {
	// Sends a greeting
	SayHello(ctx context.Context, in *HelloRequest2, opts ...grpc.CallOption) (*HelloReply2, error)
}

type greeter2Client struct {
	cc grpc.ClientConnInterface
}

func NewGreeter2Client(cc grpc.ClientConnInterface) Greeter2Client {
	return &greeter2Client{cc}
}

func (c *greeter2Client) SayHello(ctx context.Context, in *HelloRequest2, opts ...grpc.CallOption) (*HelloReply2, error) {
	out := new(HelloReply2)
	err := c.cc.Invoke(ctx, "/helloworld2.Greeter2/SayHello", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// Greeter2Server is the server API for Greeter2 service.
type Greeter2Server interface {
	// Sends a greeting
	SayHello(context.Context, *HelloRequest2) (*HelloReply2, error)
}

// UnimplementedGreeter2Server can be embedded to have forward compatible implementations.
type UnimplementedGreeter2Server struct {
}

func (*UnimplementedGreeter2Server) SayHello(context.Context, *HelloRequest2) (*HelloReply2, error) {
	return nil, status.Errorf(codes.Unimplemented, "method SayHello not implemented")
}

func RegisterGreeter2Server(s *grpc.Server, srv Greeter2Server) {
	s.RegisterService(&_Greeter2_serviceDesc, srv)
}

func _Greeter2_SayHello_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(HelloRequest2)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(Greeter2Server).SayHello(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/helloworld2.Greeter2/SayHello",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(Greeter2Server).SayHello(ctx, req.(*HelloRequest2))
	}
	return interceptor(ctx, in, info, handler)
}

var _Greeter2_serviceDesc = grpc.ServiceDesc{
	ServiceName: "helloworld2.Greeter2",
	HandlerType: (*Greeter2Server)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "SayHello",
			Handler:    _Greeter2_SayHello_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "grpc/helloworld2.proto",
}
