import 'package:flutter/material.dart';

import 'package:provide/provide.dart';


class ShopPages extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return ShopPagesState();
  }

}
class ShopPagesState extends State<ShopPages>{
  @override
  Widget build(BuildContext context) {

     return Scaffold(
       appBar: AppBar(
         title: Text("购物车"),
       ),
       body: Column(
         children: [
            Text("购物车")
         ],
       ),
     );
  }

}



