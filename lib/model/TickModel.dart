import 'Data.dart';

class TickModel {
  bool success;
  int code;
  String message;
  Data data;

  TickModel({this.success, this.code, this.message, this.data});

  TickModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  TbkTpwdCreateResponse tbkTpwdCreateResponse;

  Data({this.tbkTpwdCreateResponse});

  Data.fromJson(Map<String, dynamic> json) {
    tbkTpwdCreateResponse = json['tbk_tpwd_create_response'] != null
        ? new TbkTpwdCreateResponse.fromJson(json['tbk_tpwd_create_response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tbkTpwdCreateResponse != null) {
      data['tbk_tpwd_create_response'] = this.tbkTpwdCreateResponse.toJson();
    }
    return data;
  }
}

class TbkTpwdCreateResponse {
  Datas data;
  String requestId;

  TbkTpwdCreateResponse({this.data, this.requestId});

  TbkTpwdCreateResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Datas.fromJson(json['data']) : null;
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['request_id'] = this.requestId;
    return data;
  }
}

