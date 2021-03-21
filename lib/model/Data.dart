class Datas {
  String model;

  Datas({this.model});

  Datas.fromJson(Map<String, dynamic> json) {
    model = json['model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    return data;
  }
}