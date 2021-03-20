class RecomModel {
  bool success;
  int code;
  String message;
  List<Data> data;

  RecomModel({this.success, this.code, this.message, this.data});

  RecomModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int type;
  int favoritesId;
  String favoritesTitle;

  Data({this.type, this.favoritesId, this.favoritesTitle});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    favoritesId = json['favorites_id'];
    favoritesTitle = json['favorites_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['favorites_id'] = this.favoritesId;
    data['favorites_title'] = this.favoritesTitle;
    return data;
  }
}