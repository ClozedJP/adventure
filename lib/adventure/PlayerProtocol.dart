import 'package:adventure/adventure/game/GameMaster.dart';
import 'package:adventure/adventure/game/character/Party.dart';

class PlayerProtocol {
  static String getDateString(){
    return GameMaster.getDateString();
  }
  static String getTimeString(){
    return GameMaster.getTimeString();
  }
  static Party getParty(){
    return GameMaster.party;
  }
}