// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdventureDescription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdventureDescription _$AdventureDescriptionFromJson(Map<String, dynamic> json) {
  return AdventureDescription(
    key: json['key'] as String,
    name: json['name'] as String,
    iconType: json['iconType'] as String,
    backGroundImagePath: json['backGroundImagePath'] as String,
    characterImagePath: json['characterImagePath'] as String,
    bodyType: json['bodyType'] as String,
    actionList: (json['actionList'] as List)
        ?.map((e) => e == null
            ? null
            : AdventureAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    gridItemList: (json['gridItemList'] as List)
        ?.map((e) => e == null
            ? null
            : CardGridViewItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AdventureDescriptionToJson(
        AdventureDescription instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'iconType': instance.iconType,
      'backGroundImagePath': instance.backGroundImagePath,
      'characterImagePath': instance.characterImagePath,
      'bodyType': instance.bodyType,
      'actionList': instance.actionList,
      'gridItemList': instance.gridItemList,
    };
