import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticketunion/model/TickModel.dart';
import 'package:ticketunion/net/HttpManger.dart';
import 'package:ticketunion/widgets/CacheImageManger.dart';
import 'package:ticketunion/widgets/ClipboardUtil.dart';
import 'package:ticketunion/widgets/LoadingWidget.dart';
import 'package:ticketunion/widgets/ScreenUtils.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  String url;
  String src;

  DetailsPage(String goodsId, String src) {
    this.url = goodsId;
    this.src = src;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailsPageState(url, src);
  }
}

class DetailsPageState extends State<DetailsPage> {
  String url;
  String src;
  List items = [];
  TickModel tickModel;
  TbkTpwdCreateResponse tbkTpwdCreateResponse;

  DetailsPageState(this.url, this.src);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postRequestFunction(url).then((v) {
      setState(() {
        tickModel = TickModel.fromJson(v);
        tbkTpwdCreateResponse = tickModel.data.tbkTpwdCreateResponse;
      });
    });
  }

  Widget headerItem() {
    if (tickModel != null) {
      if (tbkTpwdCreateResponse != null) {
        return Column(
          children: <Widget>[


            Container(
              height: ScreenUtils.height(500),
              width: ScreenUtils.width(500),
              margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
              child: CacheImageManger.CaheImage(src),
            ),
            //
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
              child: Text(
                "${tbkTpwdCreateResponse.data.model}",
                maxLines: 3,
              ),
            ),

            Container(
              alignment: Alignment.center,
              height: ScreenUtils.height(100),
              width: ScreenUtils.width(300),
              color: Colors.amber,
              child: InkWell(
                onTap: () {
                  // Fluttertoast.showToast(
                  //     msg: "=======",
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.BOTTOM,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Colors.black45,
                  //     textColor: Colors.white,
                  //     fontSize: 16.0);
                  ClipboardUtil.setDataToast(
                      "${tbkTpwdCreateResponse.data.model}");
                  _launchURL();
                },
                child: Text("复制淘口令"),
              ),
            )
          ],
        );
      } else {
        return Container(
          height: ScreenUtils.height(1330),
          width: ScreenUtils.width(750),
          child: LoadingWidget(),
        );
      }
    } else {
      return Container(
        height: ScreenUtils.height(1330),
        width: ScreenUtils.width(750),
        child: LoadingWidget(),
      );
    }
  }

  _launchURL() async {
    String url = "taobao://item.taobao.com/item.html?id=41700658839";

    if (await canLaunch(url)) {
      // 判断当前手机是否安装某app. 能否正常跳转
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页面"),
      ),
      body: Container(
        height: ScreenUtils.width(1330),
        width: ScreenUtils.width(750),
        child: headerItem(),
      ),
    );
  }
}
