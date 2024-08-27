//
//  Generated code. Do not modify.
//  source: helloword.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'helloword.pb.dart' as $0;

export 'helloword.pb.dart';

@$pb.GrpcServiceName('WelcomeProto')
class WelcomeProtoClient extends $grpc.Client {
  static final _$sayHello = $grpc.ClientMethod<$0.HelloRequest, $0.HelloResponse>(
      '/WelcomeProto/SayHello',
      ($0.HelloRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloResponse.fromBuffer(value));
  static final _$serverSideList = $grpc.ClientMethod<$0.HelloRequest, $0.HelloResponse>(
      '/WelcomeProto/ServerSideList',
      ($0.HelloRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloResponse.fromBuffer(value));
  static final _$clientSideList = $grpc.ClientMethod<$0.HelloRequest, $0.HelloResponse>(
      '/WelcomeProto/ClientSideList',
      ($0.HelloRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloResponse.fromBuffer(value));
  static final _$bidirectionalList = $grpc.ClientMethod<$0.HelloRequest, $0.HelloResponse>(
      '/WelcomeProto/BidirectionalList',
      ($0.HelloRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloResponse.fromBuffer(value));
  static final _$getUser = $grpc.ClientMethod<$0.UserRequest, $0.UserResponse>(
      '/WelcomeProto/GetUser',
      ($0.UserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserResponse.fromBuffer(value));

  WelcomeProtoClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.HelloResponse> sayHello($0.HelloRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sayHello, request, options: options);
  }

  $grpc.ResponseStream<$0.HelloResponse> serverSideList($0.HelloRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$serverSideList, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.HelloResponse> clientSideList($async.Stream<$0.HelloRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$clientSideList, request, options: options).single;
  }

  $grpc.ResponseStream<$0.HelloResponse> bidirectionalList($async.Stream<$0.HelloRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$bidirectionalList, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserResponse> getUser($0.UserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUser, request, options: options);
  }
}

@$pb.GrpcServiceName('WelcomeProto')
abstract class WelcomeProtoServiceBase extends $grpc.Service {
  $core.String get $name => 'WelcomeProto';

  WelcomeProtoServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloResponse>(
        'SayHello',
        sayHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloResponse>(
        'ServerSideList',
        serverSideList_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloResponse>(
        'ClientSideList',
        clientSideList,
        true,
        false,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloResponse>(
        'BidirectionalList',
        bidirectionalList,
        true,
        true,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserRequest, $0.UserResponse>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserRequest.fromBuffer(value),
        ($0.UserResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.HelloResponse> sayHello_Pre($grpc.ServiceCall call, $async.Future<$0.HelloRequest> request) async {
    return sayHello(call, await request);
  }

  $async.Stream<$0.HelloResponse> serverSideList_Pre($grpc.ServiceCall call, $async.Future<$0.HelloRequest> request) async* {
    yield* serverSideList(call, await request);
  }

  $async.Future<$0.UserResponse> getUser_Pre($grpc.ServiceCall call, $async.Future<$0.UserRequest> request) async {
    return getUser(call, await request);
  }

  $async.Future<$0.HelloResponse> sayHello($grpc.ServiceCall call, $0.HelloRequest request);
  $async.Stream<$0.HelloResponse> serverSideList($grpc.ServiceCall call, $0.HelloRequest request);
  $async.Future<$0.HelloResponse> clientSideList($grpc.ServiceCall call, $async.Stream<$0.HelloRequest> request);
  $async.Stream<$0.HelloResponse> bidirectionalList($grpc.ServiceCall call, $async.Stream<$0.HelloRequest> request);
  $async.Future<$0.UserResponse> getUser($grpc.ServiceCall call, $0.UserRequest request);
}
