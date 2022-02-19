import 'package:flutter/material.dart';
import 'package:tester_admin_panel/models/banner_model/banner_model.dart';
import 'package:tester_admin_panel/models/listing_model/ListingModel.dart';
import 'package:tester_admin_panel/models/LoginModel/login_model_new.dart';
import 'package:tester_admin_panel/models/order_model/order_details_model.dart';
import 'package:tester_admin_panel/models/order_model/order_model.dart';

class CoreProviders extends ChangeNotifier{
  BannerModel? bannerModel;
  OrderDetailsModel? orderDetailsModel;
  ProductListingModel? productListingModel;
  OrdersModel? ordersModel;
  LoginModelNew? loginModelNew;
  bool _check1=true;
  bool _check2=false;
  bool _check3=false;
  bool _listLoader=false;
  bool _orderLoader=false;
  bool get check1=>_check1;
  bool get check2=>_check2;
  bool get check3=>_check3;
  bool get listLoader=>_listLoader;
  bool get orderLoader=>_orderLoader;
  void getCheck1(){
    _check1=true;
    _check2=false;
    _check3=false;
    notifyListeners();
  }
  void getCheck2(){
    _check1=false;
    _check2=true;
    _check3=false;
    notifyListeners();
  }
  void getCheck3(){
    _check1=false;
    _check2=false;
    _check3=true;
    notifyListeners();
  }
  void getListLoader(){
    _listLoader=!_listLoader;
    notifyListeners();
  }
  void getOrderLoader(){
    _orderLoader=!_orderLoader;
    notifyListeners();
  }



}

