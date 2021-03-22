import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:ticketunion/widgets/update_dialog.dart';
///版本升级
class VersionUpgrade {
  String apkName;

// 获取apk存放地址(外部路径)
  Future<String> get _apkLocalPath async {
    final directory = await getExternalStorageDirectory();
    return directory.path;
  }

  /// 下载
  Future<void> executeDownload(url,apkName) async {
    final path = await _apkLocalPath;
    // var result = await Dio()
    //     .get(url)
    //     .catchError((e) {
    //   print('获取版本号失败==》' + e);
    // });
    // apkName = 'xxx' + result.toString() + '.apk';
    // File file = File(path + '/' + apkName);
    // if (await file.exists()) await file.delete();

    //下载
    final taskId = await FlutterDownloader.enqueue(
        url: url,
        savedDir: path,
        fileName: apkName,
        showNotification: true,
        openFileFromNotification: true);
    FlutterDownloader.registerCallback((id, status, progress) {

      // 当下载完成时，调用安装
      if (taskId == id && status == DownloadTaskStatus.complete) {
        _installApk();
      }
    });
  }

  ///安装app
  Future<Null> _installApk() async {
    String path = await _apkLocalPath;
    await OpenFile.open(path );
  }
}
