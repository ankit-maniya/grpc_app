import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

Future main() async {
  io.stdin
    ..lineMode = false
    ..echoMode = false;
    
  late StreamSubscription subscription;

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
    print(key);
  });
  print('Start listening');
}