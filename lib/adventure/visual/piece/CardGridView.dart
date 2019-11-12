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

import 'dart:html' as html;//url_launcher is not supporting web yet.

import 'package:adventure/adventure/entity/CardGridViewItem.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CardGridView extends StatefulWidget {
  final List<CardGridViewItem> itemList;
  CardGridView(List<CardGridViewItem> itemList) : this.itemList = itemList;
  @override
  _CardGridView createState() => _CardGridView();
}

class _CardGridView extends State<CardGridView> {
  double maxExtent = 500;
  double childAspectRatio = 1.654;
  double getEstimatedGridHieght() {
    return maxExtent / childAspectRatio;
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget.itemList == null || this.widget.itemList.isEmpty) {
      return Container();
    }
    return GridView.extent(
      maxCrossAxisExtent: maxExtent,
      childAspectRatio: 1.654,
      padding: EdgeInsets.all(20),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: getGridTileList(),
    );
  }

  List<Widget> getGridTileList() {
    List<Widget> list = [];
    for (int i = 0; i < this.widget.itemList.length; i++) {
      list.add(getCopyRightCard(this.widget.itemList[i]));
    }
    return list;
  }

  Card getCopyRightCard(CardGridViewItem cardGridItem) {
    return Card(
        color: Colors.white.withOpacity(0.85),
        child: Column(
          children: <Widget>[
            Expanded(flex: 1, child: SizedBox(height: 10)),
            Text(
              cardGridItem.disp1,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 10),
            Text(
              cardGridItem.disp2,
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: maxExtent * 0.8,
              child: FlatButton.icon(
                onPressed: (() {
                  if(kIsWeb){
                    html.window.open(cardGridItem.url,cardGridItem.url);
                  }                  
                }),
                label: Text(
                  cardGridItem.url,
                  overflow: TextOverflow.clip,
                  maxLines: 4,
                ),
                icon: Icon(Icons.web),
              ),
            ),
            Expanded(flex: 1, child: SizedBox(height: 10)),
          ],
        ));
  }
}
