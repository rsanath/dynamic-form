import '../form_field/form_field.dart';

part 'form.g.dart';

class Form {
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
}
