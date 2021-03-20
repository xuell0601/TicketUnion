import 'package:flutter/material.dart';
import 'package:ticketunion/model/GoodModel.dart';
class ChangeGood with ChangeNotifier{
  List<Data> children=[];
  int pageindex=0;

  int goodid;
  getCateData(List<Data> children){
    this.children=children;
   notifyListeners();
  }
   setGoodId(id){
    this.goodid=id;
    notifyListeners();
   }

  onClick(index){
    this.pageindex=index;
  notifyListeners();
  }

}