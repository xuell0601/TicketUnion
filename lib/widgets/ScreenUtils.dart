import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 适配工具类

///

class ScreenUtils {
  static init(context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
  }

  static height(double value) {
    return ScreenUtil().setHeight(value);
  }

  static width(double value) {
    return ScreenUtil().setWidth(value);
  }

  static getScreenHeight() {
    return ScreenUtil().scaleHeight;
  }

  static getScreenWidth() {
    return ScreenUtil().scaleWidth;
  }

  //字体适配
  static size(double value) {
    return ScreenUtil().setSp(
      value,
    );
  }
}
