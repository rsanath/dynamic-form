// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return Rule(
    condition: json['condition'] == null
        ? null
        : Condition.fromJson(json['condition'] as Map<String, dynamic>),
    actions: (json['actions'] as List)
        ?.map(
            (e) => e == null ? null : Action.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RuleToJson(Rule instance) => <String, dynamic>{
      'condition': instance.condition,
      'actions': instance.actions,
    };
