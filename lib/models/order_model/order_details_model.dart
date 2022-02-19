// To parse this JSON data, do
//
//     final orderDetails = orderDetailsFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
  OrderDetailsModel({
    this.status,
    this.statusCode,
    this.data,
    this.message,
  });

  String? status;
  int? statusCode;
  Data? data;
  String? message;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
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
    required this.order,
    required this.orderDetail,
  });

  List<Order> order;
  List<OrderDetail> orderDetail;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
    orderDetail: List<OrderDetail>.from(json["order_detail"].map((x) => OrderDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "order": List<dynamic>.from(order.map((x) => x.toJson())),
    "order_detail": List<dynamic>.from(orderDetail.map((x) => x.toJson())),
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
  String? userComments;
  String? gstTax;
  int? gstTaxPercent;
  String? orderTotal;
  String? orderCurrency;
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
    userComments: json["user_comments"],
    gstTax: json["gst_tax"],
    gstTaxPercent: json["gst_tax_percent"],
    orderTotal: json["order_total"],
    orderCurrency: json["order_currency"],
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
    "user_comments": userComments,
    "gst_tax": gstTax,
    "gst_tax_percent": gstTaxPercent,
    "order_total": orderTotal,
    "order_currency": orderCurrency,
    "order_date": orderDate!.toIso8601String(),
    "order_status": orderStatus,
  };
}

class OrderDetail {
  OrderDetail({
    this.productName,
    this.price,
    this.quantity,
    this.image,
  });

  String? productName;
  String? price;
  int? quantity;
  String? image;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    productName: json["product_name"],
    price: json["price"],
    quantity: json["quantity"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "product_name": productName,
    "price": price,
    "quantity": quantity,
    "image": image,
  };
}
