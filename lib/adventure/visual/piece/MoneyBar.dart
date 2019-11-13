import 'package:adventure/adventure/PlayerProtocol.dart';
import 'package:adventure/adventure/util/ColorDefUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoneyBar extends StatefulWidget {
  @override
  _MoneyBarState createState() => _MoneyBarState();
}

class _MoneyBarState extends State<MoneyBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              SizedBox(
                height: 60,
              ),
              Container(
                width: 300,
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  color: ColorDefUtil.unClickableTextBGColor,
                  child: ListTile(
                    leading:  Icon(
                      Icons.euro_symbol,
                      color: ColorDefUtil.textColor,
                      size: 36,
                    ),
                    title: Text(PlayerProtocol.getParty().wallet.getCurrentMoneyInFormat(),
                    textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 36,
                          color: ColorDefUtil.textColor,
                        )),
                  ),
                ),
              ),
          ]
          ),
    );
  }
}