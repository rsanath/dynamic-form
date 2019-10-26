import 'models/form_field/form_field.dart';
import 'models/validation/validation_type.dart';

class Validator {
  static final _singleton = Validator._internal();

  factory Validator() {
    return _singleton;
  }

  Validator._internal();

  List<String> validate(List<FormField> fields) {
    final errors = List<String>();
    fields.forEach((field) {
      errors.addAll(_validateField(field));
    });
    return errors;
  }

  List<String> _validateField(FormField field) {
    final errors = List<String>();
    if (field.validations == null || field.validations.isEmpty) {
      return errors;
    }
    for (var validation in field.validations) {
      switch (validation.type) {
        case ValidationType.CONTAINS:
          if (field.value?.contains(validation.value) ?? false) {
            errors.add("${field.label} should contain ${validation.value}");
          }
          break;
        case ValidationType.IS:
          if (field.value == validation.value) {
            errors.add("${field.label} should be ${validation.value}");
          }
          break;
        case ValidationType.IS_EMPTY:
          if (field.value == null || field == "") {
            errors.add("${field.label} should be empty");
          }
          break;
        case ValidationType.IS_NOT_EMPTY:
          if (field.value != null || field != "") {
            errors.add("${field.label} should not be empty");
          }
      }
    }
    return errors;
  }
}