import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import 'package:ticketunion/model/RecomModel.dart';
import 'package:ticketunion/net/HttpManger.dart';
import 'package:ticketunion/net/config.dart';
import 'package:ticketunion/provider/ChangeCate.dart';
import 'package:ticketunion/widgets/LoadingWidget.dart';
import 'package:ticketunion/widgets/RightContent.dart';
class CatePages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CatePagesState();
  }
}

class CatePagesState extends State<CatePages>
    with AutomaticKeepAliveClientMixin {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContent(Config.recom_cate).then((data){

      setState(() {
        RecomModel recomModel = RecomModel.fromJson(data);

        print("aaaaaaaaaaaaa特惠数据 ${recomModel.data.toString()}");
      });
    });
  }
  var scrollController= new ScrollController();
  int lastindx=0;
  //创建item列表



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("精选"),

      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              //左侧导航栏的创建
              LeftNav(),
              Column(
                children: <Widget>[

                  RightContent()

                ],
              )
            ],
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

//创建左侧导航条
class LeftNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LeftNavState();
  }
}

class LeftNavState extends State<LeftNav> {
  // List<Message> message = [];
  // CateModel CateModels = null;
  //
  int lastindex=0;
  List<Data> leftdatas=[];
  @override
  void initState() {
    super.initState();
    //请求数据分类数据
    getCate();
    //传值


  }

  void getCate() async {
    await getContent(Config.recom_cate).then((value) {
      setState(() {
                   var recomModel = RecomModel.fromJson(value);
                   leftdatas = recomModel.data;
         Provide.value<ChangeCate>(context).setGoodId(leftdatas[lastindex].favoritesId);

      });
    });
  }



  // 左侧导航栏的创建
  Widget leftInkell(index) {


    return Container(
      color: lastindex==index?Colors.lightBlue:Colors.white,
      child: InkWell(
        onTap: (){
          setState(() {
            lastindex=index;
            var child=leftdatas[index].favoritesId;
            Provide.value<ChangeCate>(context).setGoodId(child);
            // Provide.value<ChangeCate>(context).onLeftClick(lastindex);
            // Provide.value<ChangeCate>(context).onClick(0);
          });

        },

        child: Container(
          height: ScreenUtil().setHeight(100),
          padding: EdgeInsets.fromLTRB(
              ScreenUtil().setHeight(30), ScreenUtil().setHeight(30), 0, 0),
          decoration: BoxDecoration(
              color: Colors.black12,
              border:
              Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          child: Text(
            "${leftdatas[index].favoritesTitle}",
            style: TextStyle(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return leftInkell(index);
        },
        itemCount: leftdatas.length,
      ),
    );
  }
}




