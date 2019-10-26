// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormField _$FormFieldFromJson(Map<String, dynamic> json) {
  return FormField(
    key: json['key'] as String,
    label: json['label'] as String,
    value: json['value'] as String,
    type: _$enumDecodeNullable(_$FieldTypeEnumMap, json['type']),
    initialValue: json['initialValue'] as String,
    defaultValue: json['defaultValue'] as String,
    disabled: json['disabled'] as bool,
    visible: json['visible'] as bool,
    choices: (json['choices'] as List)?.map((e) => e as String)?.toList(),
    validations: (json['validations'] as List)
        ?.map(
            (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rules: (json['rules'] as List)
        ?.map(
            (e) => e == null ? null : Rule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FormFieldToJson(FormField instance) =>
    <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
      'value': instance.value,
      'type': _$FieldTypeEnumMap[instance.type],
      'initialValue': instance.initialValue,
      'defaultValue': instance.defaultValue,
      'disabled': instance.disabled,
      'visible': instance.visible,
      'validations': instance.validations,
      'choices': instance.choices,
      'rules': instance.rules,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$FieldTypeEnumMap = {
  FieldType.TEXT: 'TEXT',
  FieldType.CHOICE: 'CHOICE',
  FieldType.NUMBER: 'NUMBER',
};
