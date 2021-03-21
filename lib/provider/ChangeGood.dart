import 'package:flutter/material.dart';
import 'package:ticketunion/model/GoodModel.dart';
class ChangeGood with ChangeNotifier{
  List<Data> children=[];
  int pageindex=0;
  String catename;
  int goodid;
  bool scroll;
  getCateData(List<Data> children){
    this.children=children;
   notifyListeners();
  }
   setGoodId(id){
    this.goodid=id;
    notifyListeners();
   }

   setCateName(String name){
   this.catename=name;
   }

  onClick(index){
    this.pageindex=index;
  notifyListeners();
  }
  setIsScroll(bool isScroll){
    this.scroll=isScroll;
  }

}