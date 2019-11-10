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
import 'package:adventure/adventure/util/StringDefUtil.dart';
import 'package:flutter/widgets.dart';

class CharacterImage extends StatefulWidget {
  final String imagePath;
  CharacterImage(String imagePath):this.imagePath = imagePath;
  @override
  _CharacterImageState createState() => _CharacterImageState(imagePath);
}

class _CharacterImageState extends State<CharacterImage> {
  String imagePath;
  _CharacterImageState(String imagePath):this.imagePath = imagePath;
  @override
   build(BuildContext context) {
    if (StringDefUtil.isInvalid(imagePath)) {
      return Container();
    } 
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        alignment: Alignment.bottomRight,
        image: AssetImage(imagePath),
        fit: BoxFit.contain,
      )),
    );
  }
}