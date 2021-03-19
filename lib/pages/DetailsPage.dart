import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class  DetailsPage extends StatelessWidget{
  DetailsPage(String goodsId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页面"),
      ),
      body: Text("详情页面"),
    );
  }


}