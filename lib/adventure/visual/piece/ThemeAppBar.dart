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
import 'package:adventure/adventure/util/ColorDefUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String iconType;
  final String disp_1;
  final String disp_2;
  final String disp_3;

  ThemeAppBar(
      {Key key,
      @required this.iconType,
      @required this.disp_1,
      @required this.disp_2,
      @required this.disp_3})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  ThemeAppBarState createState() => ThemeAppBarState();
}

class ThemeAppBarState extends State<ThemeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorDefUtil.menuAreaBackGround,
      automaticallyImplyLeading:false,
      leading: getAppbarLeading(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: ColorDefUtil.unClickableTextBGColor,
            child: getText(this.widget.disp_1),
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          ),
          Container(
            color: ColorDefUtil.unClickableTextBGColor,
            child: getText(this.widget.disp_2),
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          ),
          Expanded(
            child: Container(
              color: ColorDefUtil.unClickableTextBGColor,
              child: getText(this.widget.disp_3),
              alignment: Alignment.center,
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            ),
          ),
        ],
      ),
    );
  }
  
  Builder getAppbarLeading(){
    if(this.widget.iconType == AdventureDescription.iconTypeNone)return null;
    return Builder(
      builder: (context) {
        if (this.widget.iconType == AdventureDescription.iconTypeBack)
          return null;
        Icon icon;
        Function f;
        if (this.widget.iconType == AdventureDescription.iconTypeBack) {
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
    );
  }

  Widget getText(String string) {
    return Text(
      string,
      style: TextStyle(
        fontSize: 30,
        color: Colors.white,
      ),
    );
  }
}
