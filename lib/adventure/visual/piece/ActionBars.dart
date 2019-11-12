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
import 'package:adventure/adventure/PlayerProtocol.dart';
import 'package:adventure/adventure/entity/AdventureAction.dart';
import 'package:adventure/adventure/game/Loading.dart';
import 'package:flutter/material.dart';

class ActionBars extends StatefulWidget {
  final List<AdventureAction> actionList;
  ActionBars(List<AdventureAction> actionList) : this.actionList = actionList;
  @override
  _ActionBarsState createState() => _ActionBarsState(actionList);
}

class _ActionBarsState extends State<ActionBars> {
  List<AdventureAction> actionList;
  _ActionBarsState(List<AdventureAction> actionList)
      : this.actionList = actionList;
  @override
  Widget build(BuildContext context) {
    if (actionList == null || actionList.isEmpty) {
      return Container();
    }

    return Container(
      width: 300,
      child: ListView.builder(
        itemCount: actionList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return SizedBox(
              height: 60,
            );
          } else {
            int i = index - 1;
            if (actionList[i].key == null || actionList[i].key.isEmpty) {
              return SizedBox(
                height: 60,
              );
            } else {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                color: Colors.blue[900].withOpacity(0.9),
                child: ListTile(
                  leading: Icon(
                    Icons.apps,
                    color: Colors.white,
                    size: 40,
                  ),
                  title: Text(actionList[i].name,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      )),
                  onTap: () {
                    if (actionList[i].actionType == AdventureAction.move) {
                      Navigator.pushNamed(
                          context, '${actionList[i].key}');
                      // Navigator.pushNamed(context, '${actionList[i].key}');
                    }
                    // else if(actionList[i].actionType == AdventureAction.buy){

                    // }
                    // else if(actionList[i].actionType == AdventureAction.sell){

                    // }
                    else {
                      Navigator.pushNamed(context,"refresh",arguments: {"lostMoney":true});
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                        '${actionList[i].actionType}は準備中',
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
