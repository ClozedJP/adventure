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
import 'package:adventure/adventure/entity/AdventureAction.dart';
import 'package:adventure/adventure/util/ColorDefUtil.dart';
import 'package:flutter/material.dart';

class ActionBars extends StatefulWidget {
  final List<AdventureAction> actionList;
  final Function setStateFromParent;
  ActionBars(List<AdventureAction> actionList,Function setStateFromParent) : this.actionList = actionList,this.setStateFromParent = setStateFromParent;
  @override
  _ActionBarsState createState() => _ActionBarsState();
}

class _ActionBarsState extends State<ActionBars> {
  @override
  Widget build(BuildContext context) {
    if (this.widget.actionList == null || this.widget.actionList.isEmpty) {
      return Container();
    }

    return Container(
      width: 300,
      child: ListView.builder(
        itemCount: this.widget.actionList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return SizedBox(
              height: 60,
            );
          } else {
            int i = index - 1;
            if (this.widget.actionList[i].key == null || this.widget.actionList[i].key.isEmpty) {
              return SizedBox(
                height: 60,
              );
            } else {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                color: ColorDefUtil.clickableTextBGClor,
                child: ListTile(
                  leading: Icon(
                    Icons.apps,
                    color: ColorDefUtil.textColor,
                    size: 40,
                  ),
                  title: Text(this.widget.actionList[i].name,
                      style: TextStyle(
                        fontSize: 30,
                        color: ColorDefUtil.textColor,
                      )),
                  onTap: () {
                    if (this.widget.actionList[i].actionType == AdventureAction.move) {
                      Navigator.pushNamed(
                          context, '${this.widget.actionList[i].key}');
                      // Navigator.pushNamed(context, '${actionList[i].key}');
                    }
                    // else if(actionList[i].actionType == AdventureAction.buy){

                    // }
                    // else if(actionList[i].actionType == AdventureAction.sell){

                    // }
                    else {
                      // Navigator.pushNamed(context,"refresh",arguments: {"lostMoney":true});
                      // callbackでコンポーネントのリフレッシュを行う機能がほしい
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                        '${this.widget.actionList[i].actionType}は準備中',
                        style: TextStyle(fontSize: 80),
                      )));
                    }
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}
