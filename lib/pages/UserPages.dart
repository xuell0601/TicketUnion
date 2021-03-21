import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticketunion/model/TickModel.dart';

class UserPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserPagesState();
  }
}

class UserPagesState extends State<UserPages> {



  //创建头部对象
  Widget topHeader() {
    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.blueGrey,
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            height: ScreenUtil().setHeight(190),
            width: ScreenUtil().setWidth(190),
            child: ClipOval(
              child: Image.network(
                  "https://profile.csdnimg.cn/5/E/E/0_xueshao110"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "Android",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(30),
                  color: Colors.black,
                  fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
    );
  }

  //创建我的订单
  Widget orderTiTle() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(5),
      child: ListTile(
        leading: Icon(Icons.border_color),
        title: Text("我的订单"),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }

  //创建订单信息
  Widget orderType() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 3),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.schedule,
                  size: ScreenUtil().setWidth(60),
                ),
                Text("订单")
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[Icon(Icons.satellite), Text("订单")],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[Icon(Icons.shop), Text("订单")],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[Icon(Icons.card_membership), Text("订单")],
            ),
          ),
        ],
      ),
    );
  }

  //创建标题
  Widget ListTitles(String title) {
    return Container(
        margin: EdgeInsets.only(top: 1),
        color: Colors.white,
        child: ListTile(
          title: Text("${title}"),
          trailing: Icon(Icons.chevron_right),
        ));
  }

  //创建列表信息
  Widget actionList() {
    return Column(
      children: <Widget>[
        ListTitles("我的订单"),
        ListTitles("购物车"),
        ListTitles("优惠价"),
        ListTitles("我的订单"),
        ListTitles("购物车"),
        ListTitles("优惠价"),
        ListTitles("我的订单"),
        ListTitles("购物车"),
        ListTitles("优惠价"),
      ],
    );
  }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // postRequestFunction();
  }

  void postRequestFunction() async {
    print("开始post");
    String url="https://api.sunofbeach.net/shop/tpwd";
    ///创建Dio
    Dio dio = new Dio();
    var response = await dio.post(url, data: {"url": "https://uland.taobao.com/coupon/edetail?e=fovVJx7UXJoNfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoLEo2Pb6XDkeejt7bq5jL6fsgZ2vQCyVAUJNOhE9JKjp8uRTiT9oEhVZV8pr6FWc0N2CQ77mbhS9rXtT2pIF%2FCjmMHpNfYdHdBwWfUaU7r%2BdMHdg8oYVc%2FsB3IEI%2FtGZdTSBjM3vXy9T041UyeSsrqpDNJ7jXMyFwklM1ZJHcLCJg%3D%3D&&app_pvid=59590_33.42.169.154_955_1616304869558&ptl=floorId:9660;app_pvid:59590_33.42.169.154_955_1616304869558;tpp_pvid:c8368e44-8bba-434d-8add-1a25a3d89966&union_lens=lensId%3AMAPI%401616304869%40212aa99a_142e_17853471133_20e0%4001"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                });

    setState(() {
      var result = response.data.toString();
      TickModel tickModel =  TickModel.fromJson(response.data);
      print("yyyyPostyyy${tickModel.data.tbkTpwdCreateResponse.data.model}");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("会员中心"),
      ),
      body: Container(
        color: Colors.grey,
        child: ListView(
          children: <Widget>[
            topHeader(),
            orderTiTle(),
            orderType(),
            actionList()
          ],
        ),
      ),
    );
  }
}
