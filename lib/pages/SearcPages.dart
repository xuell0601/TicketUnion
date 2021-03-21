import 'package:flutter/material.dart';
class SearcPages extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearcPagesState();
  }


}

class  SearcPagesState extends State<SearcPages>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("搜搜"),
      ),
    );
  }
}