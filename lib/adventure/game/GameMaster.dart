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
import 'package:adventure/adventure/game/Loading.dart';
import 'package:adventure/adventure/game/Routing.dart';
import 'package:flutter/material.dart';

class GameMaster extends StatefulWidget {
  @override
  _GameMasterState createState() => _GameMasterState();

  static DateTime gameTime = DateTime.utc(2019, 10, 30, 8);
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
    gameTime = DateTime.utc(
        gameTime.year, gameTime.month, gameTime.day, gameTime.hour + 1);
  }

  static String getTimeString() {
    String prefix = gameTime.hour >= 12 ? "pm " : "am ";
    String time = gameTime.hour >= 12
        ? (gameTime.hour - 12).toString()
        : (gameTime.hour).toString();
    return prefix + time.padLeft(2, "0");
  }

  static String getDateString() {
    return monthDisplay[gameTime.month] +
        ' - ${gameTime.day}'.padLeft(2, "0") +
        "日";
  }
}

class _GameMasterState extends State<GameMaster> {
  final Routing routing = Routing();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "M-NijimiMincho",
      ),
      initialRoute: "/",
      title: "Boukensha",
      routes: {
        "/": (context) => Loading(),
      },
      onGenerateRoute: routing.generateRoute,
    );
  }
}
