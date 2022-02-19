// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginModelNew welcomeFromJson(String str) => LoginModelNew.fromJson(json.decode(str));

String welcomeToJson(LoginModelNew data) => json.encode(data.toJson());

class LoginModelNew {
  LoginModelNew({
    this.status,
    this.statusCode,
    this.data,
    this.message,
  });

  String? status;
  int? statusCode;
  Data? data;
  String? message;

  factory LoginModelNew.fromJson(Map<String, dynamic> json) => LoginModelNew(
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
    this.accessToken,
    this.userId,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.country,
    this.city,
    this.allowShope,
    this.allowPortfolio,
    this.allowVideo,
    this.allowOrders,
    this.allowGallery,
    this.allowClients,
    this.allowFaq,
    this.allowSections,
    this.allowReviews,
    this.registerCategory,
  });

  int? accessToken;
  int? userId;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? country;
  String? city;
  String? allowShope;
  String? allowPortfolio;
  String? allowVideo;
  String? allowOrders;
  String? allowGallery;
  String? allowClients;
  String? allowFaq;
  String? allowSections;
  String? allowReviews;
  int? registerCategory;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["access_token"],
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    address: json["address"],
    country: json["country"],
    city: json["city"],
    allowShope: json["allow_shope"],
    allowPortfolio: json["allow_portfolio"],
    allowVideo: json["allow_video"],
    allowOrders: json["allow_orders"],
    allowGallery: json["allow_gallery"],
    allowClients: json["allow_clients"],
    allowFaq: json["allow_faq"],
    allowSections: json["allow_sections"],
    allowReviews: json["allow_reviews"],
    registerCategory: json["register_category"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "user_id": userId,
    "name": name,
    "email": email,
    "password": password,
    "phone": phone,
    "address": address,
    "country": country,
    "city": city,
    "allow_shope": allowShope,
    "allow_portfolio": allowPortfolio,
    "allow_video": allowVideo,
    "allow_orders": allowOrders,
    "allow_gallery": allowGallery,
    "allow_clients": allowClients,
    "allow_faq": allowFaq,
    "allow_sections": allowSections,
    "allow_reviews": allowReviews,
    "register_category": registerCategory,
  };
}
