import 'package:grpc/grpc.dart';
import 'package:grpc_app/welcome_proto.dart';

Future<void> main(List<String> arguments) async {
  // creating Server instance
  final server = Server.create(
    services: [WelcomeProtoService()],
    codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );

// running server at port 50051
  await server.serve(port: 50051);
  print('Server listening... at port: ${server.port}');
}
