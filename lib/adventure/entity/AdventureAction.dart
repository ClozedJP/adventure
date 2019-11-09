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

part 'AdventureAction.g.dart';

@JsonSerializable()
class AdventureAction {
  static final String move = "move";
  static final String goBack = "goBack";
  static final String buy = "buy";
  static final String talk = "talk";
  static final String stay = "stay";
  static final String sell = "sell";
  static final String custom = "custom";
  String key;
  String name;
  String actionType;
  //Icon and others will come;
  AdventureAction(String key, String name,String actionType ){
    this.key = key;
    this.name= name;
    this.actionType = actionType;
  }
  factory AdventureAction.fromJson(Map<String, dynamic> json) => _$AdventureActionFromJson(json);
  Map<String, dynamic> toJson() => _$AdventureActionToJson(this);

  @override
  String toString(){
    return '{"class":"AdventureAction","key":"$key","name":"$name","actionType":"$actionType"}\n';
  }
}