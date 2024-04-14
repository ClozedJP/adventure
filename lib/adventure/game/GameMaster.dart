/*
  Copyright 2019 ClozedJP

  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
  to deal in the Software without restriction, including without limitation the rights to use, copy,
  modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
  and to permit persons to whom the Software is furnished to do so,
  subject to the following conditions:
  
    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY , FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
import 'dart:math';

import 'package:adventure/adventure/game/character/Party.dart';
import 'package:adventure/adventure/game/character/character/Monster.dart';

class GameMaster {
  static DateTime _gameTime = DateTime.utc(2019, 10, 30, 8);
  static Map<int, String> monthDisplay = {
    1: "睦月",
    2: "如月",
    3: "弥生",
    4: "卯月",
    5: "皐月",
    6: "水無月",
    7: "文月",
    8: "葉月",
    9: "長月",
    10: "神無月",
    11: "霜月",
    12: "師走",
  };
  static void inclementTime() {
    _gameTime = DateTime.utc(
        _gameTime.year, _gameTime.month, _gameTime.day, _gameTime.hour + 1);
  }

  static String getTimeString() {
    String prefix = _gameTime.hour >= 12 ? "pm " : "am ";
    String time = _gameTime.hour >= 12
        ? (_gameTime.hour - 12).toString()
        : (_gameTime.hour).toString();
    return prefix + time.padLeft(2, "0");
  }

  static String getDateString() {
    return monthDisplay[_gameTime.month] +
        ' - ${_gameTime.day}'.padLeft(2, "0") +
        "日";
  }

  static Party _party = Party();

  static Party get party{
    return _party;
  }

  static Party _enemy = Party();

  static Party get enemy{
    //Clozed testcode
    if(_enemy.partyMembers.isEmpty){
      _enemy.partyMembers = [[createDummyMonster("Slime","A"),createDummyMonster("Slime","B")]];
    }
    //testcode end
    return _enemy;
  }

  static Monster createDummyMonster(String firstName,String lastName){
    return Monster(
      imageUrl: 'asset/image/character/monster/slime.png',
      firstName: firstName,
      lastName: lastName,
      currentHP: Random.secure().nextInt(1000),
      maxHP: 1000,
      currentResource1: Random.secure().nextInt(1000),
      maxResource1: 1000,
      id:  Random.secure().nextInt(1000).toString(),
    );
  }
}
