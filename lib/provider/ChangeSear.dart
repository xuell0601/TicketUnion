import 'package:flutter/material.dart';
import 'package:ticketunion/model/SearchModel.dart';

class ChangeSear with ChangeNotifier{
  List<Data> children=[];
  int pageindex=0;
  String catename;
  int goodid;
  bool scroll=false;
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
   notifyListeners();
   }

  onClick(index){
    this.pageindex=index;
  notifyListeners();
  }
  setIsScroll(bool isScroll){
    this.scroll=isScroll;
  }

}