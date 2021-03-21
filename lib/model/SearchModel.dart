class SearchModel {
  bool success;
  int code;
  String message;
  Data data;

  SearchModel({this.success, this.code, this.message, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
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
  TbkDgMaterialOptionalResponse tbkDgMaterialOptionalResponse;

  Data({this.tbkDgMaterialOptionalResponse});

  Data.fromJson(Map<String, dynamic> json) {
    tbkDgMaterialOptionalResponse =
    json['tbk_dg_material_optional_response'] != null
        ? new TbkDgMaterialOptionalResponse.fromJson(
        json['tbk_dg_material_optional_response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tbkDgMaterialOptionalResponse != null) {
      data['tbk_dg_material_optional_response'] =
          this.tbkDgMaterialOptionalResponse.toJson();
    }
    return data;
  }
}

class TbkDgMaterialOptionalResponse {
  ResultList resultList;
  int totalResults;
  String requestId;

  TbkDgMaterialOptionalResponse(
      {this.resultList, this.totalResults, this.requestId});

  TbkDgMaterialOptionalResponse.fromJson(Map<String, dynamic> json) {
    resultList = json['result_list'] != null
        ? new ResultList.fromJson(json['result_list'])
        : null;
    totalResults = json['total_results'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.resultList != null) {
      data['result_list'] = this.resultList.toJson();
    }
    data['total_results'] = this.totalResults;
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
  String categoryName;
  String commissionRate;
  String commissionType;
  String couponAmount;
  String couponEndTime;
  String couponId;
  String couponInfo;
  int couponRemainCount;
  String couponShareUrl;
  String couponStartFee;
  String couponStartTime;
  int couponTotalCount;
  String includeDxjh;
  String includeMkt;
  String infoDxjh;
  String itemDescription;
  int itemId;
  String itemUrl;
  int levelOneCategoryId;
  String levelOneCategoryName;
  String nick;
  int numIid;
  String pictUrl;
  String presaleDeposit;
  int presaleEndTime;
  int presaleStartTime;
  int presaleTailEndTime;
  int presaleTailStartTime;
  String provcity;
  String realPostFee;
  String reservePrice;
  int sellerId;
  int shopDsr;
  String shopTitle;
  String shortTitle;
  SmallImages smallImages;
  String title;
  String tkTotalCommi;
  String tkTotalSales;
  String url;
  int userType;
  int volume;
  String whiteImage;
  String xId;
  String zkFinalPrice;
  int jddNum;
  String jddPrice;
  String oetime;
  String ostime;

  MapData(
      {this.categoryId,
        this.categoryName,
        this.commissionRate,
        this.commissionType,
        this.couponAmount,
        this.couponEndTime,
        this.couponId,
        this.couponInfo,
        this.couponRemainCount,
        this.couponShareUrl,
        this.couponStartFee,
        this.couponStartTime,
        this.couponTotalCount,
        this.includeDxjh,
        this.includeMkt,
        this.infoDxjh,
        this.itemDescription,
        this.itemId,
        this.itemUrl,
        this.levelOneCategoryId,
        this.levelOneCategoryName,
        this.nick,
        this.numIid,
        this.pictUrl,
        this.presaleDeposit,
        this.presaleEndTime,
        this.presaleStartTime,
        this.presaleTailEndTime,
        this.presaleTailStartTime,
        this.provcity,
        this.realPostFee,
        this.reservePrice,
        this.sellerId,
        this.shopDsr,
        this.shopTitle,
        this.shortTitle,
        this.smallImages,
        this.title,
        this.tkTotalCommi,
        this.tkTotalSales,
        this.url,
        this.userType,
        this.volume,
        this.whiteImage,
        this.xId,
        this.zkFinalPrice,
        this.jddNum,
        this.jddPrice,
        this.oetime,
        this.ostime});

  MapData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    commissionRate = json['commission_rate'];
    commissionType = json['commission_type'];
    couponAmount = json['coupon_amount'];
    couponEndTime = json['coupon_end_time'];
    couponId = json['coupon_id'];
    couponInfo = json['coupon_info'];
    couponRemainCount = json['coupon_remain_count'];
    couponShareUrl = json['coupon_share_url'];
    couponStartFee = json['coupon_start_fee'];
    couponStartTime = json['coupon_start_time'];
    couponTotalCount = json['coupon_total_count'];
    includeDxjh = json['include_dxjh'];
    includeMkt = json['include_mkt'];
    infoDxjh = json['info_dxjh'];
    itemDescription = json['item_description'];
    itemId = json['item_id'];
    itemUrl = json['item_url'];
    levelOneCategoryId = json['level_one_category_id'];
    levelOneCategoryName = json['level_one_category_name'];
    nick = json['nick'];
    numIid = json['num_iid'];
    pictUrl = json['pict_url'];
    presaleDeposit = json['presale_deposit'];
    presaleEndTime = json['presale_end_time'];
    presaleStartTime = json['presale_start_time'];
    presaleTailEndTime = json['presale_tail_end_time'];
    presaleTailStartTime = json['presale_tail_start_time'];
    provcity = json['provcity'];
    realPostFee = json['real_post_fee'];
    reservePrice = json['reserve_price'];
    sellerId = json['seller_id'];
    shopDsr = json['shop_dsr'];
    shopTitle = json['shop_title'];
    shortTitle = json['short_title'];
    smallImages = json['small_images'] != null
        ? new SmallImages.fromJson(json['small_images'])
        : null;
    title = json['title'];
    tkTotalCommi = json['tk_total_commi'];
    tkTotalSales = json['tk_total_sales'];
    url = json['url'];
    userType = json['user_type'];
    volume = json['volume'];
    whiteImage = json['white_image'];
    xId = json['x_id'];
    zkFinalPrice = json['zk_final_price'];
    jddNum = json['jdd_num'];
    jddPrice = json['jdd_price'];
    oetime = json['oetime'];
    ostime = json['ostime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['commission_rate'] = this.commissionRate;
    data['commission_type'] = this.commissionType;
    data['coupon_amount'] = this.couponAmount;
    data['coupon_end_time'] = this.couponEndTime;
    data['coupon_id'] = this.couponId;
    data['coupon_info'] = this.couponInfo;
    data['coupon_remain_count'] = this.couponRemainCount;
    data['coupon_share_url'] = this.couponShareUrl;
    data['coupon_start_fee'] = this.couponStartFee;
    data['coupon_start_time'] = this.couponStartTime;
    data['coupon_total_count'] = this.couponTotalCount;
    data['include_dxjh'] = this.includeDxjh;
    data['include_mkt'] = this.includeMkt;
    data['info_dxjh'] = this.infoDxjh;
    data['item_description'] = this.itemDescription;
    data['item_id'] = this.itemId;
    data['item_url'] = this.itemUrl;
    data['level_one_category_id'] = this.levelOneCategoryId;
    data['level_one_category_name'] = this.levelOneCategoryName;
    data['nick'] = this.nick;
    data['num_iid'] = this.numIid;
    data['pict_url'] = this.pictUrl;
    data['presale_deposit'] = this.presaleDeposit;
    data['presale_end_time'] = this.presaleEndTime;
    data['presale_start_time'] = this.presaleStartTime;
    data['presale_tail_end_time'] = this.presaleTailEndTime;
    data['presale_tail_start_time'] = this.presaleTailStartTime;
    data['provcity'] = this.provcity;
    data['real_post_fee'] = this.realPostFee;
    data['reserve_price'] = this.reservePrice;
    data['seller_id'] = this.sellerId;
    data['shop_dsr'] = this.shopDsr;
    data['shop_title'] = this.shopTitle;
    data['short_title'] = this.shortTitle;
    if (this.smallImages != null) {
      data['small_images'] = this.smallImages.toJson();
    }
    data['title'] = this.title;
    data['tk_total_commi'] = this.tkTotalCommi;
    data['tk_total_sales'] = this.tkTotalSales;
    data['url'] = this.url;
    data['user_type'] = this.userType;
    data['volume'] = this.volume;
    data['white_image'] = this.whiteImage;
    data['x_id'] = this.xId;
    data['zk_final_price'] = this.zkFinalPrice;
    data['jdd_num'] = this.jddNum;
    data['jdd_price'] = this.jddPrice;
    data['oetime'] = this.oetime;
    data['ostime'] = this.ostime;
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