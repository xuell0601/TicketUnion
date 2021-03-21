import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provide/provide.dart';

import 'package:ticketunion/model/SearchModel.dart';
import 'package:ticketunion/net/HttpManger.dart';
import 'package:ticketunion/net/config.dart';
import 'package:ticketunion/provider/ChangeCate.dart';
import 'package:ticketunion/provider/ChangeSear.dart';
import 'package:ticketunion/route/Application.dart';
import 'package:ticketunion/widgets/LoadingWidget.dart';
import 'package:ticketunion/widgets/ScreenUtils.dart';
import 'package:ticketunion/widgets/SharedPrefrcneUtils.dart';
import 'package:ticketunion/widgets/ToastUtil.dart';


class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  SearchModel searchModel;
  List<MapData> mapData=[];
  bool isload=false;
  int indexPage=0;
  GlobalKey<RefreshHeaderState> _headerKey =
  new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
  new GlobalKey<RefreshFooterState>();
  var textcontroller= new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getData();

  }

  String _keyWords;
  var _historyListData = [];

  Widget _getWraps(String value) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color.fromRGBO(233, 233, 233, 0.9),
          borderRadius: BorderRadius.circular(30)),
      child: Text(value),
    );
  }

  Widget _getTiTle(context, value) {
    return Container(

      child: Text("${value}", style: Theme.of(context).textTheme.title),
    );
  }

  _getData() async {
    var data = await SharedPrefrcneUtils.getHistoryList();
    setState(() {
      this._historyListData = data;
    });
  }

  Widget _historyListWidget() {
    if (_historyListData.length > 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(

            child: Text("历史记录", style: Theme.of(context).textTheme.title),
          ),
          Divider(),
          Column(
            children: this._historyListData.map((value) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text("${value}"),
                    onLongPress: () {
                      this._showAlertDialog("${value}");
                    },
                    onTap: (){
                      setState(() {
                        _keyWords= value;
                        _loadData();
                      });

                      print("fffffffff${value}");
                    },
                  ),
                  Divider()
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  SharedPrefrcneUtils.clearHistoryList();
                  this._getData();
                },
                child: Container(
                  width: ScreenUtils.width(400),
                  height: ScreenUtils.height(64),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Icon(Icons.delete), Text("清空历史记录")],
                  ),
                ),
              )
            ],
          )
        ],
      );
    } else {
      return Text("");
    }
  }

  _showAlertDialog(keywords) async {
    var result = await showDialog(
        barrierDismissible: false, //表示点击灰色背景的时候是否消失弹出框
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示信息!"),
            content: Text("您确定要删除吗?"),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  print("取消");
                  Navigator.pop(context, 'Cancle');
                },
              ),
              FlatButton(
                child: Text("确定"),
                onPressed: () async {
                  //注意异步
                  await SharedPrefrcneUtils.removeHistoryData(keywords);
                  this._getData();
                  Navigator.pop(context, "Ok");
                },
              )
            ],
          );
        });

    //  print(result);
  }
   _loadData(){
    getContent(Config.search, keyword:_keyWords,page: indexPage).then((data){
      setState(() {
        SearchModel searchMode=SearchModel.fromJson(data);
         mapData= searchMode.data.tbkDgMaterialOptionalResponse.resultList.mapData;
        Provide.value<ChangeSear>(context).setIsScroll(true);
      });

      print("gggggggggg${data.toString()}");
    });
  }

  Widget wrapList() {
    if (mapData.length != 0) {
      print("cccccccccccc${mapData.toString()}");
      List<Widget> list = mapData.map((item) {
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
                      child: Image.network(src),
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: TextField(

            onChanged: (value) {
              this._keyWords = value;
            },
            autofocus: true,
            controller: textcontroller,
            decoration: InputDecoration(
                icon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none, //去除底线
                  borderRadius: BorderRadius.circular(30),
                )),
          ),
          height: ScreenUtils.height(72),
          padding: EdgeInsets.only(left: 10, bottom: ScreenUtils.height(5)),
          decoration: BoxDecoration(
            color: Color.fromRGBO(233, 233, 233, 0.9),
            borderRadius: BorderRadius.circular(30),
          ),

        ),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: null,
          // ),
          InkWell(
            onTap: () {
              setState(() {


                SharedPrefrcneUtils.setHistoryData(this._keyWords);
                // Navigator.pushReplacementNamed(context, '/productList',
                //     arguments: {"keywords": this._keywords});
                if(_keyWords!=null){
                  _loadData();
                }else{
                  ToastUtil.showToast("输入不能为空");
                }

              });
            },
            child: Container(
              height: ScreenUtils.height(80),
              width: ScreenUtils.width(80),
              child: Row(
                children: <Widget>[Text("搜索")],
              ),
            ),
          )
        ],
      ),

      body: Provide<ChangeSear>(
    // ignore: missing_return
    builder: (context, child, childCategory) {
     isload= childCategory.scroll;
     print("eeeeeeeeeeeeeeeeee${isload}");
     if(isload){
       Provide.value<ChangeSear>(context).setIsScroll(false);
       return  EasyRefresh(
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

               wrapList()

             ],
           ),
           onRefresh: () async {},
           loadMore: () async {}
       );
     }else{
       return Container(

         padding: EdgeInsets.all(10),
         child: ListView(
           children: <Widget>[

             _getTiTle(context, "热搜"),
             Divider(),
             Wrap(
               children: <Widget>[
                 _getWraps("电脑"),
                 _getWraps("笔记本"),
                 _getWraps("鼠标"),
                 _getWraps("女装"),
                 _getWraps("女装"),
                 _getWraps("女装"),
                 _getWraps("女装"),
               ],
             ),
             _getTiTle(context, "历史"),
             Divider(),
             _historyListWidget()
           ],
         ),
       );
     }


    }),
    );


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isload=false;

    print("rrrrrrrrrrrrrrr${isload}");
  }

}
