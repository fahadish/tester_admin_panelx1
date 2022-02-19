import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      emailController,
      phoneNumController,
      cityController,
      areaController,
      openingDaysController,
      openingTimeController,
      closingTimeController,
      websiteController,
      facebookController,
      twitterController,
      linkedinController,
      youtubeController,
      googleController,
      passwordController,
      newPasswordController,
  reNewPasswordController;

  String name = '';
  String email = '';
  String password = '';
  String newPassword = '';
  String reNewPassword= '';
  num? phone;

  String city = '';
  String area = '';
  String openDays = '';
  num? openTime;
  String closeTime = '';
  String webName = '';
  String facebookName = '';
  String twitter = '';
  String linkedIn = '';
  String youtube = '';
  String google = '';

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumController = TextEditingController();
    cityController = TextEditingController();
    areaController = TextEditingController();
    openingDaysController = TextEditingController();
    openingTimeController = TextEditingController();
    closingTimeController = TextEditingController();
    websiteController = TextEditingController();
    facebookController = TextEditingController();
    twitterController = TextEditingController();
    linkedinController = TextEditingController();
    youtubeController = TextEditingController();
    googleController = TextEditingController();
    passwordController =TextEditingController();
    newPasswordController = TextEditingController();
    reNewPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    cityController.dispose();
    phoneNumController.dispose();
    cityController.dispose();
    areaController.dispose();
    openingDaysController.dispose();
    openingTimeController.dispose();
    closingTimeController.dispose();
    websiteController.dispose();
    facebookController.dispose();
    twitterController.dispose();
    linkedinController.dispose();
    youtubeController.dispose();
    googleController.dispose();
    passwordController.dispose();
    newPasswordController.dispose();
    reNewPasswordController.dispose();
  }

  String? validateName(String value){
    if(!GetUtils.isAlphabetOnly(value)){
      return "provide valid name";
    }
    return null;
  }
  String? validateEmail(String value){
    if(!GetUtils.isEmail(value)){
      return "provide valid email";
    }
    return null;
  }
  String? validateNumber(String value){
    if(!GetUtils.isNumericOnly(value)){
      return "provide valid number";
    }
    return null;
  }
  String? validateCity(String value){
    if(!GetUtils.isAlphabetOnly(value)){
      return "provide available city";
    }
    return null;
  }
  String? validateArea(String value){
    if(!GetUtils.isAlphabetOnly(value)){
      return "provide available area ";
    }
    return null;
  }
  String? validateOpeningDays(String value){
    if(!GetUtils.isDateTime(value)){
      return "provide available time";
    }
    return null;
  }
  String? validateOpenTime(String value){
    if(!GetUtils.isDateTime(value)){
      return "provide valid email";
    }
    return null;
  }
  String? validateCloseTime(String value){
    if(!GetUtils.isEmail(value)){
      return "provide valid email";
    }
    return null;
  }
  String? validateWebsite(String value){
    if(!GetUtils.isAlphabetOnly(value)){
      return "provide valid website";
    }
    return null;
  }

  String? validateFaceBook(String value){
    if(!GetUtils.isEmail(value)){
      return "provide valid email";
    }
    return null;
  }
  String? validateYoutube(String value){
    if(!GetUtils.isEmail(value)){
      return "provide valid email";
    }
    return null;
  }
  String? validateTwitter(String value){
    if(!GetUtils.isEmail(value)){
      return "provide valid email";
    }
    return null;
  }
  String? validateLinkedin(String value){
    if(!GetUtils.isEmail(value)){
      return "provide valid email";
    }
    return null;
  }

  String? validateGoogle(String value){
    if(!GetUtils.isEmail(value)){
      return "provide valid email";
    }
    return null;
  }
  String? validatePassword(String value){
    if(value.length<=6){
      return "Invalid Password";
    }
    return null;
  }

  String? newValidatePassword(String value){
    if(value.length<=6){
      return "Invalid Password";
    }
    return null;
  }
  String? reNewValidatePassword(String value){
    if(value.length<=6){
      return "Invalid Password";
    }
    return null;
  }


  void checkProfile(){
    final  isValid=profileFormKey.currentState!.validate();
    if(!isValid){
      return;
    }

    profileFormKey.currentState!.save();
  }

}
