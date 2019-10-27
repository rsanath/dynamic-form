import 'dart:convert';
import 'dart:io';

String input({String prompt}) {
  if (prompt != null) {
    stdout.write("$prompt: ");
  }
  return stdin.readLineSync();
}

clearScreen() {
  if(Platform.isWindows) {
    print(Process.runSync("cls", [], runInShell: true).stdout);
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

Map<String, Object> readJson(String filePath) {
  File file = File(filePath);
  String content = file.readAsStringSync();
  Map<String, Object> json = jsonDecode(content);
  return json;
}

int parseInt(String val) {
  if (val == null) return null;
  try {
    return int.parse(val);
  } on FormatException {
    return null;
  }
}

exitWithMessage(String message) {
  print(message);
  exit(0);
}
