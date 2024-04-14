import 'package:adventure/adventure/PlayerProtocol.dart';
import 'package:adventure/adventure/game/rule/Character.dart';
import 'package:adventure/adventure/util/ColorDefUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartyStatusChart extends StatefulWidget {
  @override
  _PartyStatusChartState createState() => _PartyStatusChartState();
}

class _PartyStatusChartState extends State<PartyStatusChart> {
  double cardWidth = 360;
  double cardHeight = 100;
  @override
  Widget build(BuildContext context) {
    List<List<Character>> partyMembers = PlayerProtocol.getParty().partyMembers;
    List<Widget> playerRows = [];
    for (int i = 0; i < partyMembers.length; i++) {
      List<Widget> rowList = [];
      for (int j = 0; j < partyMembers[i].length; j++) {
        if (partyMembers[i][j] != null) {
          rowList.add(getPlayerStatusChart(partyMembers[i][j]));
        }
      }
      Row row = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowList,
      );
      playerRows.add(row);
    }

    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: playerRows,
      ),
    );
  }

  Widget getPlayerStatusChart(Character character) {
    String hp = character.currentHP.toString();
    String sp = character.currentResource1.toString();
    String firstName = character.firstName;

    return Container(
      margin: EdgeInsets.all(4),
      width: cardWidth,
      height: cardHeight,
      decoration: getBoxDecoreation(),
      child: FlatButton(
        onPressed: null, //Clozed 後々キャラクターを指定するときとかに使いたい
        child: Column(
          children: <Widget>[
            Expanded(flex: 1, child: SizedBox()),
            Row(
              children: <Widget>[
                Expanded(flex: 1, child: SizedBox()),
                Icon(
                  Icons.thumb_up,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  firstName, //12 letter or 6 2byte Letter
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                Expanded(flex: 2, child: SizedBox()),
              ],
            ),
            getRow(hp, sp),
            Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
    );
  }

  Text getHpText(String string) {
    return Text(
      string,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 28,
        color: ColorDefUtil.hitpointColor,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    );
  }

  Text getSpText(String string) {
    return Text(
      string,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 28,
        color: ColorDefUtil.skillpointColor,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    );
  }

  Row getRow(String hp, String sp) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              getHpText("HP:"),
              Expanded(flex: 1, child: SizedBox()),
              getHpText(hp),
            ],
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              getSpText("SP:"),
              Expanded(flex: 1, child: SizedBox()),
              getSpText(sp),
            ],
          ),
        ),
      ],
    );
  }

  BoxDecoration getBoxDecoreation() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 4,
        style: BorderStyle.solid,
      ),
      color: ColorDefUtil.clickableTextBGClor,
      borderRadius: BorderRadius.circular(40),
    );
  }
}
