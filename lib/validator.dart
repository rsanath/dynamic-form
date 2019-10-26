import 'models/form_field/form_field.dart';
import 'models/validation/validation.dart';
import 'models/validation/validation_type.dart';
import 'util.dart';

class Validator {
  static final _singleton = Validator._internal();

  factory Validator() {
    return _singleton;
  }

  Validator._internal();

  List<String> validate(List<FormField> fields) {
    final errors = List<String>();
    fields.where((field) => !field.disabled).forEach((field) {
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
      final error = _isValid(
        validation: validation,
        label: field.label,
        value: field.value ?? field.defaultValue,
      );
      if (error != null) {
        errors.add(error);
      }
    }
    return errors;
  }

  String _isValid({Validation validation, String label, String value}) {
    switch (validation.type) {
      case ValidationType.CONTAINS:
        if (!(value?.contains(validation.value) ?? false)) {
          return "${label} should contain ${validation.value}";
        }
        break;
      case ValidationType.IS:
        if (value != validation.value) {
          return "${label} should be ${validation.value}";
        }
        break;
      case ValidationType.IS_EMPTY:
        if (value != null || value != "") {
          return "${label} should be empty";
        }
        break;
      case ValidationType.IS_NOT_EMPTY:
        if (value == null || value == "") {
          return "${label} should not be empty";
        }
        break;
      case ValidationType.GREATER_THAN:
        final number = parseInt(value);
        final expected = parseInt(validation.value);
        if (number == null || expected == null || number < expected) {
          return "$label should be greater than $expected";
        }
        break;
      case ValidationType.LESSER_THAN:
        final number = parseInt(value);
        final expected = parseInt(validation.value);
        if (number == null || expected == null || number > expected) {
          return "$label should be lesser than $expected";
        }
        break;
    }
    return null;
  }
}
