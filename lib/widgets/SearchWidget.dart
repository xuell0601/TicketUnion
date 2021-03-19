import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ScreenUtils.dart';
class SearchWidget  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
          padding: EdgeInsets.all(5),
          height: ScreenUtils.height(100),
          width: ScreenUtils.width(750),
          child: Row(

            children: <Widget>[
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: (){
                    print("扫码");
                  },
                  child: Icon(Icons.filter_center_focus),),
              ),

              Expanded(
                flex: 10,
                child: InkWell(
                  onTap: (){
                    print("搜送");
                  },
                  child: Container(
                    height: 48,
                    width:ScreenUtils.width(600),
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:  BorderRadius.circular(20.0)
                    ),
                    child: Text("输入是",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: ScreenUtils.size(40)
                             
                    ),),
                  ),
                ),

              ),

              Expanded(
                flex: 1,
                child:InkWell(
                  onTap: (){
                    print("点击");
                  },
                  child:  Container(
                    padding: EdgeInsets.only(right: 30),
                    child: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
    );
  }

}