import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:grpc/grpc.dart';
import 'package:grpc_app/gen/helloword.pbgrpc.dart';

// class TestResult {
//   addTestResult(String name) {
//     print('Test Result: $name');
//     controller.add(name);
//   }
// }

late StreamSubscription subscriptionForStdIo;
late StreamController<String> subControllerInside;

class ServerProtoService extends WelcomeProtoServiceBase {
  // final StreamController<String> controller =
  //     StreamController<String>.broadcast();

  changeReferance(subscription, StreamController<String> subController) {
    subscriptionForStdIo = subscription;
    subControllerInside = subController;

    subscriptionForStdIo.onData((handler) {
      print("subscriptionForStdIo: $handler");
    });
  }

  // Simple RPC
  @override
  Future<HelloResponse> sayHello(ServiceCall call, HelloRequest request) {
    var finalRespponse = HelloResponse()..message = 'Hello, ${request.name}';
    return Future.value(finalRespponse);
  }

  // Server side streaming RPC
  // Stream<Feature> listFeatures(
  //     grpc.ServiceCall call, Rectangle request) async* {
  //   final normalizedRectangle = _normalize(request);
  //   // For each feature, check if it is in the given bounding box
  //   for (var feature in featuresDb) {
  //     if (feature.name.isEmpty) continue;
  //     final location = feature.location;
  //     if (_contains(normalizedRectangle, location)) {
  //       yield feature;
  //     }
  //   }
  // }

  String getKey(codes) {
    var first = codes.first;
    var len = codes.length;
    var key;
    if (len == 1 && ((first > 0x01 && first < 0x20) || first == 0x7f)) {
      // Control code. For example:
      // 0x09 - Tab
      // 0x10 - Enter
      // 0x1b - ESC
      if (first == 0x09) {}
      key = codes.toString();
    } else if (len > 1 && first == 0x1b) {
      // ESC sequence.  For example:
      // [ 0x1b, 0x5b, 0x41 ] - Up Arrow
      // [ 0x1b, 0x5b, 0x42 ] - Down Arrow
      // [ 0x1b, 0x5b, 0x43 ] - Right Arrow
      // [ 0x1b, 0x5b, 0x44 ] - Left Arrow
      key = '${codes.toString()} ESC ${String.fromCharCodes(codes.skip(1))}';
    } else {
      key = utf8.decode(codes);
    }

    return key;
  }

  @override
  Stream<HelloResponse> serverSideList(
      ServiceCall call, HelloRequest request) async* {
    // final controller = StreamController<HelloResponse>();
    final controller = StreamController<HelloResponse>();
    bool run = true;
    int counter = 1;
    print("Request:=>>>> ${request.name}");

    // In wtfUtc we listen on a stream for test result, exception too.
    // while (true) {
    // when UTC execution is finished, we want to break so that this serverSideList stream terminated in WTF-UI
    // if (counter > 50) {
    //   break;
    // }

    subControllerInside.stream.listen((handler) {
      print("subControllerInside: $handler");
      controller.add(HelloResponse()..message = 'Hello =>>, $handler');
    });

    subscriptionForStdIo.onData((codes) {
      print("mymind: $codes");

      String myKey = getKey(codes);

      if ("x" == myKey) {
        controller.close();
        return;
      }
      controller.add(HelloResponse()..message = 'Hello, $myKey');
    });

    // controller.stream.listen((data) {
    //   print('controller.stream received key: $data');

    //   // if (data == 'x') {
    //   //   print('Breaking the loop');
    //   //   return;
    //   // }

    //   // yield HelloResponse()..message = 'Hello, ${request.name} $counter';
    //   counter++;

    //   subscriptionForStdIo.onData((handler) {
    //     print("Data: $handler");
    //   });
    // });

    yield* controller.stream;

    // while (run) {
    //   await Future.delayed(Duration(seconds: 1));
    //   yield HelloResponse()..message = 'Hello, ${request.name} $counter';
    // }

    // print("exit from rpc");
  }

  // when we exits this future the above stream is close to client
  // }

  // rpc execute from wtf-ui`
  // _utc_execute(string) // do this befor listening to wtf_utc stream
  // but have method to know when above future s complete
  // during execution wtf.testResult is adding results to wtf_utc_stream ... possibly many times
  // now done executiong
  // send to wtf_utc stream indicating utc_execute is done ... add to that stream
  // rpc execute is listing to above stream, and will then break .... completing the rpc
  // `

  // Client side streaming RPC
  @override
  Future<HelloResponse> clientSideList(
      ServiceCall call, Stream<HelloRequest> request) async {
    var names = await request.map((req) => req.name).join(', ');

    return HelloResponse()..message = 'Hello, $names';
  }

  // Bidirectional streaming RPC
  @override
  Stream<HelloResponse> bidirectionalList(
      ServiceCall call, Stream<HelloRequest> request) async* {
    await for (var req in request) {
      print('Request:=>>>> ${req.name}');
      // Process each request and yield a response
      yield HelloResponse()..message = 'Hello, ${req.name}';
    }
  }

  @override
  Future<UserResponse> getUser(ServiceCall call, UserRequest request) {
    print('Request:=>>>> ${request.toString()}');
    // if user pass username then it will return 3 as it is defined as 3 inside proto file string username = 3;
    print('request ; ${request.$_whichOneof(0)}');
    var finalRespponse = UserResponse()
      ..userInfo = 'Ankit'
      ..userType = e_usertype.OPERATOR;

    return Future.value(finalRespponse);
  }
}
