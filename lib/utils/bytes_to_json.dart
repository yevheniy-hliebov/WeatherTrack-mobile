import 'dart:convert';
import 'dart:typed_data';

dynamic bytesToJson(Uint8List bytes) {
  String decodedString = utf8.decode(bytes);
  return jsonDecode(decodedString);
}
