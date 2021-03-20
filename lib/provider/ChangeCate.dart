import 'package:flutter/material.dart';
import 'package:ticketunion/model/RecomModel.dart';

class ChangeCate with ChangeNotifier{
  List<Data> children=[];
  int pageindex=0;
  int leftindex=0;
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
  onLeftClick(index){
    this.leftindex=index;
    notifyListeners();
  }
}