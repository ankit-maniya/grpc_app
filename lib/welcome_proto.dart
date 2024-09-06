// import 'dart:async';

// import 'package:grpc/grpc.dart';
// import 'package:grpc_app/gen/helloword.pbgrpc.dart';

// // final controller = StreamController<HelloResponse>();
// StreamController<HelloResponse> controller = StreamController<HelloResponse>();

// class WelcomeProtoService extends WelcomeProtoServiceBase {
//   // Simple RPC
//   @override
//   Future<HelloResponse> sayHello(ServiceCall call, HelloRequest request) {
//     var finalRespponse = HelloResponse()..message = 'Hello, ${request.name}';
//     return Future.value(finalRespponse);
//   }

//   // Server side streaming RPC
//   @override
//   Stream<HelloResponse> serverSideList(ServiceCall call, HelloRequest request) {
//     // var listOfNames = ['Ankit', 'Priyank'];

//     // for (var name in listOfNames) {
//     //   yield HelloResponse()..message = 'Hello, $name';
//     // }

//     // return Stream.fromIterable([
//     //   HelloResponse()..message = 'Hello, ${request.name} 1',
//     //   HelloResponse()..message = 'Hello, ${request.name} 2',
//     //   HelloResponse()..message = 'Hello, ${request.name} 3',
//     // ]);

//     // Stream.periodic creates a stream that emits events at a fixed interval.
//     // int counter = 1;

//     // return Stream.periodic(Duration(seconds: 1), (int _) {
//     //   final response = HelloResponse()
//     //     ..message = 'Hello, ${request.name} $counter';
//     //   counter++; // Increment the counter after creating the response
//     //   return response;
//     // }).take(3);

//     // Create a StreamController to emit responses at 1-second intervals

//     // // Emit responses at 1-second intervals
//     // Create a StreamController to emit responses at 1-second intervals
//     // final controller = StreamController<HelloResponse>();
//     int counter = 1;
//     print("Request:=>>>> ${request.name}");

//     // Emit responses at 1-second intervals
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       if (counter > 3) {
//         // controller.close(); // Close the stream after 3 messages
//         timer.cancel(); // Stop the timer
//       } else {
//         controller
//             .add(HelloResponse()..message = 'Hello, ${request.name} $counter');
//         // print("controller : ${controller.runtimeType}");
//         counter++;
//       }
//     });

//     // controller.add(HelloResponse()..message = 'Hello, ${request.name}');

//     controller.onPause = () {
//       print("onPause");
//     };

//     controller.onCancel = () {
//       print("onCancel");
//       controller = StreamController<HelloResponse>();
//     };

//     // controller.stream.listen((event) {
//     //   print("event inside  : ${event.message}");
//     // });

//     return controller.stream;
//   }

//   void modifyResponse(HelloResponse response) {
//     print("Adding data ....");
//     print("controller isClosed: ${controller.isClosed}");
//     print("controller isPaused: ${controller.isPaused}");
//     print("controller runtimeType: ${controller.runtimeType}");
//     print("controller hasListener: ${controller.hasListener}");
//     controller.add(response);
//   }

//   void closeStream() {
//     controller.close();
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
