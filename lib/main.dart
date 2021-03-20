import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:ticketunion/provider/ChangeCate.dart';
import 'package:ticketunion/provider/Count.dart';
import 'package:ticketunion/tabview/MainTbaview.dart';


void main() {
            var changeCate=ChangeCate();
       var providers=Providers();
       providers
      ..provide(Provider<ChangeCate>.value(changeCate));
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
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),

      debugShowCheckedModeBanner: false,
      title: "sd",

      home: MainTabView(),
    );
  }
}
