import 'package:adventure/adventure/game/rule/Character.dart';
class Player extends Character {
  Player({String id = "",String imageUrl,String timeStamp = "", String firstName,String lastName,int currentHP , int maxHP,int currentResource1 , int maxResource1,  }){
    characterType = "player";
    this.timeStamp = timeStamp;
    this.id = id;
    

    this.imageUrl = imageUrl;

    this.firstName = firstName;
    this.lastName = lastName;

    this.currentHP = currentHP;
    this.maxHP = maxHP;
    
    this.currentResource1 = currentResource1;
    this.maxResource1 = maxResource1;

  }  
}