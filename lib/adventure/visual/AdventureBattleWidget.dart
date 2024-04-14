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

import 'package:adventure/adventure/entity/BattleActionTarget.dart';
import 'package:adventure/adventure/entity/SelectedBattleAction.dart';
import 'package:adventure/adventure/game/GameMaster.dart';
import 'package:adventure/adventure/game/rule/Character.dart';
import 'package:adventure/adventure/util/ColorDefUtil.dart';
import 'package:adventure/adventure/util/StringDefUtil.dart';
import 'package:adventure/adventure/visual/AdventureAbstract.dart';
import 'package:adventure/adventure/entity/AdventureDescription.dart';
import 'package:adventure/adventure/PlayerProtocol.dart';
import 'package:adventure/adventure/visual/piece/ThemeAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdventureBattleWidget extends AdventureAbstract {
  static final AdventureDescription menuDescription = AdventureDescription();
  AdventureBattleWidget({@required AdventureDescription description}) {
    this.description.setValueFrom(description);
  }

  final List<String> skillList = [
    "ひたすらケルナグール",
    "ひたすらケルナグール",
    "ひたすらケルナグール",
    "ひたすらケルナグール",
    "ひたすらケルナグール",
    "ひたすらケルナグール",
    "ひたすらケルナグール",
    "ひたすらケルナグール",
    "ひたすらケルナグール",
    "ひたすらケルナグール",
  ];

  @override
  _AdventureBattleWidgetState createState() => _AdventureBattleWidgetState();
}

