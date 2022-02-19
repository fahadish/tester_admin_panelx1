// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.statusCode,
    this.data,
    this.message,
  });

  String? status;
  int? statusCode;
  Data? data;
  String? message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"] ?? null,
    statusCode: json["status_code"] ?? null,
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"] ?? null,
  );

  Map<String, dynamic> toJson() => {
    "status": status ?? null,
    "status_code": statusCode ?? null,
    "data": data == null ? null : data!.toJson(),
    "message": message ?? null,
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
    accessToken: json["access_token"] ?? null,
    userId: json["user_id"] ?? null,
    name: json["name"] ?? null,
    email: json["email"] ?? null,
    password: json["password"] ?? null,
    phone: json["phone"] ?? null,
    address: json["address"] ?? null,
    country: json["country"] ?? null,
    city: json["city"] ?? null,
    allowShope: json["allow_shope"] ?? null,
    allowPortfolio: json["allow_portfolio"] ?? null,
    allowVideo: json["allow_video"] ?? null,
    allowOrders: json["allow_orders"] ?? null,
    allowGallery: json["allow_gallery"] ?? null,
    allowClients: json["allow_clients"] ?? null,
    allowFaq: json["allow_faq"] ?? null,
    allowSections: json["allow_sections"] ?? null,
    allowReviews: json["allow_reviews"] ?? null,
    registerCategory: json["register_category"] ?? null,
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken ?? null,
    "user_id": userId ?? null,
    "name": name ?? null,
    "email": email ?? null,
    "password": password ?? null,
    "phone": phone ?? null,
    "address": address ?? null,
    "country": country ?? null,
    "city": city ?? null,
    "allow_shope": allowShope ?? null,
    "allow_portfolio": allowPortfolio ?? null,
    "allow_video": allowVideo ?? null,
    "allow_orders": allowOrders ?? null,
    "allow_gallery": allowGallery ?? null,
    "allow_clients": allowClients ?? null,
    "allow_faq": allowFaq ?? null,
    "allow_sections": allowSections ?? null,
    "allow_reviews": allowReviews ?? null,
    "register_category": registerCategory ?? null,
  };
}
