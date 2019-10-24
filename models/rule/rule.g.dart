// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return Rule(
    targetId: json['targetId'] as String,
    condition: json['condition'] == null
        ? null
        : Condition.fromJson(json['condition'] as Map<String, dynamic>),
    action: json['action'] == null
        ? null
        : Action.fromJson(json['action'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RuleToJson(Rule instance) => <String, dynamic>{
      'targetId': instance.targetId,
      'condition': instance.condition,
      'action': instance.action,
    };
