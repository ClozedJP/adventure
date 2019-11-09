// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CardGridViewItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardGridViewItem _$CardGridViewItemFromJson(Map<String, dynamic> json) {
  return CardGridViewItem(
    cardType: json['cardType'] as String,
    disp1: json['disp1'] as String,
    disp2: json['disp2'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$CardGridViewItemToJson(CardGridViewItem instance) =>
    <String, dynamic>{
      'cardType': instance.cardType,
      'disp1': instance.disp1,
      'disp2': instance.disp2,
      'url': instance.url,
    };
