import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:grpc/grpc.dart';
import 'package:grpc_app/server_proto.dart';
// import 'package:grpc_app/welcome_proto.dart';

Future<void> main(List<String> arguments) async {
  // creating Server instance
  final server = Server.create(
    services: [ServerProtoService()],
    codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );

  io.stdin
    ..lineMode = false
    ..echoMode = false;

  late StreamSubscription subscription;
  StreamController<String> subController = StreamController<String>.broadcast();

  subscription = io.stdin.listen((List<int> codes) {
    var first = codes.first;
    var len = codes.length;
    var key;
    if (len == 1 && ((first > 0x01 && first < 0x20) || first == 0x7f)) {
      // Control code. For example:
      // 0x09 - Tab
      // 0x10 - Enter
      // 0x1b - ESC
      if (first == 0x09) {
        subscription.cancel();
      }
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
    // ServerProtoService().controller.add(key);
    print("key :: $key");
  });

  Future.delayed(Duration(seconds: 20), () {
    subController.add("Me->Maniya");
  });

  ServerProtoService().changeReferance(subscription, subController);

  // subscription.onData((handler) {
  //   print("Data: $handler");
  // });

// running server at port 50051
  await server.serve(address: "127.0.0.1", port: 50054);
  print('Server listening... at port: ${server.port}');
}
