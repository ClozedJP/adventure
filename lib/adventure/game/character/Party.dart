import 'package:adventure/adventure/game/character/Character.dart';
import 'package:adventure/adventure/game/element/Wallet.dart';

class Party {
    Wallet wallet = Wallet();
    //Clozed このmapないほうがいい可能性もある
    List<List<Character>> partyMembers = [];
}