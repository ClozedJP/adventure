import 'package:adventure/adventure/game/rule/IamUnique.dart';
import 'package:flutter/foundation.dart';

abstract class Character implements IamUnique{
  String _characterType;
  String get characterType{
    return _characterType;
  }
  @protected
  set characterType(String s){
    _characterType = s;
  }

  String id;
  String timeStamp;
  String imageUrl;

  String firstName;
  String lastName;

  int currentHP = 0;
  int maxHP = 0;

  int currentResource1 =0;
  int maxResource1 =0;

  int strength = 10;//力
  int dexterity = 10;//器用さ
  int intelligence = 10;//知性
  int vitality = 10;//活力
  int metality = 10;//精神力
  int agility = 10;//機敏
  int luck = 10;//幸運
  
  Character():_characterType = "character";

  String get uniqueId{
    return id + ":" + timeStamp;
  }
}