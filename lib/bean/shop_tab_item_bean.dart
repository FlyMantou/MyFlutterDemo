/// cate_id : "17"
/// cate_name : "考研"
/// ad_title : ""
/// is_home : "0"
/// goods_list : [{"goods_id":"2162","goods_name":"公共营养师","goods_desc":"公共营养师","sale":"1837人已购买","thumb_url":"http://pay.lanjiyin.com.cn/Uploads/Admin/2021/03/16/605075df88300.jpg","label_img_url":[],"price_range":"¥2980","price_discount_range":"¥1980","discount_range":"","cate_id":"392","is_chapter":"1","type":"0","courseType":"1","courseName":"公共营养师","course_catalogue":"","hour_num_count":"","app_id":"oral_0322","app_type":"kqzhiyeyishi"},{"goods_id":"2236","goods_name":"⼝腔考研历年真题（APP版）","goods_desc":"⼝腔考研历年真题（APP版）","sale":"3986人已购买","thumb_url":"http://pay.lanjiyin.com.cn/Uploads/Admin/2021/03/30/6062e4df518a1.png","label_img_url":["http://pay.lanjiyin.com.cn/Uploads/Admin/2021/04/08/606e958ba3d26.png"],"price_range":"¥9.9","price_discount_range":"¥9.9","discount_range":"","cate_id":"0","is_chapter":"-1","type":"0","courseType":"0","courseName":"","course_catalogue":"","hour_num_count":"","app_id":"oral_0322","app_type":"kqzhiyeyishi"},{"goods_id":"2164","goods_name":"心理咨询师","goods_desc":"心理咨询师","sale":"264人已购买","thumb_url":"http://pay.lanjiyin.com.cn/Uploads/Admin/2021/03/16/60507f01e1cfb.jpg","label_img_url":[],"price_range":"¥2980","price_discount_range":"¥2980","discount_range":"","cate_id":"0","is_chapter":"-1","type":"0","courseType":"0","courseName":"","course_catalogue":"","hour_num_count":"","app_id":"oral_0322","app_type":"kqzhiyeyishi"},{"goods_id":"2178","goods_name":"中医康复理疗师","goods_desc":"中医康复理疗师","sale":"","thumb_url":"http://pay.lanjiyin.com.cn/Uploads/Admin/2021/03/19/60545402113d6.jpg","label_img_url":[],"price_range":"¥1980","price_discount_range":"¥1980","discount_range":"","cate_id":"0","is_chapter":"-1","type":"0","courseType":"0","courseName":"","course_catalogue":"","hour_num_count":"","app_id":"oral_0322","app_type":"kqzhiyeyishi"},{"goods_id":"2176","goods_name":"中医健康管理师","goods_desc":"中医健康管理师","sale":"124人已购买","thumb_url":"http://pay.lanjiyin.com.cn/Uploads/Admin/2021/03/19/6054528524628.jpg","label_img_url":[],"price_range":"¥1980","price_discount_range":"¥1980","discount_range":"","cate_id":"0","is_chapter":"-1","type":"0","courseType":"0","courseName":"","course_catalogue":"","hour_num_count":"","app_id":"oral_0322","app_type":"kqzhiyeyishi"}]

class ShopTabItemBean {
  String _cateId;
  String _cateName;
  String _adTitle;
  String _isHome;
  List<Goods_list> _goodsList;

  String get cateId => _cateId;
  String get cateName => _cateName;
  String get adTitle => _adTitle;
  String get isHome => _isHome;
  List<Goods_list> get goodsList => _goodsList;

  ShopTabItemBean({
      String cateId, 
      String cateName, 
      String adTitle, 
      String isHome, 
      List<Goods_list> goodsList}){
    _cateId = cateId;
    _cateName = cateName;
    _adTitle = adTitle;
    _isHome = isHome;
    _goodsList = goodsList;
}

