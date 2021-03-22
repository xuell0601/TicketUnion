import 'package:flutter/material.dart';
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticketunion/pages/CatePages.dart';
import 'package:ticketunion/pages/HomePages.dart';
import 'package:ticketunion/pages/SearchPage.dart';
import 'package:ticketunion/pages/SellPages.dart';
import 'package:ticketunion/pages/UserPages.dart';
import 'package:ticketunion/widgets/ScreenUtils.dart';

class MainTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainTabViewState();
  }
}

class MainTabViewState extends State<MainTabView> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: _currntIndex);
    //Bugly
    FlutterBugly.init(
      androidAppId: "617ee5227e"
    ).then((_result) {
      setState(() {
        _platformVersion = _result.message;
        print(_result.appId);
      });
    });
  }

  //创建页面
  final List<Widget> _PagesTab = [
    UserPages(),
    HomePages(),
    CatePages(),
    SellPages(),
    SearchPage(),
  ];

  //抽取底部组件
  final List<BottomNavigationBarItem> pages = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(Icons.category), title: Text("精选")),
    BottomNavigationBarItem(icon: Icon(Icons.shop), title: Text("特惠")),
     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("搜索")),
  ];

  int _currntIndex = 0;
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return Scaffold(
      body: Container(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          children: _PagesTab,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currntIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currntIndex,
        type: BottomNavigationBarType.fixed,
        items: pages,
        onTap: (value) {
          setState(() {
            _currntIndex = value;
            _pageController.jumpToPage(_currntIndex);
          });
        },
      ),
    );
  }
}
