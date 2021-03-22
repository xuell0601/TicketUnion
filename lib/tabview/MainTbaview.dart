import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ticketunion/pages/CatePages.dart';
import 'package:ticketunion/pages/HomePages.dart';
import 'package:ticketunion/pages/SearchPage.dart';
import 'package:ticketunion/pages/SellPages.dart';
import 'package:ticketunion/pages/UserPages.dart';
import 'package:ticketunion/widgets/ScreenUtils.dart';
import 'package:ticketunion/widgets/ToastUtil.dart';
import 'package:ticketunion/widgets/VersionUpgrade.dart';
import 'package:ticketunion/widgets/update_dialog.dart';
import 'package:file_utils/file_utils.dart';
class MainTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainTabViewState();
  }
}

class MainTabViewState extends State<MainTabView> {
  String _platformVersion = 'Unknown';
  GlobalKey<UpdateDialogState> _dialogKey = new GlobalKey();
  ///当前进度进度百分比  当前进度/总进度 从0-1
  double currentProgress =0.0;
  ///下载文件的网络路径
  String apkUrl ="";
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
    if (mounted) _checkUpgrade();
  }
  Widget _buildDialog(String version, String url, bool isForceUpgrade) {
    return WillPopScope(
        onWillPop: () async => isForceUpgrade,
        child: UpdateDialog(
          key: _dialogKey,
          version: version,
          onClickWhenDownload: (_msg) {
            //提示不要重复下载
          },
          onClickWhenNotDownload: () {
            //下载apk，完成后打开apk文件，建议使用dio+open_file插件
            print("------------开始下载${url}--");
            downApkFunction(url,version);

          },
        ));
  }

  void _updateProgress(_progress) {
    setState(() {
      _dialogKey.currentState.progress = _progress;
    });
  }


  Future<String> get _apkLocalPath async {

    final directory = await getExternalStorageDirectory();
    return directory.path;
  }

  ///使用dio 下载文件
  void downApkFunction(String url,version) async{
    /// 申请写文件权限
    bool isPermiss =  await checkPermissFunction();
    if(isPermiss) {
      ///手机储存目录
      print("----------手机储存目录--开始下载--${url}");
      final path = await _apkLocalPath;

     String dirloc = "/sdcard/download/";
      FileUtils.mkdir([dirloc]);
      print("-------222---手机储存目录--开始下载--${isPermiss}");
      ///创建DIO
      Dio dio = new Dio();
      print("-------333---手机储存目录-${path}-开始下载--${url}");
      ///参数一 文件的网络储存URL
      ///参数二 下载的本地目录文件
      ///参数三 下载监听
      ///var randid = random.nextInt(10000);
      final _random = new Random().nextInt(10000);
    String   savepath=dirloc + _random.toString() + ".apk";
      try{
        Response response = await dio.download(
            url, savepath, onReceiveProgress: (received, total) {
          print("--------4444--手机储存目录--开始下载--${isPermiss}");
          if (total != -1) {
            ///当前下载的百分比例
            print((received / total * 100).toStringAsFixed(0) + "%");
            // CircularProgressIndicator(value: currentProgress,) 进度 0-1
            //currentProgress = received / total;
            setState(() {
              currentProgress = received / total;
              print("---------5555---当前进度为--${currentProgress}");
              _updateProgress(currentProgress);
            });
          }
        });
        print("-------6666---手机储存目录-${response.data.toString()}");
        if(response.data!=null){
          _installApk(savepath);
          print("-----------5777-当前进度为--${response.data.toString()}");
        }
      }catch(e){
        print("-----------9999-当前进度为--${e}");

      }


    }else{
      ///提示用户请同意权限申请
      ///
      ToastUtil.showToast("没有权限");
    }
  }


  checkPermissFunction() async {
    if (Theme.of(context).platform == TargetPlatform.android) {
      ///安卓平台中 checkPermissionStatus方法校验是否有储存卡的读写权限
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        ///无权限那么 调用方法 requestPermissions 申请权限
        Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.storage]);
        ///校验用户对权限申请的处理
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }
  Future<String> getPhoneLocalPath() async {
    final directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory.path;
  }
  ///安装app
  Future<Null> _installApk(String dirloc) async {
    String path = dirloc;
    print("-----------88-当前进度为--${path}");
    await OpenFile.open(path);
  }

  void _showUpdateDialog(String version, String url, bool isForceUpgrade) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => _buildDialog(version, url, isForceUpgrade),
    );
  }
  void _checkUpgrade() {
    print("获取更新中。。。");
    FlutterBugly.checkUpgrade().then((UpgradeInfo info) {
      if (info != null && info.id != null) {
        print("-------------${info.title}---${info.apkUrl}");
        _showUpdateDialog(info.newFeature, info.apkUrl, info.upgradeType == 2);
      }else{
        print("-------------${info.toString()}---");
        //ToastUtil.showToast("in");
      }
    });
  }

  //创建页面
  final List<Widget> _PagesTab = [

    HomePages(),
    CatePages(),
    SellPages(),
    SearchPage(),
  ];

  //抽取底部组件
  final List<BottomNavigationBarItem> pages = [

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
