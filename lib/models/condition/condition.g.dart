// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return Condition(
    type: _$enumDecodeNullable(_$ConditionTypeEnumMap, json['type']),
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'type': _$ConditionTypeEnumMap[instance.type],
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

const _$ConditionTypeEnumMap = {
  ConditionType.IS: 'IS',
  ConditionType.IS_NOT: 'IS_NOT',
  ConditionType.CONTAINS: 'CONTAINS',
  ConditionType.IS_EMPTY: 'IS_EMPTY',
  ConditionType.IS_NOT_EMPTY: 'IS_NOT_EMPTY',
  ConditionType.GREATER_THAN: 'GREATER_THAN',
  ConditionType.LESSER_THAN: 'LESSER_THAN',
};
