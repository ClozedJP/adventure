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
import 'package:adventure/adventure/entity/AdventureDescription.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String iconType;
  final String disp_1;
  final String disp_2;
  final String disp_3;
 
  ThemeAppBar({Key key,@required this.iconType,@required this.disp_1,@required this.disp_2,@required this.disp_3})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  ThemeAppBarState createState() => ThemeAppBarState(this);
}

class ThemeAppBarState extends State<ThemeAppBar> {
  String iconType;
  String disp_1;
  String disp_2;
  String disp_3;
  ThemeAppBarState(ThemeAppBar themeAppBar){
    this.iconType = themeAppBar.iconType;
    this.disp_1 = themeAppBar.disp_1;
    this.disp_2 = themeAppBar.disp_2;
    this.disp_3 = themeAppBar.disp_3;
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue[800].withOpacity(0.8),
      leading: Builder(
        builder: (context) {
          Icon icon;
          Function f;
          if (iconType == AdventureDescription.iconTypeBack) {
            icon = Icon(
              Icons.arrow_back,
            );
            f = () {
              Navigator.pop(context);
            };
          } else {
            icon = Icon(
              Icons.menu,
            );
            f = () {
              Scaffold.of(context).openDrawer();
            };
          }
          return Container(
            color: Colors.blue[900],
            child: IconButton(
              icon: icon,
              iconSize: 40,
              onPressed: () => f(),
            ),
          );
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.blueGrey[900].withOpacity(0.4),
            child: Text(
              disp_1,
              style: TextStyle(fontSize: 30),
            ),
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          ),
          Container(
            color: Colors.blueGrey[900].withOpacity(0.4),
            child: Text(
              disp_2,
              style: TextStyle(fontSize: 30),
            ),
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          ),
          Container(
            width: 500,
            color: Colors.blueGrey[900].withOpacity(0.4),
            child: Text(
              disp_3,
              style: TextStyle(fontSize: 30),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          ),
        ],
      ),
    );
  }
}

