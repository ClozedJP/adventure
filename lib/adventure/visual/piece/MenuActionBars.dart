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
import 'package:adventure/adventure/visual/AdventureAbstract.dart';
import 'package:adventure/adventure/entity/AdventureAction.dart';
import 'package:adventure/adventure/entity/AdventureDescription.dart';
import 'package:adventure/adventure/util/StringDefUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuActionBars extends AdventureAbstract {
  MenuActionBars({
    @required String key,
    @required String name,
    @required String iconType,
    String backGroundImagePath,
    String characterImagePath,
    List<AdventureAction> actionList,
  }) {
    description.key = key;
    description.name = name;
    description.iconType = iconType;
    description.backGroundImagePath = backGroundImagePath;
    description.characterImagePath = characterImagePath;
    description.actionList = actionList;
  }
  MenuActionBars.fromDescription(AdventureDescription description) {
    this.description.setValueFrom(description);
  }
  @override
  _MenuActionBarsState createState() => _MenuActionBarsState(description);
}

class _MenuActionBarsState extends State<MenuActionBars>
    with AdventureStateAbstract {
  _MenuActionBarsState(AdventureDescription description) {
    this.description = description;
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.grey[200].withOpacity(0.85),
      ),
      child: Drawer(
        child: Container(
          child: ListView.builder(
            itemCount: description.actionList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blueGrey[900].withOpacity(0.9),
                  child: Text(
                    description.name,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                );
              } else {
                int i = index - 1;
                if (StringDefUtil.isInvalid(description.actionList[i].key)) {
                  return SizedBox(
                    height: 60,
                  );
                } else {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    color: Colors.blue[900],
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                            context, '${description.actionList[i].key}',);
                      },
                      title: Text(description.actionList[i].name,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          )),
                      leading: Icon(
                        Icons.apps,
                        color: Colors.grey[300],
                        size: 40,
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
