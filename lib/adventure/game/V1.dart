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

import 'package:adventure/adventure/AdventureWidget.dart';
import 'package:adventure/adventure/entity/AdventureAction.dart';
import 'package:adventure/adventure/entity/AdventureDescription.dart';
import 'package:adventure/adventure/entity/CardGridViewItem.dart';
import 'package:adventure/adventure/game/Loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class V1 {
  static Widget run() {
    String def = '{"ver":"2019-11-08","adventure_def":{';

    //メニューバー
    AdventureWidget.menuDescription.key = "Menu";
    AdventureWidget.menuDescription.name = "Menu";
    AdventureWidget.menuDescription.iconType = "None";
    AdventureWidget.menuDescription.backGroundImagePath = null;
    AdventureWidget.menuDescription.characterImagePath = null;
    AdventureWidget.menuDescription.actionList = [
      AdventureAction("status", "Status", AdventureAction.move),
      AdventureAction("item", "Item", AdventureAction.move),
      AdventureAction("option", "Option", AdventureAction.move),
      AdventureAction(null, null, null),
      AdventureAction("copyright", "Copyright", AdventureAction.move),
    ];

    def += '"menu":' + AdventureWidget.menuDescription.toString();

    def += ',"widgetList":[';

    //画面作成
    //1st decide which type of the Adventure Class.
    AdventureWidget theFirstTown = AdventureWidget(
      //2nd load the description
      description: AdventureDescription(
        key: "theFirstTown", //class key == AdventureAction.key
        name: "始まりの街",
        iconType: AdventureDescription.iconTypeMenu,
        backGroundImagePath: 'assets/image/background/theFirstTown.jpg',
        characterImagePath: null,
        bodyType: AdventureDescription.bodyTypeActionBars,
        //actionList must much the other Adventure Theme
        actionList: [
          AdventureAction("inn", "INN", AdventureAction.move),
          AdventureAction("shop", "SHOP", AdventureAction.move),
          AdventureAction("guild", "GUILD", AdventureAction.move),
          // AdventureAction("gate", "GATE", AdventureAction.move),
        ],
      ),
    );

    def += theFirstTown.description.toString();

    AdventureWidget inn = AdventureWidget(
        description: AdventureDescription(
      key: "inn",
      name: "宿屋さん",
      iconType: AdventureDescription.iconTypeMenu,
      backGroundImagePath: 'assets/image/background/inn.jpg',
      characterImagePath: 'assets/image/character/nightingale.png',
      bodyType: AdventureDescription.bodyTypeActionBars,
      actionList: [
        AdventureAction("stay", "STAY", AdventureAction.stay),
        AdventureAction("theFirstTown", "Town Square", AdventureAction.move),
      ],
    ));

    def += ',' + inn.description.toString();

    AdventureWidget shop = AdventureWidget(
        description: AdventureDescription(
      key: "shop",
      name: "武器防具屋さん",
      iconType: AdventureDescription.iconTypeMenu,
      backGroundImagePath: 'assets/image/background/shop.jpg',
      characterImagePath:
          'assets/image/character/nigaoe_pythagoras_pitagorasu.png',
      bodyType: AdventureDescription.bodyTypeActionBars,
      actionList: [
        AdventureAction("buy", "BUY", AdventureAction.buy),
        AdventureAction("sell", "SELL", AdventureAction.sell),
        AdventureAction("theFirstTown", "Town Square", AdventureAction.move),
      ],
    ));

    def += ',' + shop.description.toString();

    AdventureWidget guild = AdventureWidget(
      description: AdventureDescription(
        key: "guild",
        name: "冒険者ギルド",
        iconType: AdventureDescription.iconTypeMenu,
        backGroundImagePath: 'assets/image/background/guild.jpg',
        characterImagePath: 'assets/image/character/nigaoe_jean_of_arc.png',
        bodyType: AdventureDescription.bodyTypeActionBars,
        actionList: [
          AdventureAction("stay", "TALK", AdventureAction.talk),
          AdventureAction("theFirstTown", "Town Square", AdventureAction.move),
        ],
      ),
    );

    def += ',' + guild.description.toString();

    AdventureWidget gate = AdventureWidget(
      description: AdventureDescription(
        key: "gate",
        name: "門",
        iconType: AdventureDescription.iconTypeMenu,
        backGroundImagePath: 'assets/image/background/gate.jpg',
        characterImagePath:
            'assets/image/character/chusei_heishi_tetsukabuto.png',
        bodyType: AdventureDescription.bodyTypeActionBars,
        actionList: [
          AdventureAction("theFirstTown", "Town Square", AdventureAction.move),
        ],
      ),
    );

    def += ',' + gate.description.toString();

    AdventureWidget status = AdventureWidget(
      description: AdventureDescription(
        key: "status",
        name: "Status",
        iconType: AdventureDescription.iconTypeBack,
        backGroundImagePath: null,
        characterImagePath: 'assets/image/character/yuusya_game.png',
        bodyType: AdventureDescription.bodyTypeActionBars,
        actionList: null,
      ),
    );

    def += ',' + status.description.toString();

    AdventureWidget item = AdventureWidget(
      description: AdventureDescription(
        key: "item",
        name: "Item",
        iconType: AdventureDescription.iconTypeBack,
        backGroundImagePath: null,
        characterImagePath: 'assets/image/character/souji_gomibukuro.png',
        bodyType: AdventureDescription.bodyTypeActionBars,
        actionList: null,
      ),
    );

    def += ',' + item.description.toString();

    AdventureWidget option = AdventureWidget(
      description: AdventureDescription(
        key: "option",
        name: "Option",
        iconType: AdventureDescription.iconTypeBack,
        backGroundImagePath: null,
        characterImagePath: 'assets/image/character/kougu_bako.png',
        bodyType: AdventureDescription.bodyTypeActionBars,
        actionList: null,
      ),
    );

    def += ',' + option.description.toString();

    List<CardGridViewItem> gridItemList = [];
    gridItemList.add(CardGridViewItem(
        cardType: CardGridViewItem.cardTypeCopyRight,
        disp1: "This Game made by",
        disp2: "Clozed",
        url: "https://www."));
    gridItemList.add(CardGridViewItem(
        cardType: CardGridViewItem.cardTypeCopyRight,
        disp1: "This Game made with",
        disp2: "Flutter",
        url: "https://flutter.dev/"));
    gridItemList.add(CardGridViewItem(
        cardType: CardGridViewItem.cardTypeCopyRight,
        disp1: "Character Pictures made by",
        disp2: "いらすとや",
        url: "https://www.irasutoya.com/"));

    AdventureWidget copyright = AdventureWidget(
      description: AdventureDescription(
        key: "copyright",
        name: "Copyright",
        iconType: AdventureDescription.iconTypeBack,
        backGroundImagePath: null,
        characterImagePath: 'assets/image/character/copyright_text.png',
        bodyType: AdventureDescription.bodyTypeCardGrid,
        actionList: null,
        gridItemList: gridItemList,
      ),
    );

    def += ',' + copyright.description.toString() + ']';

    def += '}';

    print(def);

    Loading l = Loading();
    return (MaterialApp(
      theme: ThemeData(
        fontFamily: "M-NijimiMincho",
      ),
      initialRoute: "/",
      title: "adventure",
      routes: {
        "/": (context) => l,
        '${status.description.key}': (context) => status,
        '${item.description.key}': (context) => item,
        '${option.description.key}': (context) => option,
        '${copyright.description.key}': (context) => copyright,
        '${theFirstTown.description.key}': (context) => theFirstTown,
        '${inn.description.key}': (context) => inn,
        '${shop.description.key}': (context) => shop,
        '${guild.description.key}': (context) => guild,
        '${gate.description.key}': (context) => gate,
      },
    ));
  }
}
