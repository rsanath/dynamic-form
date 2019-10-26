import '../form_field/form_field.dart';

part 'form.g.dart';

class Form {
  String name;
  List<FormField> fields;

  Form({
    this.name,
    this.fields,
  });

  factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);

  Map<String, dynamic> toJson() => _$FormToJson(this);

  void setValue(int index, String value) {
    fields[index].value = value;
  }
}
