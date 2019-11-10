import 'package:flutter/foundation.dart';

abstract class Character {
  String _characterType;
  String get characterType{
    return _characterType;
  }
  @protected
  set characterType(String s){
    _characterType = s;
  }

  String id;

  String firstName;
  String lastName;

  int currentHP = 0;
  int maxHP = 0;

  int currentResource1 =0;
  int maxResource1 =0;


  
  Character():_characterType = "Character";

}