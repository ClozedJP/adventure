import 'package:adventure/adventure/game/element/Wallet.dart';
import 'package:adventure/adventure/game/rule/Character.dart';

class Party {
    Wallet wallet = Wallet();
    //Clozed このmapないほうがいい可能性もある
    List<List<Character>> partyMembers = [];
}