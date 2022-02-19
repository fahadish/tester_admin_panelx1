import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart'as http;
import 'package:tester_admin_panel/Services/services.dart';
import 'package:tester_admin_panel/Providers/core_providers.dart';
import 'package:tester_admin_panel/models/banner_model/banner_model.dart';
import 'package:provider/provider.dart';
import 'package:tester_admin_panel/models/listing_model/ListingModel.dart';
import 'package:tester_admin_panel/models/LoginModel/login_model_new.dart';
import 'package:tester_admin_panel/models/order_model/order_details_model.dart';
import 'package:tester_admin_panel/models/order_model/order_model.dart';
import 'package:tester_admin_panel/views/OrderScreen/orderDetails.dart';
class HomeController extends GetxController{


    }
class BannerRepo{
  Dio? dio;
  BannerRepo(){
    BaseOptions options=BaseOptions(
        baseUrl: "https://www.taster.pk/api/",
        receiveDataWhenStatusError: true,
        connectTimeout: 60*1000,
        receiveTimeout: 60*1000
    );
    dio=Dio(options);
  }

  Future<BannerModel?> getBanners(BuildContext context) async {
    try{
      //var body=FormData.fromMap({
      // });
      final response= await dio!.post("app/banners?app_key=c730e2d7b6f74a2c663d4cd748a7cad5&access_token=303053249&user_id=1625",);
      print(response.statusCode);
      if(response.statusCode==200){
        if(response.data['status_code']==200){
          print('okkk');
          print(response);
          context.read<CoreProviders>().bannerModel=BannerModel.fromJson(response.data);
          return context.read<CoreProviders>().bannerModel;
        }
        // else if(response.data['status']==401){
        //   print("${response.data['status']}:${response.data['message']}");
        //   return null;
        // }
        return null;
      }

    }on DioError catch(e){
      print(e.toString());
    }
  }
  Future<ProductListingModel?> getProductListing(BuildContext context) async {
    try{
      //var body=FormData.fromMap({
      // });
      final response= await dio!.post("app/myads?app_key=c730e2d7b6f74a2c663d4cd748a7cad5&access_token=303053249&user_id=1625",);
      print(response.statusCode);
      if(response.statusCode==200){
        if(response.data['status_code']==200){
          print('okkk');
          print(response);
          context.read<CoreProviders>().productListingModel=ProductListingModel.fromJson(response.data);
          return context.read<CoreProviders>().productListingModel;
        }
        // else if(response.data['status']==401){
        //   print("${response.data['status']}:${response.data['message']}");
        //   return null;
        // }
        return null;
      }

    }on DioError catch(e){
      print(e.toString());
    }
  }
  Future<OrdersModel?> getOrders(BuildContext context) async {
    try{
      //var body=FormData.fromMap({
      // });
      final response= await dio!.post("app/orders?app_key=c730e2d7b6f74a2c663d4cd748a7cad5&access_token=303053249&user_id=1625",);
      print(response.statusCode);
      if(response.statusCode==200){
        if(response.data['status_code']==200){
          print('okkk');
          print(response);
          context.read<CoreProviders>().ordersModel=OrdersModel.fromJson(response.data);
          return context.read<CoreProviders>().ordersModel;
        }
        // else if(response.data['status']==401){
        //   print("${response.data['status']}:${response.data['message']}");
        //   return null;
        // }
        return null;
      }

    }on DioError catch(e){
      print(e.toString());
    }
  }
  Future<LoginModelNew?> getLogin(BuildContext context, String email, String password) async {
    try{
      //var body=FormData.fromMap({
      // });
      final response= await dio!.post("app/login?app_key=c730e2d7b6f74a2c663d4cd748a7cad5&email=$email&password=$password",);
      print(response.statusCode);
      if(response.statusCode==200){
        if(response.data['status']=='success'){
          print('okkk');
          print(response);
          context.read<CoreProviders>().loginModelNew=LoginModelNew.fromJson(response.data);
          return context.read<CoreProviders>().loginModelNew;
        }
        else if(response.data['status']=='error'){
          // print("${response.data['status']}:${response.data['message']}");
          return null;
        }
        return null;
      }

    }on DioError catch(e){
      print(e.toString());
    }
  }
  Future<OrderDetailsModel?> getOrderDetails(BuildContext context,int? orderId) async {
    try{
      //var body=FormData.fromMap({
      // });
      final response= await dio!.post('app/orderdetail?app_key=c730e2d7b6f74a2c663d4cd748a7cad5&access_token=303053249&user_id=1625&order_id=${orderId}');
      print(response.statusCode);
      if(response.statusCode==200){
        if(response.data['status']=='success'){
          print('okkk');
          print(response);
          context.read<CoreProviders>().orderDetailsModel=OrderDetailsModel.fromJson(response.data);
          return context.read<CoreProviders>().orderDetailsModel;
        }
        else if(response.data['status']=='error'){
          // print("${response.data['status']}:${response.data['message']}");
          return null;
        }
        return null;
      }

    }on DioError catch(e){
      print(e.toString());
    }
  }
}
