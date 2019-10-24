import 'dart:io';

String input({String prompt}) {
  if (prompt != null) {
    stdout.write("$prompt: ");
  }
  return stdin.readLineSync();
}
