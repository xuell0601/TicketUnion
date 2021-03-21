
import 'package:dio/dio.dart';
import 'package:ticketunion/net/config.dart';

//使用get方法
Future getContent(url, {materialId = null, int page = null,keyword=null}) async {
  try {
    print('开始获取首页数据...............');
    Response response;
    Dio dio = new Dio();
    if (materialId == null && page == null&&keyword==null) {
      response = await dio.get(url);
      print("11111------99");
    } else {
      if (page != null&&materialId==null&&keyword==null) {
        print("2222222--------------------1");
        response = await dio.get(url + "/${page}");
        print("33333333--------------------2");
      } else if (page != null && materialId != null&&keyword==null) {
        print("44444444444--------------------3");
        response = await dio.get(url + "/${materialId}/${page}");
      }else if(page != null&&materialId==null&&keyword!=null){
        print("555555555555555--------------------5");
        response = await dio.get(url ,queryParameters: {"keyword":keyword, "page": page});
      }
    }
    print("============${response.data.toString()}");

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

Future  postRequestFunction(url) async {
  String relurl="https:${url}";
  print("开始post");
  try {
    //String url="https://api.sunofbeach.net/shop/tpwd";
    ///创建Dio
    Dio dio = new Dio();
    var response = await dio.post(Config.ticurl, data: {
      "url": "${relurl}"
    });

    print("============${response.data.toString()}");

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}
