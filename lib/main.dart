import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:ticketunion/tabview/MainTbaview.dart';


void main() {

       var providers=Providers();
      //  providers..provide(Provider<Count>.value(count))
      // ..provide(Provider<ChangeCate>.value(changeCate))
      // ;
     
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    final router = Router();


    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: "sd",

      home: MainTabView(),
    );
  }
}
