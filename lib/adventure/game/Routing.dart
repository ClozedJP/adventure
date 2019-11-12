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

import 'package:adventure/adventure/game/GameMaster.dart';
import 'package:adventure/adventure/game/Loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Routing {
  Map widgetMap;
  Widget initialItem;
  String lastRoute;
  Route<dynamic> generateRoute(RouteSettings settings) {
    if (widgetMap != null || settings == null || settings.arguments == null) {
    } else {
      Map arguments = settings.arguments;
      widgetMap = arguments["widgetMap"];
    }
    if (widgetMap == null) {
      return MaterialPageRoute(builder: (context) => Loading());
    }

    //Game Started
    {
      Map arguments = settings.arguments;
      //test code
      GameMaster.inclementTime();
      if (arguments != null && arguments["lostMoney"] != null) {
        GameMaster.party.wallet.currentMoney -= 500;
      }
    }

    print(settings.name);

    String routeName = settings.name;
    String routeType = "MaterialPageRoute";
    if (routeName == "refresh") {
      routeName = lastRoute;
      routeType = "RefreshPageRoute";
    }
    lastRoute = routeName;
    print("routeName:" + routeName);
    Widget target = widgetMap[routeName];
    if (initialItem == null) initialItem = target;
    if (target == null) {
      target = initialItem;
    }

    // return RefreshPageRoute(page: target);

    if (routeType == "RefreshPageRoute") {
      return RefreshPageRoute(page: target);
    } else {
      return GotoPageRoute(page: BlackScreen());
      // return MaterialPageRoute(builder: (context) => BlackScreen());
    }
  }
}

class RefreshPageRoute extends PageRouteBuilder {
  //https://api.flutter.dev/flutter/widgets/PageRouteBuilder-class.html
  final Widget page;
  final bool maintainState; //リーク対策とかするときは肝になりそう
  RefreshPageRoute({@required this.page, this.maintainState = false})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          // transitionsBuilder: (
          //   BuildContext context,
          //   Animation<double> animation,
          //   Animation<double> secondaryAnimation,
          //   Widget child,
          // ) => child ,
          maintainState: maintainState,
        );
}

class GotoPageRoute extends PageRouteBuilder {
  //https://api.flutter.dev/flutter/widgets/PageRouteBuilder-class.html
  final Widget page;
  final bool maintainState;
  GotoPageRoute({this.page, this.maintainState = false})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
          maintainState: maintainState,
          transitionDuration:Duration(milliseconds: 500),
        );
}

class BlackScreen extends StatefulWidget {
  @override
  _BlackScreenState createState() => _BlackScreenState();
}

class _BlackScreenState extends State<BlackScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.popAndPushNamed(context, "refresh");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}
