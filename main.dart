import 'dart:io';

import 'lib/form_controller.dart';
import 'lib/models/form/form.dart';
import 'lib/models/form_field/field_type.dart';
import 'lib/rule_engine.dart';
import 'lib/util.dart';
import 'lib/validator.dart';

FormController form;

void main(List<String> arguments) {
  final pathToSchema = getPathToSchema(arguments);

  final json = readJson(pathToSchema);

  form = FormController(
    form: Form.fromJson(json),
    ruleEngine: RuleEngine(),
    validator: Validator(),
  );

  promptForm();
}

void promptForm() {
  print("");

  for (int i = 0; i < form.fields.length; i++) {
    var field = form.fields[i];
    print("$i) ${field.toString()}");
  }
  print("submit) Submit the form");
  print("exit)   Exit the application\n");

  listenForInput();
}

void listenForInput() {
  final command = input(prompt: "Enter action");

  int index = parseInt(command);

  if (index != null && 0 <= index && index <= form.fields.length - 1) {
    handleFieldInput(index);
    promptForm();
  } else if (command == "submit") {
    clearScreen();
    handleSubmit();
    promptForm();
  } else if (command == "exit") {
    exit(0);
  } else {
    clearScreen();
    print("Invalid command");
    promptForm();
  }
}

void handleFieldInput(int index) {
  if (form.fields[index].type == FieldType.CHOICE) {
    print("Available choices = ${form.fields[index].choices.join(", ")}");
  }
  var value = input(prompt: "Enter value");
  clearScreen();
  form.setValue(index, value);
}

void handleSubmit() {
  final errors = form.validate();
  if (errors.isEmpty) {
    final content = form.submit();
    content.forEach((key, value) {
      print("${key.padRight(28)} = $value");
    });
  } else {
    print("The form could not be submitted because:");
    errors.forEach((e) => print(" - ${e}"));
  }
}

String getPathToSchema(List<String> arguments) {
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
    dart ./main.dart -p path_to_a_form_schema.json.
    
    Refer the ticket_management_schema.json for the structure of the json.
  """;
}
