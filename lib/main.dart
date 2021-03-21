import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:ticketunion/provider/ChangeCate.dart';
import 'package:ticketunion/provider/ChangeGood.dart';
import 'package:ticketunion/provider/ChangeSear.dart';
import 'package:ticketunion/tabview/MainTbaview.dart';

import 'route/Application.dart';
import 'route/Routes.dart';

void main() {
  var changeCate = ChangeCate();
  var changeGood=ChangeGood();
  var providers = Providers();
  var changeSear=ChangeSear();
  providers..provide(Provider<ChangeCate>.value(changeCate))
  ..provide(Provider<ChangeGood>.value(changeGood))
    ..provide(Provider<ChangeSear>.value(changeSear));

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
    Routes.configureRoutes(router);
    Application.router=router;

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      title: "sd",
      home: MainTabView(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
