import '../models/form_field/field_type.dart';
import '../models/form_field/form_field.dart';

void main() {}

executeRule_PerformActionOnConditionPass() {
  List<FormField> fields = [
    FormField(
      label: "reason",
      key: "reason",
      type: FieldType.CHOICE,
      choices: ["choice1", "other"],
    ),
  ];
}