class _AdventureBattleWidgetState extends State<AdventureBattleWidget>
    with AdventureStateAbstract {
  @override
  void initState() {
    super.initState();
    this.description = this.widget.description;
  }

  double battleActionBarWidth = 200;
  double selectionWindowWidth = 400;

  static final String startPhase = "startPhase";
  static final String selectPhase = "selectPhase";
  static final String battlePhase = "battlePhase";
  static final String endPhase = "endPhase";

  static final String attackAction = "attackAction";

  String phase = "startPhase";
  String selectedAction = "";
  String selectedTarget = "";
  List<SelectedBattleAction> selectedBattleActions = [];

  int currentPlayerRow = 0;
  int currentPlayerCol = 0;

  @override
  Widget build(BuildContext context) {
    if (phase == startPhase) {
      /*
        check each player's conditions and continuous damage conditions
        decide which player can select its move or not.
        ex)player may struggle with paralysis or die from poison
      */
      Function f = () {
        setState(() {
          phase = selectPhase;
        });
      };
      selectedAction = "";
      currentPlayerRow = 0;
      currentPlayerCol = 0;

      return dummyPhaseWidget(f);
    } else if (phase == selectPhase) {
      /*
        each player select his/her action
      */
      bool inclementSuccess = true;

      if (StringDefUtil.isValid(selectedTarget)) {
        SelectedBattleAction sba = SelectedBattleAction();
        sba.player = PlayerProtocol.getParty()
            .partyMembers[currentPlayerRow][currentPlayerCol]
            .uniqueId;
        sba.action = selectedAction;
        sba.source = null;
        BattleActionTarget bat = BattleActionTarget();
        bat.targetId = [selectedTarget];
        sba.targetList = [bat];
        selectedAction = "";
        inclementSuccess = inclementCurrentPlayer();
      }
      List<List<Character>> partyMembers =
          PlayerProtocol.getParty().partyMembers;
      if (partyMembers[currentPlayerRow][currentPlayerCol] == null) {
        inclementSuccess = inclementCurrentPlayer();
      }
      
      if(inclementSuccess){
        return selectPhaseWidget(selectedAction);
      }
      Function f = () {
        setState(() {
          phase = battlePhase;
        });
      };
      return dummyPhaseWidget(f);
    } else if (phase == battlePhase) {
      /*
        calculate and show the result of the actions selected by all players
      */
      Function f = () {
        setState(() {
          phase = endPhase;
        });
      };
      return dummyPhaseWidget(f);
    } else {
      //end phase
      /*
        check if the battle is ended. 
        check result must be either "win" or "lose" or "continue".
      */
      Function f = () {
        setState(() {
          phase = startPhase;
        });
      };
      return dummyPhaseWidget(f);
    }
  }

  bool inclementCurrentPlayer() {
    if (currentPlayerCol + 1 <
        PlayerProtocol.getParty().partyMembers[0].length) {
      currentPlayerCol++;
      return true;
    } else if (currentPlayerRow + 1 <
        PlayerProtocol.getParty().partyMembers.length) {
      currentPlayerRow++;
      currentPlayerCol = 0;
      return true;
    }
    return false;
  }

  Widget dummyPhaseWidget(Function f) {
    Widget body = SizedBox.expand(
      child: Container(
        alignment: Alignment.center,
        color: Colors.red,
        child: FlatButton(
          onPressed: f,
          child: Text("Go To Next Phase",
              style: TextStyle(
                fontSize: 30,
              )),
        ),
      ),
    );
    Stack bodyStack = Stack(
      children: <Widget>[
        getMonsterLayer(),
        getPartyStatusCharts(),
        body,
        // getSelectionList(),
      ],
    );

    return Container(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          getBackGround(),
          // getCharacter(),//行動の指定をしているキャラクターの立ち絵が出るといいよね世○樹みたいに・・・
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: ThemeAppBar(
                iconType: description.iconType,
                disp_1: PlayerProtocol.getTimeString(),
                disp_2: "turn 01",
                disp_3: "Select Action"),
            body: bodyStack,
          ),
        ],
      ),
    );
  }

  Widget selectPhaseWidget(String action) {
    Widget battleActionBar;
    Widget monsterLayer;
    Widget partyStatusCharts;
    if (action == attackAction) {
      battleActionBar = Container();
      monsterLayer = getMonsterLayer(f: ({String id}) {
        setState(() {
          selectedTarget = id;
          selectedAction = attackAction;
        });
      });
      partyStatusCharts = getPartyStatusCharts();
    } else {
      battleActionBar = getBattleActionBar();
      monsterLayer = getMonsterLayer();
      partyStatusCharts = getPartyStatusCharts();
    }

    Stack bodyStack = Stack(
      children: <Widget>[
        monsterLayer,
        partyStatusCharts,
        battleActionBar,
        // getSelectionList(),
      ],
    );

    return Container(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          getBackGround(),
          // getCharacter(),//行動の指定をしているキャラクターの立ち絵が出るといいよね世○樹みたいに・・・
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: ThemeAppBar(
                iconType: description.iconType,
                disp_1: PlayerProtocol.getTimeString(),
                disp_2: "turn 01",
                disp_3: "Select Action"),
            body: bodyStack,
          ),
        ],
      ),
    );
  }

  Widget getMonsterLayer({Function f}) {
    List<Widget> enemyWidgetList = [];
    List<List<Character>> monsterList = GameMaster.enemy.partyMembers;
    for (int i = 0; i < monsterList.length; i++) {
      for (int j = 0; j < monsterList[i].length; j++) {
        enemyWidgetList.add(getMonster(monsterList[i][j], f));
      }
    }

    return SizedBox.expand(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: enemyWidgetList,
      ),
    );
  }

  Widget getMonster(
    Character c,
    Function f,
  ) {
    print('f:$f');
    // Function onPressed = f != null ? f(id:c.uniqueId) : f;
    // Function onPressed = (){};
    Function onPressed = () {
      setState(() {
        selectedTarget = c.uniqueId;
      });
    };
    return FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        hoverColor: Colors.green.withOpacity(0.8),
        highlightColor: Colors.yellow.withOpacity(0.8),
        onPressed: onPressed,
        padding: EdgeInsets.all(0.0),
        child: Image.asset(c.imageUrl));
  }

  Widget getBattleActionBar() {
    return Column(
      children: <Widget>[
        getBattleActionButton("attack"),
        getBattleActionButton("skill"),
        getBattleActionButton("defend"),
        getBattleActionButton("item"),
        getBattleActionButton("swap"),
        // getButton(""),
        getBattleActionButton("escape")
      ],
    );
  }

  Widget getBattleActionButton(String s) {
    Function f;
    if (s == "attack") {
      f = () {
        print('AttackSetState');
        setState(() {
          selectedAction = attackAction;
        });
      };
    }
    return Container(
      width: battleActionBarWidth,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: RaisedButton(
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(40), left: Radius.zero)),
        hoverColor: Colors.green.withOpacity(0.8),
        highlightColor: Colors.yellow.withOpacity(0.8),
        disabledColor: Colors.blueGrey.withOpacity(0.8),
        color: ColorDefUtil.clickableTextBGClor,
        onPressed: f,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.thumb_up,
              color: Colors.white,
              size: 26,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              s, //12 letter or 6 2byte Letter
              // textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelectionButton(String s) {
    return Container(
      padding: EdgeInsets.all(0),
      decoration: getBoxDecoreation(null),
      width: battleActionBarWidth,
      child: FlatButton(
        hoverColor: Colors.green.withOpacity(0.8),
        highlightColor: Colors.yellow.withOpacity(0.8),
        disabledColor: Colors.blueGrey.withOpacity(0.8),
        color: ColorDefUtil.clickableTextBGClor,
        onPressed: () {},
        child: Row(
          children: <Widget>[
            Icon(
              Icons.thumb_up,
              color: Colors.white,
              size: 26,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              s,
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelectionList() {
    double width = selectionWindowWidth;
    EdgeInsets ei = EdgeInsets.fromLTRB(battleActionBarWidth + 10, 0, 0, 0);
    return Column(
      children: <Widget>[
        Container(
          decoration: getBoxDecoreation(
              BorderRadius.vertical(top: Radius.circular(40))),
          margin: ei,
          width: width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text("Skill List",
                style: TextStyle(
                  fontSize: 18,
                  color: ColorDefUtil.textColor,
                )),
          ),
        ),
        Container(
          decoration: getBoxDecoreation(null),
          margin: ei,
          width: width,
          height: 300,
          child: ListView.builder(
            itemCount: this.widget.skillList.length,
            itemBuilder: (context, index) {
              if (StringDefUtil.isInvalid(this.widget.skillList[index])) {
                return SizedBox(
                  height: 0,
                );
              } else {
                return getSelectionButton(this.widget.skillList[index]);
              }
            },
          ),
        ),
        Container(
          decoration: getBoxDecoreation(
              BorderRadius.vertical(bottom: Radius.circular(40))),
          margin: ei,
          width: width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text("Scroll",
                style: TextStyle(
                  fontSize: 18,
                  color: ColorDefUtil.textColor,
                )),
          ),
        ),
      ],
    );
  }

  BoxDecoration getBoxDecoreation(BorderRadius borderRadius) {
    return BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 2,
        style: BorderStyle.solid,
      ),
      color: ColorDefUtil.menuAreaBackGround,
      borderRadius: borderRadius, //BorderRadius.circular(40)
    );
  }
}
