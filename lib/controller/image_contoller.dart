import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController{
  var isProfPicPathSet = false.obs;
  var profilePicPath = ''.obs;

  void setProfileImagePath(String path){
    profilePicPath.value = path;
    isProfPicPathSet.value = true;
  }
}