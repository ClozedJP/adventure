// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdventureAction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdventureAction _$AdventureActionFromJson(Map<String, dynamic> json) {
  return AdventureAction(
    json['key'] as String,
    json['name'] as String,
    json['actionType'] as String,
  );
}

Map<String, dynamic> _$AdventureActionToJson(AdventureAction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'actionType': instance.actionType,
    };
