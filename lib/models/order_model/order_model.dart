// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

OrdersModel welcomeFromJson(String str) => OrdersModel.fromJson(json.decode(str));

String welcomeToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  OrdersModel({
    this.status,
    this.statusCode,
    this.data,
    this.message,
  });

  String? status;
  int? statusCode;
  Data? data;
  String? message;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
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
    this.orders,
  });

  List<Order>? orders;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
  };
}

class Order {
  Order({
    this.orderId,
    this.merchantId,
    this.orderNumber,
    this.userName,
    this.userEmail,
    this.userPhone,
    this.userAddress,
    this.userDeliveryArea,
    this.userComments,
    this.gstTax,
    this.gstTaxPercent,
    this.orderTotal,
    this.orderCurrency,
    this.orderDate,
    this.orderStatus,
  });

  int? orderId;
  int? merchantId;
  int? orderNumber;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userAddress;
  String? userDeliveryArea;
  UserComments? userComments;
  String? gstTax;
  int? gstTaxPercent;
  String? orderTotal;
  OrderCurrency? orderCurrency;
  DateTime? orderDate;
  int? orderStatus;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    merchantId: json["merchant_id"],
    orderNumber: json["order_number"],
    userName: json["user_name"],
    userEmail: json["user_email"],
    userPhone: json["user_phone"],
    userAddress: json["user_address"],
    userDeliveryArea: json["user_delivery_area"],
    userComments: userCommentsValues.map[json["user_comments"]],
    gstTax: json["gst_tax"],
    gstTaxPercent: json["gst_tax_percent"],
    orderTotal: json["order_total"],
    orderCurrency: orderCurrencyValues.map[json["order_currency"]],
    orderDate: DateTime.parse(json["order_date"]),
    orderStatus: json["order_status"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "merchant_id": merchantId,
    "order_number": orderNumber,
    "user_name": userName,
    "user_email": userEmail,
    "user_phone": userPhone,
    "user_address": userAddress,
    "user_delivery_area": userDeliveryArea,
    "user_comments": userCommentsValues.reverse![userComments],
    "gst_tax": gstTax,
    "gst_tax_percent": gstTaxPercent,
    "order_total": orderTotal,
    "order_currency": orderCurrencyValues.reverse![orderCurrency],
    "order_date": orderDate!.toIso8601String(),
    "order_status": orderStatus,
  };
}

enum OrderCurrency { RS, ORDER_CURRENCY_RS, PURPLE_RS }

final orderCurrencyValues = EnumValues({
  "Rs.": OrderCurrency.ORDER_CURRENCY_RS,
  "Rs": OrderCurrency.PURPLE_RS,
  "RS": OrderCurrency.RS
});

enum UserComments { NO_COMMENT, THIS_IS_COMMENT, EMPTY, USER_COMMENTS, AA, TESTING_ORDER }

final userCommentsValues = EnumValues({
  "aa": UserComments.AA,
  " ": UserComments.EMPTY,
  "no comment": UserComments.NO_COMMENT,
  "testing order": UserComments.TESTING_ORDER,
  "this is comment": UserComments.THIS_IS_COMMENT,
  "": UserComments.USER_COMMENTS
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
