// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Validation _$ValidationFromJson(Map<String, dynamic> json) {
  return Validation(
    type: _$enumDecodeNullable(_$ValidationTypeEnumMap, json['type']),
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$ValidationToJson(Validation instance) =>
    <String, dynamic>{
      'type': _$ValidationTypeEnumMap[instance.type],
      'value': instance.value,
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

const _$ValidationTypeEnumMap = {
  ValidationType.MIN_LENGTH: 'MIN_LENGTH',
  ValidationType.MAX_LENGTH: 'MAX_LENGTH',
  ValidationType.CONTAINS: 'CONTAINS',
  ValidationType.IS: 'IS',
  ValidationType.GREATER_THAN: 'GREATER_THAN',
  ValidationType.LESSER_THAN: 'LESSER_THAN',
};
