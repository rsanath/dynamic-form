// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(
    targetKey: json['targetKey'] as String,
    type: _$enumDecodeNullable(_$ActionTypeEnumMap, json['type']),
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
  'targetKey': instance.targetKey,
  'type': _$ActionTypeEnumMap[instance.type],
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

const _$ActionTypeEnumMap = {
  ActionType.ENABLE: 'ENABLE',
  ActionType.DISABLE: 'DISABLE',
  ActionType.SHOW: 'SHOW',
  ActionType.HIDE: 'HIDE',
};
