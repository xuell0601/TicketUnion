import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ticketunion/model/CateModel.dart';
import 'package:ticketunion/net/HttpManger.dart';
import 'package:ticketunion/net/config.dart';

class HomePages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
    //getHot();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("重新加载");
    return Scaffold(
        appBar: AppBar(
          title: Text("sd"),
        ),
      body: ListView.builder(
          itemCount: cateModel.data.length,
          itemBuilder: (context,index){
          return Text("${cateModel.data[index].title}");
      }),
    );

    //创建火爆专区的请求数据
  }

  @override

  bool get wantKeepAlive => true;
}

