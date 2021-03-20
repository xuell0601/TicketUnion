import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:ticketunion/model/RecomGoodModel.dart';
import 'package:ticketunion/net/HttpManger.dart';
import 'package:ticketunion/net/config.dart';
import 'package:ticketunion/provider/ChangeCate.dart';
import 'package:ticketunion/widgets/ScreenUtils.dart';

import 'LoadingWidget.dart';

class RightContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RightContentState();
  }
}

class RightContentState extends State<RightContent> {
  int goodId = 0;
  List<Map> data = [];
  List childrens = [];
  int leftIndex = 0;
  int pageIndex = 0;
  List<MapData> mapData;
  int lastgoodId;

  Widget _items(index, children) {
    String src="https:${mapData[index].pictUrl}";

    return Card(
        elevation: 15.0,  //设置阴影
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
        child:  InkWell(
          child: Container(
            width: ScreenUtils.width(500),
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: ScreenUtils.height(2)),
            child: Column(
              children: [
                Container(
                  height: ScreenUtils.height(360),
                  width: ScreenUtils.width(350),
                  child: Image.network(src),
                ),

                Text("${mapData[index].title}",
                  maxLines: 2,
                  style: TextStyle(

                  ),),

                Row(children: <Widget>[


                  Expanded(child: Text("${mapData[index].shopTitle}",
                    style: TextStyle(
                        color: Colors.red,

                    ),
                  ),),
                  Expanded(
                    child:Text("卷后价:¥${mapData[index].couponAmount}",
                      style: TextStyle(
                          color: Colors.red
                      ),

                    ) ,
                  )
                ],)

              ],
            ),
          ),
        )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

      return Expanded(
        child: Provide<ChangeCate>(
          // ignore: missing_return
          builder: (context, child, childCategory) {
            leftIndex = childCategory.leftindex;
            pageIndex = childCategory.pageindex;
            goodId = childCategory.goodid;

            if (goodId != 0) {
                 if(goodId!=lastgoodId){
                    lastgoodId=goodId;
                    getContent(Config.recomgoods, page: goodId).then((goodItem) {
                      RecomGoodModel recomGoodModel =
                      RecomGoodModel.fromJson(goodItem);
                      setState(() {
                        mapData = recomGoodModel
                            .data.tbkDgOptimusMaterialResponse.resultList.mapData;

                      });
                    });
                    if(mapData!=null){
                      return Container(
                        width: ScreenUtils.width(500),
                        margin: EdgeInsets.fromLTRB(ScreenUtils.width(5),
                            ScreenUtils.width(5), ScreenUtils.width(5), 0),
                        child: ListView.builder(
                            itemCount: mapData.length,
                            itemBuilder: (context, index) {
                              return _items(index, mapData);
                            }),
                      );
                    }else{

                      return LoadingWidget();;
                    }

                 }else{
                   if(mapData!=null&&mapData.length!=0){
                     return Container(
                       width: ScreenUtils.width(500),
                       margin: EdgeInsets.fromLTRB(ScreenUtils.width(5),
                           ScreenUtils.width(5), ScreenUtils.width(5), 0),
                       child: ListView.builder(
                           itemCount: mapData.length,
                           itemBuilder: (context, index) {
                             return _items(index, mapData);
                           }),
                     );
                   }
                 }

              }else {
              return LoadingWidget();
            }

          },
        ),
      );

  }
}
