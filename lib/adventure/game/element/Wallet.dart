import 'package:intl/intl.dart';

class Wallet {
  final formatter = NumberFormat("#,###");
  int maxMoney = 0x7FFFFFFF;//int max aka 2,147,483,647
  int currentMoney = 0;

  String getCurrentMoneyInFormat(){
    return formatter.format(currentMoney);
    
  }
}