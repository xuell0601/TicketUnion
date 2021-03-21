import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
class ToastUtil{
  static void showToast(String s) {

    Fluttertoast.showToast(
        msg: "${s}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0);


  }

}