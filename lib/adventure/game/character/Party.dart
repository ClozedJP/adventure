import 'dart:collection';

import 'package:adventure/adventure/game/character/Character.dart';
import 'package:adventure/adventure/game/element/Wallet.dart';

class Party {
    Wallet wallet = Wallet();
    LinkedHashMap<String,Character> partyMembers = LinkedHashMap<String,Character>();
    
}