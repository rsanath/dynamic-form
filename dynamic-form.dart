import 'dart:io';

import 'form_controller.dart';
import 'models/form/form.dart';
import 'util.dart';

FormController controller;

void main(List<String> arguments) {
  String inputPath = getInputPath(arguments);

  var json = readJson(inputPath);
  var _form = Form.fromJson(json);
  controller = FormController(form: _form);
  promptForm();
}

void promptForm() {
  print("Enter the command to execute or the number to provide values\n");
  for (int i = 0; i < controller.elements.length; i++) {
    var element = controller.elements[i];
    print("$i) ${element.toString()}");
  }
  print("\nsubmit) Submit the form");
  print("exit) Exit the application");
  listenForInput();
}

void listenForInput() {
  final command = input();
  if (command == "submit") {
    controller.submit();
  }
  if (command == "exit") {
    exit(0);
  }
  int index = parseInt(command);
  if (index != null && 0 <= index && index <= controller.elements.length - 1) {
    handleElementInput(index);
  }
  promptForm();
}

void handleElementInput(int index) {
  print("Available choices = ${controller.form.elements[index].choices.join(", ")}");
  var value = input(prompt: "Enter value: ");
  controller.setValueAtIndex(index, value);
}

String getInputPath(List<String> arguments) {
  if (arguments.isEmpty) {
    exitWithMessage("No arguments passed\n${helpMessage()}");
  }

  var first = arguments[0];

  if ("-help" == first || "-h" == first) {
    exitWithMessage(helpMessage());
  }
  if (first != "-p") {
    exitWithMessage("Unknown argument '$first' passed\n${helpMessage()}");
  }

  if (arguments.length < 2) {
    exitWithMessage(
        "Please provide path to the form schema file\n${helpMessage()}");
  }

  var filePath = arguments[1];
  return filePath;
}

String helpMessage() {
  return """
  dynamic_form
  
  USAGE: 
    dart ./dynamic_form -p path_to_a_form_schema.json.
    
    Refer the ticket_management_form_schema.json for the structure of the json.
  """;
}
