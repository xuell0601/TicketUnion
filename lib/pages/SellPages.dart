import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:convert';
import 'package:provide/provide.dart';
import 'package:ticketunion/model/SellModel.dart';
import 'package:ticketunion/net/HttpManger.dart';
import 'package:ticketunion/net/config.dart';
import 'package:ticketunion/widgets/CacheImageManger.dart';
import 'package:ticketunion/widgets/LoadingWidget.dart';
import 'package:ticketunion/widgets/ScreenUtils.dart';
import 'package:ticketunion/route/Application.dart';
class SellPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SellPagesState();
  }
}

class SellPagesState extends State<SellPages>
    with AutomaticKeepAliveClientMixin {
  int pages = 0;
  SellModel sellModel = null;
  List<MapData> sellList = [];
  String https = "https:";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContent(Config.sell, page: pages).then((data) {
      setState(() {
        sellModel = SellModel.fromJson(data);
        sellList =
            sellModel.data.tbkDgOptimusMaterialResponse.resultList.mapData;
        pages++;
      });
    });
  }

  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  Widget wrapList() {
    if (sellList.length != 0) {
      print("cccccccccccc${sellList.toString()}");
      List<Widget> list = sellList.map((item) {
        String src = "https:${item.pictUrl}";
        String url = "${item.couponShareUrl}";
        return Card(
            elevation: 15.0, //设置阴影
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0))),
            child: InkWell(
              onTap: (){
                Application.router.navigateTo(context,"/detail?id=${Uri.encodeComponent(url)}&src=${Uri.encodeComponent(src)}");
              },
              child: Container(
                width: ScreenUtils.width(350),
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(bottom: ScreenUtils.height(2)),
                child: Column(
                  children: [
                    Container(
                      height: ScreenUtils.height(360),
                      width: ScreenUtils.width(350),
                      child: CacheImageManger.CaheImage(src),
                    ),
                    Text(
                      "${item.title}",
                      maxLines: 2,
                      style: TextStyle(),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "¥${item.couponStartFee}",
                            style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "卷后价:¥${item.couponAmount}",
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ));
      }).toList();

      return Container(
        child: Wrap(
          spacing: 2,
          children: list,
        ),
      );
    } else {
      return Container(
        height: ScreenUtils.height(1330),
        width: ScreenUtils.width(750),
        child: LoadingWidget(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("特惠"),
      ),
      body: Container(
        height: ScreenUtils.height(1334),
        width: ScreenUtils.width(750),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(1),
        child: EasyRefresh(
          refreshHeader: BezierCircleHeader(
            key: _headerKey,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          refreshFooter: BezierBounceFooter(
            key: _footerKey,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: ListView(
            children: <Widget>[wrapList()],
          ),
          onRefresh: () async {},
          loadMore: () async {
            getContent(Config.sell, page: pages).then((data) {
              sellModel = SellModel.fromJson(data);
              sellList = sellModel
                  .data.tbkDgOptimusMaterialResponse.resultList.mapData;
              setState(() {
                sellList.addAll(sellList);
                pages++;
              });
            });
          },
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
