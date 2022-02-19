// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProductListingModel welcomeFromJson(String str) => ProductListingModel.fromJson(json.decode(str));

String welcomeToJson(ProductListingModel data) => json.encode(data.toJson());

class ProductListingModel {
  ProductListingModel({
    this.status,
    this.statusCode,
    this.data,
    this.message,
  });

  String? status;
  int? statusCode;
  Data? data;
  String? message;

  factory ProductListingModel.fromJson(Map<String, dynamic> json) => ProductListingModel(
    status: json["status"],
    statusCode: json["status_code"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status_code": statusCode,
    "data": data!.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    this.ads,
  });

  List<Ad>? ads;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    ads: List<Ad>.from(json["ads"].map((x) => Ad.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ads": List<dynamic>.from(ads!.map((x) => x.toJson())),
  };
}

class Ad {
  Ad({
    this.adNumber,
    this.scNumber,
    this.category,
    this.subcategory,
    this.adName,
    this.adLink,
    this.adImageThumbs,
    this.adImage,
    this.cityName,
    this.areaName,
    this.descriptionPost,
    this.adPrice,
    this.status,
    this.featured,
    this.createdAt,
    this.views,
    this.postType,
    this.adsImgs,
  });

  int? adNumber;
  int? scNumber;
  int? category;
  int? subcategory;
  String? adName;
  String? adLink;
  String? adImageThumbs;
  String? adImage;
  CityName? cityName;
  AreaName? areaName;
  String? descriptionPost;
  int? adPrice;
  Status? status;
  String? featured;
  DateTime? createdAt;
  int? views;
  PostType? postType;
  List<dynamic>? adsImgs;

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
    adNumber: json["ad_number"],
    scNumber: json["sc_number"],
    category: json["category"],
    subcategory: json["subcategory"],
    adName: json["ad_name"],
    adLink: json["ad_link"],
    adImageThumbs: json["ad_image_thumbs"],
    adImage: json["ad_image"],
    cityName: cityNameValues.map[json["city_name"]],
    areaName: areaNameValues.map[json["area_name"]],
    descriptionPost: json["description_post"],
    adPrice: json["ad_price"],
    status: statusValues.map[json["status"]],
    featured: json["featured"],
    createdAt: DateTime.parse(json["created_at"]),
    views: json["views"] ?? null,
    postType: postTypeValues.map[json["post_type"]],
    adsImgs: List<dynamic>.from(json["ads_imgs"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ad_number": adNumber,
    "sc_number": scNumber,
    "category": category,
    "subcategory": subcategory,
    "ad_name": adName,
    "ad_link": adLink,
    "ad_image_thumbs": adImageThumbs,
    "ad_image": adImage,
    "city_name": cityNameValues.reverse![cityName],
    "area_name": areaNameValues.reverse![areaName],
    "description_post": descriptionPost,
    "ad_price": adPrice,
    "status": statusValues.reverse![status],
    "featured": featured,
    "created_at": createdAt!.toIso8601String(),
    "views": views ?? null,
    "post_type": postTypeValues.reverse![postType],
    "ads_imgs": List<dynamic>.from(adsImgs!.map((x) => x)),
  };
}

enum AreaName { BAHRIA_TOWN }

final areaNameValues = EnumValues({
  "Bahria Town,": AreaName.BAHRIA_TOWN
});

enum CityName { LAHORE }

final cityNameValues = EnumValues({
  "Lahore": CityName.LAHORE
});

enum PostType { ADS }

final postTypeValues = EnumValues({
  "ads": PostType.ADS
});

enum Status { YES }

final statusValues = EnumValues({
  "Yes": Status.YES
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => new MapEntry(v, k));
    return reverseMap;
  }
}