import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:grpc_app/gen/helloword.pbgrpc.dart';
import 'package:grpc_app/utils.dart';

void main(List<String> arguments) async {
  // used common channel from utils.dart
  Utils utils = Utils();
  ClientChannel channel = utils.createClient();
  final stub = WelcomeProtoClient(channel);

  // // simple rpc call
  // simpleRpc(stub);

  // // server side streaming call
  print(" <=== Start Streaming response from server ===>");
  HelloRequest streamReq = HelloRequest()..name = 'Maniya -> ';
  // await stub.serverSideList(streamReq).listen((response) async {
  //   print("response: ${response.message}");
  // });
  try {
    await for (var response in stub.serverSideList(streamReq)) {
      print("response: ${response.message}");
    }
  } catch (e) {
    print("Error occurred while listening to the stream: $e");
  }
  print(" <=== End Streaming response from server ===>");

  // // client side streaming call
  // clientSideStreaming(stub);

  // // bidirectional streaming call
  // bidirectionalStreaming(stub);

  // get user call using simple rpc
  // await getUser(stub);

  // await channel.shutdown();
}

simpleRpc(stub) async {
  print(" <=== Start Simple RPC ===>");
  // requesting to server and getting response from server using async-await
  HelloRequest request = HelloRequest()..name = 'Ankit';

  HelloResponse response = await stub.sayHello(request);
  print("response: ${response.message}");

  print(" <=== End Simple RPC ===>");
}

serverSideStreaming(stub) async {
  print(" <=== Start Streaming response from server ===>");
  HelloRequest streamReq = HelloRequest()..name = 'Maniya -> ';
  await for (var response in stub.serverSideList(streamReq)) {
    print("response: ${response.message}");
  }
  print(" <=== End Streaming response from server ===>");
}

clientSideStreaming(stub) async {
  print(" <=== Start Client Side Streaming ===>");

  // client side streaming without time interval
  // var listOfNames = [
  //   HelloRequest()..name = 'Ankit',
  //   HelloRequest()..name = 'Priyank',
  // ];

  // Stream<HelloRequest> stream = Stream.fromIterable(listOfNames);
  // HelloResponse finalResponse = await stub.clientSideList(stream);
  // print("finalResponse : ${finalResponse.message}");

  // client side streaming with time interval
  var listOfNames = ['Ankit', 'Priyank', 'John'];

  // Create a StreamController for HelloRequest
  StreamController<HelloRequest> controller = StreamController<HelloRequest>();

  // Start a timer to add each HelloRequest to the stream every second
  int counter = 0;
  Timer.periodic(Duration(seconds: 1), (timer) {
    if (counter < listOfNames.length) {
      controller.add(HelloRequest()..name = listOfNames[counter]);
      print("Request: ${listOfNames[counter]}");
      counter++;
    } else {
      controller.close(); // Close the stream when done
      timer.cancel(); // Stop the timer
    }
  });

  // Send the stream to the server and await the response
  HelloResponse finalResponse = await stub.clientSideList(controller.stream);

  // Print the final response from the server
  print("finalResponse: ${finalResponse.message}");

  print(" <=== End Client Side Streaming ===>");
}

bidirectionalStreaming(stub) async {
  print(" <=== Start Bidirectional Streaming ===>");
  // Create a StreamController to manage the request stream
  final requestStream = StreamController<HelloRequest>();

  // Start sending requests each request after 2 seconds
  Future<void> sendRequests() async {
    for (var name in ['Ankit', 'Priyank', 'Maniya']) {
      requestStream.add(HelloRequest()..name = name);
      await Future.delayed(
          Duration(seconds: 2)); // Simulate some delay between requests
    }
    requestStream.close();
  }

  // Call the bidirectional streaming RPC
  final responseStream = stub.bidirectionalList(requestStream.stream);

  // Listen for responses
  responseStream.listen((response) {
    print('Received: ${response.message}');
  });

  await sendRequests();

  print(" <=== End Bidirectional Streaming ===>");
}

getUser(stub) async {
  // Get User
  print(" <=== Start Get User ===>");

  UserRequest getUserRequest = UserRequest()
    // ..email = 'ankit@gmail.com'
    ..username = 'ankitmaniya'
    ..userType = e_usertype.OPERATOR;

  UserResponse userDetails = await stub.getUser(getUserRequest);
  print("User Details: ${userDetails.userInfo} ${userDetails.userType}");

  print(" <=== End Get User ===>");
}
