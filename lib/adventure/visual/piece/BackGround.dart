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
import 'package:adventure/adventure/util/ColorDefUtil.dart';
import 'package:adventure/adventure/util/StringDefUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackGround extends StatefulWidget {
  final String imagePath;
  BackGround(String imagePath) : this.imagePath = imagePath;
  @override
  _BackGroundState createState() => _BackGroundState();
}

class _BackGroundState extends State<BackGround> {
  static String lastImagePath;
  @override
  build(BuildContext context) {
    String path;
    Container cover;
    if(StringDefUtil.isInvalid(this.widget.imagePath)){
      path = lastImagePath;
      cover = Container(color: ColorDefUtil.greyCoverColor,);
    }
    else{
      path = this.widget.imagePath;
      cover = Container();
    }

    if (StringDefUtil.isInvalid(path)) {
      return Container();
    }
    lastImagePath = path;
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minHeight: 720.0,
        minWidth: 1280.0,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(lastImagePath),
              fit: BoxFit.cover,
            )),
          ),
          cover,
        ],
      ),
    );
  }
}
