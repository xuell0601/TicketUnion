import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:ticketunion/provider/ChangeCate.dart';
import 'package:ticketunion/provider/ChangeGood.dart';
import 'package:ticketunion/provider/ChangeSear.dart';
import 'package:ticketunion/tabview/MainTbaview.dart';
import 'package:flutter_bugly/flutter_bugly.dart';
import 'route/Application.dart';
import 'route/Routes.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
void main() =>FlutterBugly.postCatchedException((){


    var changeCate = ChangeCate();
    var changeGood=ChangeGood();
    var providers = Providers();
    var changeSear=ChangeSear();
    providers..provide(Provider<ChangeCate>.value(changeCate))
      ..provide(Provider<ChangeGood>.value(changeGood))
      ..provide(Provider<ChangeSear>.value(changeSear));

    runApp(ProviderNode(child: MyApp(), providers: providers));
    //FlutterBugly.init(androidAppId: "617ee5227e");

});
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String debugLable = 'Unknown';
  final JPush jpush = new JPush();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;


    // Platform messages may fail, so we use a try/catch PlatformException.
    jpush.getRegistrationID().then((rid) {
      setState(() {
        debugLable = "flutter getRegistrationID: $rid";
      });
    });
    jpush.setup(
      appKey: "e9be531d83d97818cee2e583",
      channel: "theChannel",
      production: false,
      debug: true,
    );

    try {

      jpush.addEventHandler(
        onReceiveNotification: (Map<String, dynamic> message) async {
          print("flutter onReceiveNotification: $message");
          setState(() {
            debugLable = "flutter onReceiveNotification: $message";
          });
        },
        onOpenNotification: (Map<String, dynamic> message) async {
          print("flutter onOpenNotification: $message");
          setState(() {
            debugLable = "flutter onOpenNotification: $message";
          });
        },
        onReceiveMessage: (Map<String, dynamic> message) async {
          print("flutter onReceiveMessage: $message");
          setState(() {
            debugLable = "flutter onReceiveMessage: $message";
          });
        },
      );

    } on Exception {
      platformVersion = 'Failed to get platform version.';
    }

  }

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


