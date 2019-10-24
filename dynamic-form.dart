import 'form_controller.dart';
import 'models/form/form.dart';
import 'util.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print("No arguments passed");
    print("Type -h or -help to see the list of commands");
  }

  String first = arguments[0];

  if ("-help" == first || "-h" == first) {
    printHelp();
    return;
  }
  if (first == "-p") {
    String path = arguments[1];
    var json = readJson(path);
    var form = Form.fromJson(json);
    var controller = FormController(form: form);
    controller.printCurrentState();
    return;
  }

  print("Unknown argument '$first' passed");
  print("Type -h or -help to see the list of commands");
  return;
}

void printHelp() {
  print("""
  dynamic_form
  
  USAGE: 
    dart ./dynamic_form -p path_to_a_form_schema.json.
    
    Refer the ticket_management_form_schema.json for the structure of the json.
  """);
}
