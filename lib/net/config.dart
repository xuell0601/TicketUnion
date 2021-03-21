
class Config{
  static String  BASE_URL="https://api.sunofbeach.net/shop";
  //获取发现页的分类
  static String categories=BASE_URL+"/discovery/categories";
  //根据发现页分类ID获取分类内容
  static String  good=BASE_URL+"/discovery";
  //特惠页面
  static String sell=BASE_URL+"/onSell";
  //精选页面
  static String recom_cate =BASE_URL+"/recommend/categories";
  //精选页面的内荣
 static String recomgoods=BASE_URL+"/recommend";
  static String ticurl="https://api.sunofbeach.net/shop/tpwd";
  //https://api.sunofbeach.net/shop/search?keyword="男装"&page=0
 static String search="https://api.sunofbeach.net/shop/search";
}