// import 'package:grpc_app/gen/helloword.pb.dart';
// import 'package:grpc_app/using_async.dart';

// void main(List<String> arguments) {
//   final inputService = WelcomeProtoService();

//   print('My Input ${arguments[0]}!');

//   if (arguments.isEmpty) {
//     print('Please provide input');
//     return;
//   }

//   if (arguments[0] == 'close') {
//     print('Closing the server');
//     inputService.closeStream();
//     return;
//   }

//   inputService.modifyResponse(HelloResponse()..message = arguments[0]);
// }
