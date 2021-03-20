class SellModel {
  bool success;
  int code;
  String message;
  Data data;

  SellModel({this.success, this.code, this.message, this.data});

  SellModel.fromJson(Map<String, dynamic> json) {
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
  TbkDgOptimusMaterialResponse tbkDgOptimusMaterialResponse;

  Data({this.tbkDgOptimusMaterialResponse});

  Data.fromJson(Map<String, dynamic> json) {
    tbkDgOptimusMaterialResponse =
    json['tbk_dg_optimus_material_response'] != null
        ? new TbkDgOptimusMaterialResponse.fromJson(
        json['tbk_dg_optimus_material_response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tbkDgOptimusMaterialResponse != null) {
      data['tbk_dg_optimus_material_response'] =
          this.tbkDgOptimusMaterialResponse.toJson();
    }
    return data;
  }
}

class TbkDgOptimusMaterialResponse {
  String isDefault;
  ResultList resultList;
  String requestId;

  TbkDgOptimusMaterialResponse(
      {this.isDefault, this.resultList, this.requestId});

  TbkDgOptimusMaterialResponse.fromJson(Map<String, dynamic> json) {
    isDefault = json['is_default'];
    resultList = json['result_list'] != null
        ? new ResultList.fromJson(json['result_list'])
        : null;
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_default'] = this.isDefault;
    if (this.resultList != null) {
      data['result_list'] = this.resultList.toJson();
    }
    data['request_id'] = this.requestId;
    return data;
  }
}

class ResultList {
  List<MapData> mapData;

  ResultList({this.mapData});

  ResultList.fromJson(Map<String, dynamic> json) {
    if (json['map_data'] != null) {
      mapData = new List<MapData>();
      json['map_data'].forEach((v) {
        mapData.add(new MapData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mapData != null) {
      data['map_data'] = this.mapData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MapData {
  int categoryId;
  Null categoryName;
  String clickUrl;
  String commissionRate;
  int couponAmount;
  String couponClickUrl;
  String couponEndTime;
  Null couponInfo;
  int couponRemainCount;
  String couponShareUrl;
  String couponStartFee;
  String couponStartTime;
  int couponTotalCount;
  String itemDescription;
  int itemId;
  int levelOneCategoryId;
  String levelOneCategoryName;
  String nick;
  String pictUrl;
  int sellerId;
  Null shopTitle;
  SmallImages smallImages;
  String title;
  int userType;
  int volume;
  String zkFinalPrice;

  MapData(
      {this.categoryId,
        this.categoryName,
        this.clickUrl,
        this.commissionRate,
        this.couponAmount,
        this.couponClickUrl,
        this.couponEndTime,
        this.couponInfo,
        this.couponRemainCount,
        this.couponShareUrl,
        this.couponStartFee,
        this.couponStartTime,
        this.couponTotalCount,
        this.itemDescription,
        this.itemId,
        this.levelOneCategoryId,
        this.levelOneCategoryName,
        this.nick,
        this.pictUrl,
        this.sellerId,
        this.shopTitle,
        this.smallImages,
        this.title,
        this.userType,
        this.volume,
        this.zkFinalPrice});

  MapData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    clickUrl = json['click_url'];
    commissionRate = json['commission_rate'];
    couponAmount = json['coupon_amount'];
    couponClickUrl = json['coupon_click_url'];
    couponEndTime = json['coupon_end_time'];
    couponInfo = json['coupon_info'];
    couponRemainCount = json['coupon_remain_count'];
    couponShareUrl = json['coupon_share_url'];
    couponStartFee = json['coupon_start_fee'];
    couponStartTime = json['coupon_start_time'];
    couponTotalCount = json['coupon_total_count'];
    itemDescription = json['item_description'];
    itemId = json['item_id'];
    levelOneCategoryId = json['level_one_category_id'];
    levelOneCategoryName = json['level_one_category_name'];
    nick = json['nick'];
    pictUrl = json['pict_url'];
    sellerId = json['seller_id'];
    shopTitle = json['shop_title'];
    smallImages = json['small_images'] != null
        ? new SmallImages.fromJson(json['small_images'])
        : null;
    title = json['title'];
    userType = json['user_type'];
    volume = json['volume'];
    zkFinalPrice = json['zk_final_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['click_url'] = this.clickUrl;
    data['commission_rate'] = this.commissionRate;
    data['coupon_amount'] = this.couponAmount;
    data['coupon_click_url'] = this.couponClickUrl;
    data['coupon_end_time'] = this.couponEndTime;
    data['coupon_info'] = this.couponInfo;
    data['coupon_remain_count'] = this.couponRemainCount;
    data['coupon_share_url'] = this.couponShareUrl;
    data['coupon_start_fee'] = this.couponStartFee;
    data['coupon_start_time'] = this.couponStartTime;
    data['coupon_total_count'] = this.couponTotalCount;
    data['item_description'] = this.itemDescription;
    data['item_id'] = this.itemId;
    data['level_one_category_id'] = this.levelOneCategoryId;
    data['level_one_category_name'] = this.levelOneCategoryName;
    data['nick'] = this.nick;
    data['pict_url'] = this.pictUrl;
    data['seller_id'] = this.sellerId;
    data['shop_title'] = this.shopTitle;
    if (this.smallImages != null) {
      data['small_images'] = this.smallImages.toJson();
    }
    data['title'] = this.title;
    data['user_type'] = this.userType;
    data['volume'] = this.volume;
    data['zk_final_price'] = this.zkFinalPrice;
    return data;
  }
}

class SmallImages {
  List<String> string;

  SmallImages({this.string});

  SmallImages.fromJson(Map<String, dynamic> json) {
    string = json['string'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['string'] = this.string;
    return data;
  }
}