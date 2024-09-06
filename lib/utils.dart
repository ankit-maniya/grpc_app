import 'package:grpc/grpc.dart';

class Utils {
  // createClient method to create a client channel, which is similar to calling rest API using http client
  ClientChannel createClient() {
    final channel = ClientChannel(
      '127.0.0.1',
      port: 50054,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        codecRegistry:
            CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      ),
    );
    return channel;
  }
}
