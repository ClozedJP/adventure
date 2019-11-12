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
import 'package:adventure/adventure/visual/piece/ActionBars.dart';
import 'package:adventure/adventure/visual/piece/BackGround.dart';
import 'package:adventure/adventure/visual/piece/CardGridView.dart';
import 'package:adventure/adventure/visual/piece/CharacterImage.dart';
import 'package:adventure/adventure/visual/piece/MoneyBar.dart';
import 'package:adventure/adventure/visual/piece/PartyStatusChart.dart';
import 'package:adventure/adventure/visual/piece/ThemeAppBar.dart';
import 'package:flutter/material.dart';

abstract class AdventureAbstract extends StatefulWidget{
  final AdventureDescription description = AdventureDescription();
}

abstract class AdventureStateAbstract {
  AdventureDescription description;
  ThemeAppBar getAppBar(String time,String day) {
    return ThemeAppBar(
      iconType: description.iconType,
      disp_1:time,
      disp_2:day,
      disp_3:description.name,
    );
  }

  Widget getBackGround() {
    return BackGround(description.backGroundImagePath);
  }

  Widget getCharacter() {
    return CharacterImage(description.characterImagePath);
  }

  Widget getActionBars(Function setState) {
    return ActionBars(description.actionList,setState);
  }

  Widget getCardGridView(){
    return CardGridView(description.gridItemList);
  }

  Widget getMoneyContainer() {
    return MoneyBar();
  }
  
  Widget getPartyStatusCharts() {
    return PartyStatusChart();
  }
}
