import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provide/provide.dart';
import 'package:ticketunion/model/GoodModel.dart';
import 'package:ticketunion/net/HttpManger.dart';
import 'package:ticketunion/net/config.dart';
import 'package:ticketunion/provider/ChangeGood.dart';
import 'package:ticketunion/widgets/LoadingWidget.dart';
import 'package:ticketunion/widgets/ScreenUtils.dart';
class HomeItemPage extends StatefulWidget {

   int goodId;
  HomeItemPage(goodsId){
    this.goodId=goodId;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeItemPageState();
  }


}

class HomeItemPageState extends State<HomeItemPage> with AutomaticKeepAliveClientMixin{
  int goodId = 0;
  List<Map> data = [];
  List childrens = [];
  int leftIndex = 0;
  int pageIndex = 0;
  var goodData =[];
  int lastgoodId;
  int page=0;
  List banner=[];

  GlobalKey<RefreshHeaderState> _headerKey =
  new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
  new GlobalKey<RefreshFooterState>();
  Widget _items(index,) {
    String src = "https:${goodData[index].pictUrl}";

    return Card(

        elevation: 15.0, //设置阴影
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0))),
        child: InkWell(
          child: Container(
            width: ScreenUtils.width(500),
            height: ScreenUtils.width(500),
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: ScreenUtils.height(2)),
            child:  Row(
              children: <Widget>[
                Container(
                  height: ScreenUtils.height(300),
                  width: ScreenUtils.width(350),
                  child: Image.network(src),
                ),
                Container(
                  height: ScreenUtils.height(300),
                  width: ScreenUtils.width(350),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "${goodData[index].title}",
                        maxLines: 1,
                        style: TextStyle(),
                      ),
                      Expanded(
                        child: Text(
                          "${goodData[index].shopTitle}",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "卷后价:¥${goodData[index].couponAmount}",
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    ],
                  ),
                )


              ],
            ),
          ),
        ));
  }

   Widget Title(String title){
     return  Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
       child: Center(
         child:  Text(title,style: TextStyle(
            fontSize: 20
         ),),
       ),
     );
   }

    Widget  _listViews(){


      return   EasyRefresh(
          refreshHeader: BezierCircleHeader(
            key: _headerKey,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          refreshFooter: BezierBounceFooter(
            key: _footerKey,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child:ListView(

            children: <Widget>[
              SwiperDiy(swiperDataList:banner),
              Title("商品"),
              Container(
                height: ScreenUtils.width(1330),
                width: ScreenUtils.width(750),
                child:    ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: goodData.length,
                    itemBuilder: (context,index){
                      return _items(index);
                    }),
              )
            ],
          ),
          onRefresh: () async {},
          loadMore: () async {}
      ) ;
    }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
          body: Provide<ChangeGood>(
            // ignore: missing_return
            builder: (context, child, childCategory) {
              // leftIndex = childCategory.leftindex;
              // pageIndex = childCategory.pageindex;
               goodId = childCategory.goodid;

                if(goodId==0){
                  return Text("控制");
                }else{
                   if(goodId!=lastgoodId){
                     banner.clear();
                     loadData(goodId,  page);
                     return Container(

                        child:  _listViews(),
                     );
                   }else{
                     return Container(

                       child:  _listViews(),
                     );
                   }

                }


            },
          ),
    );
  }
  void loadData(int goodid, int page) {
    getContent(Config.good,materialId: goodid
        ,page: page).then((data) {
      setState(() {
        var  goodModel = GoodModel.fromJson(data);
        goodData=goodModel.data;
        lastgoodId=goodId;
             for(var i=0;i<5;i++){

                 banner.add(goodData[i]);
               }



        page++;
        print("yyyyyyyyyyyyy${goodData.toString()}");
      });
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.height(340),
      width: ScreenUtils.width(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          String src = "https:${swiperDataList[index].pictUrl}";
          return Image.network(
              src,
              fit: BoxFit.fill,height: ScreenUtils.height(340),);
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
        onTap: (index) {
          print("${swiperDataList[index]}");
        },
      ),
    );
  }
}