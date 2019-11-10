import 'package:adventure/adventure/game/Loading.dart';
import 'package:adventure/adventure/game/Routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Adventure extends StatefulWidget {
  @override
  _AdventureState createState() => _AdventureState();
}

class _AdventureState extends State<Adventure> {
  final Routing routing = Routing();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "M-NijimiMincho",
      ),
      initialRoute: "/",
      title: "adventure",
      routes: {
        "/": (context) => Loading(),
      },
      onGenerateRoute: routing.generateRoute,
    );
  }
}