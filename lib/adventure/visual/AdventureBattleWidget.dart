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
import 'package:adventure/adventure/entity/AdventureDescription.dart';
import 'package:adventure/adventure/PlayerProtocol.dart';
import 'package:adventure/adventure/visual/piece/MenuActionBars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdventureBattleWidget extends AdventureAbstract {
  //Clozed テストが終わったら消す
  static final AdventureDescription menuDescription = AdventureDescription();
  AdventureBattleWidget({@required AdventureDescription description}) {
    this.description.setValueFrom(description);
  }
  @override
  _AdventureBattleWidgetState createState() => _AdventureBattleWidgetState();
}

class _AdventureBattleWidgetState extends State<AdventureBattleWidget> with AdventureStateAbstract{
  @override
  void initState() {
    super.initState();
    this.description = this.widget.description;
  }
  @override
  Widget build(BuildContext context) {
    Widget body;
    if (this.description.bodyType == AdventureDescription.bodyTypeActionBars) {
      body = getActionBars(setState);
    } else if (this.description.bodyType ==
        AdventureDescription.bodyTypeCardGrid) {
      body = getCardGridView();
    }

    Stack bodyStack = Stack(
      children: <Widget>[
        getPartyStatusCharts(),
        body,
      ],
    );

    return Container(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          getBackGround(),
          getCharacter(),
          getMoneyContainer(),
          Scaffold(
            backgroundColor: Colors.transparent,
            drawer:
                MenuActionBars.fromDescription(AdventureBattleWidget.menuDescription),
            appBar: getAppBar(
                PlayerProtocol.getTimeString(), PlayerProtocol.getDateString()),
            body: bodyStack,
          ),
        ],
      ),
    );
  }
}
