import '../models/condition/condition.dart';
import '../models/condition/condition_type.dart';
import '../models/form_field/field_type.dart';
import '../models/form_field/form_field.dart';
import '../validator.dart';
import 'test_helper.dart';

final validator = Validator();

void main() {
  testValidator();
}

void testValidator() {
  printTestName("Validator Test");
  validate_AllShouldBeInvalid();
  validate_AllShouldBeValid();
  validate_ShouldConsiderDefaultValueIfValueNotPresent();
}

validate_AllShouldBeInvalid() {
  final fields = [
    FormField(
        key: "test_CONTAINS",
        label: "test_CONTAINS",
        type: FieldType.TEXT,
        value: "banana,avacado,apple",
        validations: [
          Condition(type: ConditionType.CONTAINS, value: "orange")
        ]),
    FormField(
        key: "test_IS",
        label: "test_IS",
        type: FieldType.TEXT,
        value: "orange",
        validations: [Condition(type: ConditionType.IS, value: "apple")]),
    FormField(
      key: "test_IS_EMPTY",
      label: "test_IS_EMPTY",
      type: FieldType.TEXT,
      value: "apple",
      validations: [Condition(type: ConditionType.IS_EMPTY)],
    ),
    FormField(
      key: "test_IS_NOT_EMPTY",
      label: "test_IS_NOT_EMPTY",
      type: FieldType.TEXT,
      validations: [Condition(type: ConditionType.IS_NOT_EMPTY)],
    ),
    FormField(
      key: "test_GREATER_THAN",
      label: "test_GREATER_THAN",
      type: FieldType.TEXT,
      value: "11",
      validations: [
        Condition(type: ConditionType.GREATER_THAN, value: "100"),
      ],
    ),
    FormField(
      key: "test_LESSER_THAN",
      label: "test_LESSER_THAN",
      type: FieldType.TEXT,
      value: "11",
      validations: [
        Condition(type: ConditionType.LESSER_THAN, value: "4"),
      ],
    ),
  ];
  final errors = validator.validate(fields);
  assertEquals(
    testName: "validate_AllShouldBeInvalid",
    actual: errors.length,
    expected: fields.length,
  );
}

validate_AllShouldBeValid() {
  final fields = [
    FormField(
        key: "test_CONTAINS",
        label: "test_CONTAINS",
        type: FieldType.TEXT,
        value: "banana,avacado,apple",
        validations: [Condition(type: ConditionType.CONTAINS, value: "apple")]),
    FormField(
        key: "test_IS",
        label: "test_IS",
        type: FieldType.TEXT,
        value: "orange",
        validations: [Condition(type: ConditionType.IS, value: "orange")]),
    FormField(
      key: "test_IS_EMPTY",
      label: "test_IS_EMPTY",
      type: FieldType.TEXT,
      validations: [Condition(type: ConditionType.IS_EMPTY)],
    ),
    FormField(
      key: "test_IS_NOT_EMPTY",
      label: "test_IS_NOT_EMPTY",
      type: FieldType.TEXT,
      value: "hello",
      validations: [Condition(type: ConditionType.IS_NOT_EMPTY)],
    ),
    FormField(
      key: "test_GREATER_THAN",
      label: "test_GREATER_THAN",
      type: FieldType.TEXT,
      value: "11",
      validations: [
        Condition(type: ConditionType.GREATER_THAN, value: "5"),
      ],
    ),
    FormField(
      key: "test_LESSER_THAN",
      label: "test_LESSER_THAN",
      type: FieldType.TEXT,
      value: "11",
      validations: [
        Condition(type: ConditionType.LESSER_THAN, value: "100"),
      ],
    ),
  ];
  final errors = validator.validate(fields);
  assertEquals(
    testName: "validate_AllShouldBeValid",
    actual: errors.length,
    expected: 0,
  );
}

validate_ShouldConsiderDefaultValueIfValueNotPresent() {
  final fields = [
    FormField(
      key: "test",
      label: "test",
      type: FieldType.NUMBER,
      defaultValue: "11",
      validations: [
        Condition(type: ConditionType.LESSER_THAN, value: "100"),
      ],
    ),
    FormField(
      key: "test",
      label: "test",
      type: FieldType.NUMBER,
      initialValue: "11",
      validations: [
        Condition(type: ConditionType.LESSER_THAN, value: "100"),
      ],
    ),
  ];
  final errors = validator.validate(fields);
  assertEquals(
    testName: "validate_ShouldConsiderDefaultValueIfValueNotPresent",
    actual: errors.length,
    expected: 0,
  );
}
