


import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg){
  Fluttertoast.showToast(msg: msg,backgroundColor: Color(0xcc666666),textColor: Color(0xffffffff),fontSize: 12);
}