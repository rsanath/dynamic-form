// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Form _$FormFromJson(Map<String, dynamic> json) {
  return Form(
    name: json['name'] as String,
    elements: (json['elements'] as List)
        ?.map((e) =>
            e == null ? null : FormElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FormToJson(Form instance) => <String, dynamic>{
      'name': instance.name,
      'elements': instance.elements,
    };
