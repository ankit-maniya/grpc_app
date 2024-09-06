// import 'dart:async';

// import 'package:grpc/grpc.dart';
// import 'package:grpc_app/gen/helloword.pbgrpc.dart';

// // final controller = StreamController<HelloResponse>();

// class WelcomeProtoService extends WelcomeProtoServiceBase {
//   static final WelcomeProtoService _instance = WelcomeProtoService._internal();

//   factory WelcomeProtoService() {
//     return _instance;
//   }

//   WelcomeProtoService._internal(); // Private constructor

//   bool _isClosed = false; // Flag to stop stream externally
//   HelloResponse? _customResponse; // To hold a custom response if added

//   // Simple RPC
//   @override
//   Future<HelloResponse> sayHello(ServiceCall call, HelloRequest request) {
//     var finalRespponse = HelloResponse()..message = 'Hello, ${request.name}';
//     return Future.value(finalRespponse);
//   }

//   // Server side streaming RPC
//   @override
//   Stream<HelloResponse> serverSideList(
//       ServiceCall call, HelloRequest request) async* {
//     if (_customResponse != null) {
//       yield _customResponse!;
//       _customResponse = null; // Reset after yielding
//     } else {
//       yield HelloResponse()..message = 'Hello, ${request.name}';
//       yield HelloResponse()..message = 'Hello 2, ${request.name}';
//       yield HelloResponse()..message = 'Hello 3, ${request.name}';
//       yield HelloResponse()..message = 'Hello 4, ${request.name}';
//     }
//   }

//   // Method to add a custom response
//   void modifyResponse(HelloResponse response) {
//     _customResponse = response; // Set custom response to be yielded next
//     print(_customResponse);
//   }

//   // Method to stop the stream
//   void closeStream() {
//     _isClosed = true; // Set flag to stop the stream
//   }

//   // Client side streaming RPC
//   @override
//   Future<HelloResponse> clientSideList(
//       ServiceCall call, Stream<HelloRequest> request) async {
//     var names = await request.map((req) => req.name).join(', ');

//     return HelloResponse()..message = 'Hello, $names';
//   }

//   // Bidirectional streaming RPC
//   @override
//   Stream<HelloResponse> bidirectionalList(
//       ServiceCall call, Stream<HelloRequest> request) async* {
//     await for (var req in request) {
//       print('Request:=>>>> ${req.name}');
//       // Process each request and yield a response
//       yield HelloResponse()..message = 'Hello, ${req.name}';
//     }
//   }

//   @override
//   Future<UserResponse> getUser(ServiceCall call, UserRequest request) {
//     print('Request:=>>>> ${request.toString()}');
//     // if user pass username then it will return 3 as it is defined as 3 inside proto file string username = 3;
//     print('request ; ${request.$_whichOneof(0)}');
//     var finalRespponse = UserResponse()
//       ..userInfo = 'Ankit'
//       ..userType = e_usertype.OPERATOR;

//     return Future.value(finalRespponse);
//   }
// }
