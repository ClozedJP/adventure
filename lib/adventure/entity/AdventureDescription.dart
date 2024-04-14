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

import 'package:adventure/adventure/entity/AdventureAction.dart';
import 'package:adventure/adventure/entity/CardGridViewItem.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AdventureDescription.g.dart';

@JsonSerializable()
class AdventureDescription {
  static final String iconTypeBack = "iconTypeBack";
  static final String iconTypeMenu = "iconTypeMenu";
  static final String iconTypeNone = "iconTypeNone";

  static final String bodyTypeActionBars = "actionBars";
  static final String bodyTypeCardGrid = "cardGrid";

  String key;
  String name;
  String iconType;
  String backGroundImagePath;
  String characterImagePath;
  String bodyType;
  List<AdventureAction> actionList;
  List<CardGridViewItem> gridItemList;
  //tooltip may added in future
  AdventureDescription({this.key,this.name,this.iconType,this.backGroundImagePath,this.characterImagePath,this.bodyType,this.actionList,this.gridItemList});
  void setValueFrom(AdventureDescription source){
    this.key = source.key;
    this.name = source.name;
    this.iconType = source.iconType;
    this.backGroundImagePath = source.backGroundImagePath;
    this.characterImagePath = source.characterImagePath;
    this.bodyType = source.bodyType;

    this.actionList = source.actionList;
    this.gridItemList = source.gridItemList;
  }

  factory AdventureDescription.fromJson(Map<String, dynamic> json) => _$AdventureDescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$AdventureDescriptionToJson(this);
  @override
  String toString(){
    return '{"class":"AdventureDescription","key":"$key","name":"$name","iconType":"$iconType","backGroundImagePath":"$backGroundImagePath","characterImagePath":"$characterImagePath","bodyType":"$bodyType","actionList":$actionList,"gridItemList":$gridItemList}\n';
  }
}