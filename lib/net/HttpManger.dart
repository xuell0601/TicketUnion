//CH
import 'package:dio/dio.dart';
import 'package:ticketunion/net/config.dart';


//使用get方法
Future getContent(url,{materialId,int page =0 }) async {
  try {
    print('开始获取首页数据...............');
    Response response;
    Dio dio = new Dio();
       if(materialId==null||page==null){
         response = await dio.get(url);
       }else{
         response = await dio.get(url,queryParameters: {"materialId":materialId , "page": page});
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


