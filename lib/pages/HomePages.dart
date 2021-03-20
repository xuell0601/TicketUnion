import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provide/provide.dart';
import 'package:ticketunion/model/CateModel.dart';
import 'package:ticketunion/model/GoodModel.dart';
import 'package:ticketunion/net/HttpManger.dart';
import 'package:ticketunion/net/config.dart';
import 'package:ticketunion/provider/ChangeCate.dart';
import 'package:ticketunion/provider/ChangeGood.dart';
import 'package:ticketunion/widgets/LoadingWidget.dart';
import 'package:ticketunion/widgets/ScreenUtils.dart';
import 'package:ticketunion/widgets/SearchWidget.dart';

import 'HomeItemPage.dart';

class HomePages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePagesState();
  }
}

class HomePagesState extends State<HomePages>
    with TickerProviderStateMixin{
  //使用下拉加载页面数据
  var cate=[];
  int page = 0;
  int goodid=0;
  CateModel cateModel = null;
      TabController tabController;
  var goodData =[];
  @override
  void initState() {
    // TODO: implement initState
    tabController=  new TabController(
        length: 0,
        vsync: this
    );
    super.initState();

    getContent(Config.categories).then((data) {
      var cateModel = CateModel.fromJson(data);
      tabController=  new TabController(
          length: cateModel.data.length,
          vsync: this
      )..addListener((){
        //print("uuuuuuuu${tabController.index}");
        Provide.value<ChangeGood>(context).setGoodId(cate[tabController.index].id);
      });


      setState(() {
        cateModel = CateModel.fromJson(data);
         cate=cateModel.data;
        goodid=cate[0].id;
        Provide.value<ChangeGood>(context).setGoodId(goodid);
        //loadData(goodid,page);
        print("----${cateModel.data[0].title}");
      });
    });
  }

  Widget topTab(){
    return   Container(

      padding: EdgeInsets.only(top:10),
      child: TabBar(
        onTap: (index){
          setState(() {
              goodid=cate[index].id;
              Provide.value<ChangeGood>(context).setGoodId(goodid);
          });

        },

        labelPadding: EdgeInsets.fromLTRB(10,0, 10, 0),
        controller: tabController,
        isScrollable: true,
        labelColor: Colors.black,
        tabs: cate.map((v){
          return Tab(text: "${v.title}",

          );
        }).toList(),


      ),
    );
  }

  Widget ContextItem(){
    return Flexible(
      child:  TabBarView(
        controller: tabController,
        children: cate.map((v){
          return HomeItemPage(0);
        }).toList(),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchWidget(),
      ),
      body: Column(
        children: <Widget>[
          topTab(),
          ContextItem()
        ],
      )
    );


  }

  @override
  bool get wantKeepAlive => true;


}
