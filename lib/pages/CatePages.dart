import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CatePages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CatePagesState();
  }
}

class CatePagesState extends State<CatePages>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("分类"),
        ),
        body: Container(
            child: Row(
          children: [
            //左侧导航栏的创建
            Text("分类")

          ],
        )));
  }

  @override
  bool get wantKeepAlive => true;
}




