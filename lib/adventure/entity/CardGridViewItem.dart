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

import 'package:json_annotation/json_annotation.dart';

part 'CardGridViewItem.g.dart';

@JsonSerializable()
class CardGridViewItem {
  static final String cardTypeCopyRight = "cardTypeCopyRight";
  String cardType;
  String disp1;
  String disp2;
  String url;
  CardGridViewItem({this.cardType, this.disp1,this.disp2,this.url});
  factory CardGridViewItem.fromJson(Map<String, dynamic> json) => _$CardGridViewItemFromJson(json);
  Map<String, dynamic> toJson() => _$CardGridViewItemToJson(this);
  @override
  String toString(){
    return '{"class":"CardGridViewItem","cardType":"$cardType","disp1":"$disp1","disp2":"$disp2","url":"$url"}\n';
  }
}