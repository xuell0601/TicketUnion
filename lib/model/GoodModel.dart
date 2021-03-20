class GoodModel {
  bool success;
  int code;
  String message;
  List<Data> data;

  GoodModel({this.success, this.code, this.message, this.data});

  GoodModel.fromJson(Map<String, dynamic> json) {
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
  int categoryId;
  String  categoryName;
  String clickUrl;
  String commissionRate;
  int couponAmount;
  String couponClickUrl;
  String couponEndTime;
  String  couponInfo;
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
   String shopTitle;
  String smallImages;
  String title;
  int userType;
  int volume;
  String zkFinalPrice;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    clickUrl = json['click_url'];
    commissionRate = json['commission_rate'];
    couponAmount = json['coupon_amount'];
    couponClickUrl = json['coupon_click_url'];
    couponEndTime = json['coupon_end_time'];

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
    data['small_images'] = this.smallImages;
    data['title'] = this.title;
    data['user_type'] = this.userType;
    data['volume'] = this.volume;
    data['zk_final_price'] = this.zkFinalPrice;
    return data;
  }
}