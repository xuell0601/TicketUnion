import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ticketunion/model/CateModel.dart';
import 'package:ticketunion/net/HttpManger.dart';
import 'package:ticketunion/net/config.dart';
import 'package:ticketunion/widgets/LoadingWidget.dart';
import 'package:ticketunion/widgets/ScreenUtils.dart';
import 'package:ticketunion/widgets/SearchWidget.dart';

class HomePages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePagesState();
  }
}

class HomePagesState extends State<HomePages>
    with AutomaticKeepAliveClientMixin {
  //使用下拉加载页面数据
  int page = 1;
  CateModel cateModel=null;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContent(Config.categories).then((data){
        setState(() {
                 cateModel = CateModel.fromJson(data);
                 print("----${cateModel.data[0].title}");
        });
    });

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: SearchWidget(),
        ),
      body: Container(
        height: ScreenUtils.height(100),
        child: Text("sd"),
      ),
    );

    //创建火爆专区的请求数据
  }

  @override

  bool get wantKeepAlive => true;
}

