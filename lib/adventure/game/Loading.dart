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

import 'dart:convert';

import 'package:adventure/adventure/AdventureWidget.dart';
import 'package:adventure/adventure/entity/AdventureDescription.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupInitialCondition() async {
    Map widgetMap = {};

    String defString = await rootBundle.loadString("assets/data/testDef20191108.json");
    Map def = jsonDecode(defString);
    print("--- Loading adventure_def ---");
    print("version:" + def["version"]);
    Map adventureDef = def["adventureDef"];
    //Menu
    AdventureWidget.menuDescription.setValueFrom(AdventureDescription.fromJson(adventureDef["menu"]));

    //Themes
    List widgetList = adventureDef["widgetList"];
    
    for(Map m in widgetList){
      AdventureDescription ad = AdventureDescription.fromJson(m);
      widgetMap[ad.key] = AdventureWidget(description: ad);
    }
    print("--- Loading complete ---");

    Navigator.popAndPushNamed(context, adventureDef["initialRoute"],arguments: {"widgetMap" : widgetMap});
  }

  @override
  void initState() {
    super.initState();
    setupInitialCondition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 100.0,
          ),
        ));
  }
}
