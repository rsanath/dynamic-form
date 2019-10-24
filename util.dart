import 'dart:convert';
import 'dart:io';

String input({String prompt}) {
  if (prompt != null) {
    stdout.write("$prompt: ");
  }
  return stdin.readLineSync();
}

Map<String, Object> readJson(String filePath) {
  File file = File(filePath);
  String content = file.readAsStringSync();
  Map<String, Object> json = jsonDecode(content);
  return json;
}
