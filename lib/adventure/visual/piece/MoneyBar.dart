import 'package:adventure/adventure/PlayerProtocol.dart';
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
                width: 400,
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  color: Colors.blue[900].withOpacity(0.9),
                  child: ListTile(
                    leading:  Icon(
                      Icons.euro_symbol,
                      color: Colors.white,
                      size: 40,
                    ),
                    title: Text(PlayerProtocol.getParty().wallet.getCurrentMoneyInFormat(),
                    textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
          ]
          ),
    );
  }
}