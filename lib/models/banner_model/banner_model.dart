class BannerModel {
  final String? status;
  final int? statusCode;
  final Data? data;
  final String? message;

  BannerModel({
    this.status,
    this.statusCode,
    this.data,
    this.message,
  });

  BannerModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        statusCode = json['status_code'] as int?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'status_code' : statusCode,
    'data' : data?.toJson(),
    'message' : message
  };
}

class Data {
  final List<Banners>? banners;

  Data({
    this.banners,
  });

  Data.fromJson(Map<String, dynamic> json)
      : banners = (json['banners'] as List?)?.map((dynamic e) => Banners.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'banners' : banners?.map((e) => e.toJson()).toList()
  };
}

class Banners {
  final int? id;
  final String? name;
  final String? link;
  final String? image;
  final String? detail;
  final int? sortOrder;
  final String? status;
  final String? appoved;

  Banners({
    this.id,
    this.name,
    this.link,
    this.image,
    this.detail,
    this.sortOrder,
    this.status,
    this.appoved,
  });

  Banners.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        link = json['link'] as String?,
        image = json['image'] as String?,
        detail = json['detail'] as String?,
        sortOrder = json['sort_order'] as int?,
        status = json['status'] as String?,
        appoved = json['appoved'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'link' : link,
    'image' : image,
    'detail' : detail,
    'sort_order' : sortOrder,
    'status' : status,
    'appoved' : appoved
  };
}