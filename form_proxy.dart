import 'models/form/form.dart';
import 'models/form_field/field_type.dart';
import 'models/form_field/form_field.dart';
import 'rule_engine.dart';
import 'util.dart';

/// The API to access the [Form].
class FormProxy {
  Form _form;

  FormProxy(this._form) : assert(_form != null);

  String get name => _form.name;

  List<FormField> get fields => _form.fields;

  void setValueAtIndex(int index, String value) {
    var field = fields[index];

    if (field.disabled) return;

    _setValue(field, value);
    fireRules(fields: fields, field: field);
  }

  /// Checks the inputted value is appropriate for the field type
  bool _setValue(FormField field, String value) {
    var type = field.type;
    if (type == FieldType.NUMBER && parseInt(value) == null) {
      return false;
    }
    if (type == FieldType.CHOICE && !field.choices.contains(value)) {
      return false;
    }
    field.value = value;
    return true;
  }

  Map<String, String> submit() {
    Map<String, String> formValues = {};
    fields
        .where((e) => !e.disabled)
        .forEach((e) => formValues[e.label] = e.value);
    return formValues;
  }
}
