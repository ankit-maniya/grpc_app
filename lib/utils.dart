import 'package:grpc/grpc.dart';

class Utils {
  // createClient method to create a client channel, which is similar to calling rest API using http client
  ClientChannel createClient() {
    final channel = ClientChannel(
      'localhost',
      port: 50051,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        codecRegistry:
            CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      ),
    );
    return channel;
  }
}
