import 'form_controller.dart';
import 'models/form/form.dart';
import 'util.dart';

Form form;

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    printNoArgumentMessage();
  }

  String first = arguments[0];

  if (!isFormCommand(first)) {
    print("Unknown argument '$first' passed");
    return;
  }

  String path = arguments[1];
  var json = readJson(path);
  form = Form.fromJson(json);
  var controller = FormController(form: form);
  printForm();
}

void printForm() {
  for (int i = 0; i < form.elements.length; i++) {
    var element = form.elements[i];
    print("$i) ${element.toString()}");
  }
}

bool isFormCommand(String value) => value == "-p";

bool isHelpCommand(String value) => "-help" == value || "-h" == value;

void printNoArgumentMessage() {
  print("""No arguments passed.
  Type -h or -help to see the list of commands""");
}

void printHelp() {
  print("""
  dynamic_form
  
  USAGE: 
    dart ./dynamic_form -p path_to_a_form_schema.json.
    
    Refer the ticket_management_form_schema.json for the structure of the json.
  """);
}