  ShopTabItemBean.fromJson(dynamic json) {
    _cateId = json["cate_id"];
    _cateName = json["cate_name"];
    _adTitle = json["ad_title"];
    _isHome = json["is_home"];
    if (json["goods_list"] != null) {
      _goodsList = [];
      json["goods_list"].forEach((v) {
        _goodsList.add(Goods_list.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["cate_id"] = _cateId;
    map["cate_name"] = _cateName;
    map["ad_title"] = _adTitle;
    map["is_home"] = _isHome;
    if (_goodsList != null) {
      map["goods_list"] = _goodsList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// goods_id : "2162"
/// goods_name : "公共营养师"
/// goods_desc : "公共营养师"
/// sale : "1837人已购买"
/// thumb_url : "http://pay.lanjiyin.com.cn/Uploads/Admin/2021/03/16/605075df88300.jpg"
/// label_img_url : []
/// price_range : "¥2980"
/// price_discount_range : "¥1980"
/// discount_range : ""
/// cate_id : "392"
/// is_chapter : "1"
/// type : "0"
/// courseType : "1"
/// courseName : "公共营养师"
/// course_catalogue : ""
/// hour_num_count : ""
/// app_id : "oral_0322"
/// app_type : "kqzhiyeyishi"

class Goods_list {
  String _goodsId;
  String _goodsName;
  String _goodsDesc;
  String _sale;
  String _thumbUrl;
  List<String> _labelImgUrl;
  String _priceRange;
  String _priceDiscountRange;
  String _discountRange;
  String _cateId;
  String _isChapter;
  String _type;
  String _courseType;
  String _courseName;
  String _courseCatalogue;
  String _hourNumCount;
  String _appId;
  String _appType;

  String get goodsId => _goodsId;
  String get goodsName => _goodsName;
  String get goodsDesc => _goodsDesc;
  String get sale => _sale;
  String get thumbUrl => _thumbUrl;
  List<String> get labelImgUrl => _labelImgUrl;
  String get priceRange => _priceRange;
  String get priceDiscountRange => _priceDiscountRange;
  String get discountRange => _discountRange;
  String get cateId => _cateId;
  String get isChapter => _isChapter;
  String get type => _type;
  String get courseType => _courseType;
  String get courseName => _courseName;
  String get courseCatalogue => _courseCatalogue;
  String get hourNumCount => _hourNumCount;
  String get appId => _appId;
  String get appType => _appType;

  Goods_list({
      String goodsId, 
      String goodsName, 
      String goodsDesc, 
      String sale, 
      String thumbUrl, 
      List<dynamic> labelImgUrl, 
      String priceRange, 
      String priceDiscountRange, 
      String discountRange, 
      String cateId, 
      String isChapter, 
      String type, 
      String courseType, 
      String courseName, 
      String courseCatalogue, 
      String hourNumCount, 
      String appId, 
      String appType}){
    _goodsId = goodsId;
    _goodsName = goodsName;
    _goodsDesc = goodsDesc;
    _sale = sale;
    _thumbUrl = thumbUrl;
    _labelImgUrl = labelImgUrl;
    _priceRange = priceRange;
    _priceDiscountRange = priceDiscountRange;
    _discountRange = discountRange;
    _cateId = cateId;
    _isChapter = isChapter;
    _type = type;
    _courseType = courseType;
    _courseName = courseName;
    _courseCatalogue = courseCatalogue;
    _hourNumCount = hourNumCount;
    _appId = appId;
    _appType = appType;
}

  Goods_list.fromJson(dynamic json) {
    _goodsId = json["goods_id"];
    _goodsName = json["goods_name"];
    _goodsDesc = json["goods_desc"];
    _sale = json["sale"];
    _thumbUrl = json["thumb_url"];
    if (json["label_img_url"] != null) {
      _labelImgUrl = [];
      json["label_img_url"].forEach((v) {
        _labelImgUrl.add(v);
      });
    }
    _priceRange = json["price_range"];
    _priceDiscountRange = json["price_discount_range"];
    _discountRange = json["discount_range"];
    _cateId = json["cate_id"];
    _isChapter = json["is_chapter"];
    _type = json["type"];
    _courseType = json["courseType"];
    _courseName = json["courseName"];
    _courseCatalogue = json["course_catalogue"];
    _hourNumCount = json["hour_num_count"];
    _appId = json["app_id"];
    _appType = json["app_type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["goods_id"] = _goodsId;
    map["goods_name"] = _goodsName;
    map["goods_desc"] = _goodsDesc;
    map["sale"] = _sale;
    map["thumb_url"] = _thumbUrl;
    if (_labelImgUrl != null) {
      map["label_img_url"] = _labelImgUrl.map((v) => v).toList();
    }
    map["price_range"] = _priceRange;
    map["price_discount_range"] = _priceDiscountRange;
    map["discount_range"] = _discountRange;
    map["cate_id"] = _cateId;
    map["is_chapter"] = _isChapter;
    map["type"] = _type;
    map["courseType"] = _courseType;
    map["courseName"] = _courseName;
    map["course_catalogue"] = _courseCatalogue;
    map["hour_num_count"] = _hourNumCount;
    map["app_id"] = _appId;
    map["app_type"] = _appType;
    return map;
  }

}