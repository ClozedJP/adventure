import 'package:adventure/adventure/game/character/Character.dart';
class Player extends Character {
  Player({String id,String firstName,String lastName,int currentHP , int maxHP,int currentResource1 , int maxResource1,  }){
    characterType = "Player";

    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;

    this.currentHP = currentHP;
    this.maxHP = maxHP;
    
    this.currentResource1 = currentResource1;
    this.maxResource1 = maxResource1;

  }
  
}