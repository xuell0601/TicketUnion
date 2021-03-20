import 'package:flutter/material.dart';
class Count with ChangeNotifier {
  int num=0;
  void add(){
     num++;
     notifyListeners();
  }

}