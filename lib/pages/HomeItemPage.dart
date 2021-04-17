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
import 'package:ticketunion/route/Application.dart';
import 'package:ticketunion/widgets/CacheImageManger.dart';
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
  String catenames;
  GlobalKey<RefreshHeaderState> _headerKey =
  new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
  new GlobalKey<RefreshFooterState>();
  Widget _items(index,) {
    String src = "https:${goodData[index].pictUrl}";
    String url = "${goodData[index].couponShareUrl}";
    return Card(

        elevation: 15.0, //设置阴影
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0))),
        child: InkWell(
          onTap: (){
            Application.router.navigateTo(context,"/detail?id=${Uri.encodeComponent(url)}&src=${Uri.encodeComponent(src)}");
          },

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
                  child: CacheImageManger.CaheImage(src),
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

  Widget wrapList() {
    if (goodData.length != 0) {
      print("cccccccccccc${goodData.toString()}");
      List<Widget> list = goodData.map((item) {
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
                width: ScreenUtils.width(750),
                height: ScreenUtils.height(300),
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(bottom: ScreenUtils.height(2)),
                child:  Row(
                  children: <Widget>[
                    Container(
                      height: ScreenUtils.height(300),
                      width: ScreenUtils.width(350),
                      child: CacheImageManger.CaheImage(src,height: ScreenUtils.height(300),witdh:ScreenUtils.width(350) ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: ScreenUtils.height(300),
                      width: ScreenUtils.width(350),
                      child: Column(
                        mainAxisAlignment:  MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize:MainAxisSize.max ,
                        children: <Widget>[
                          Container(
                         height: ScreenUtils.height(100),
                        width: ScreenUtils.width(350),
                            child:Text(
                        "${item.title}",
                        maxLines: 2,
                        style: TextStyle(),
                      )
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: ScreenUtils.height(80),
                            width: ScreenUtils.width(350),
                            child: Container(
                              alignment: Alignment.center,
                              width: ScreenUtils.width(80),
                              height: ScreenUtils.height(50),
                              color: Colors.red,
                              child: Text("省20" ,style: TextStyle(
                                  color: Colors.white
                              ),),
                            ),
                          ),
                          Container(
                            height: ScreenUtils.height(80),
                            width: ScreenUtils.width(350),
                            child:  Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "${item.couponAmount}",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "卷后价:¥${item.couponAmount}",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              ],
                            ),
                          ),


                        ],
                      ),
                    )


                  ],
                ),
              ),
            ));
      }).toList();

      return Container(
        child: Wrap(
          spacing: 1,
          children: list,
        ),
      );
    } else {
      return Center(
        child: LoadingWidget(),
      );
    }
  }

   Widget Title(String title){
     return  Container(

        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        color: Colors.grey,
       child: Center(
         child:  Row(
           mainAxisAlignment: MainAxisAlignment.center
           ,
           children: <Widget>[
             Container(
               height: ScreenUtils.height(9),
               width: ScreenUtils.width(20),
              margin: EdgeInsets.only(right: ScreenUtils.size(10)),
             color: Colors.amber,
         ),
             Text(title,style: TextStyle(
                 fontSize: 20,
                 color: Colors.amber

             ),),
             Container(
               margin: EdgeInsets.only(left: ScreenUtils.size(10)),
               height: ScreenUtils.height(9),
               width: ScreenUtils.width(20),
               color: Colors.amber,
             ),
           ],
         ),
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
              Title(catenames),
              wrapList()

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

               goodId = childCategory.goodid;
              catenames= childCategory.catename;
                if(goodId==0){
                  return Container(
                    height: ScreenUtils.height(1330),
                    width: ScreenUtils.width(750),
                    child: LoadingWidget(),
                  );
                }else{
                   if(goodId!=lastgoodId){

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
    banner.clear();
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


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dddddddddddddddd滚动了dd");
  }
}

class SwiperDiy extends StatelessWidget {



   List swiperDataList=[];

  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(swiperDataList.length!=0){
      return Container(
        height: ScreenUtils.height(340),
        width: ScreenUtils.width(750),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            String src = "https:${swiperDataList[index].pictUrl}";

            return CacheImageManger.CaheImage(src,height: ScreenUtils.height(340));
          },
          itemCount: swiperDataList.length,
          pagination: new SwiperPagination(),
          autoplay: true,
          onTap: (index) {
            String src="https:${swiperDataList[index].pictUrl}";
            Application.router.navigateTo(context,"/detail?id=${Uri.encodeComponent(swiperDataList[index].couponShareUrl)}&src=${Uri.encodeComponent(src)}");
            print("${swiperDataList[index]}");
          },
        ),
      );
    }else{
      return Container(
        height: ScreenUtils.height(340),
        width: ScreenUtils.width(750),
        child: LoadingWidget(),
      );
    }


  }


}