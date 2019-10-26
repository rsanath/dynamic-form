import '../../form_interface.dart';
import '../form_field/form_field.dart';

part 'form.g.dart';

class Form implements IForm {
  String name;
  List<FormField> fields;

  Form({
    this.name,
    this.fields,
  });

  bool get isValid => fields.every((field) => field.isValid);

  bool get isInvalid => !isValid;

  List<String> get validationErrors {
    return fields
        .where((field) => field.isInvalid)
        .map((field) => "${field.label} is invalid");
  }

  factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);

  Map<String, dynamic> toJson() => _$FormToJson(this);

  @override
  void setValue(int index, String value) {

  }

  @override
  Map<String, String> submit() {

  }
}
