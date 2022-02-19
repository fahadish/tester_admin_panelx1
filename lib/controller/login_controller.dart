import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:tester_admin_panel/Services/services.dart';
import 'package:tester_admin_panel/models/LoginModel/login_model.dart';
import 'package:tester_admin_panel/views/HomeScreen/home_screen.dart';
class LoginController extends GetxController{
var isDataSubmitting = false.obs;
var isDataReadingCompleted = false.obs;

  loginWithDetail(String  id, String pass) async {
    var md5pasword=   md5.convert(utf8.encode(pass)).toString();



    isDataSubmitting.value = true;
Map<String,dynamic> dataBody = {
  // Services.email : id,
  // Services.password : pass
};
var dataToSend = json.encode(dataBody);
var response = await http.post(Uri.parse(Services.login_Api_url), body: dataToSend );

if(response.statusCode == 200){
  isDataSubmitting.value = false;
Map<String, dynamic> responseData = json.decode(response.body);
var accessToken=jsonDecode(response.body)['data']['access_token'];
print(accessToken);
// print(responseData);

  print(responseData);
  print('Md5--->password$md5pasword');
  var emailId = LoginModel.fromJson(responseData).data!.email!;print(emailId);
  var userPassword= LoginModel.fromJson(responseData).data!.password!;print(userPassword);
if(emailId==id&&userPassword==md5pasword) {
  isDataReadingCompleted.value = true;
  Get.to(HomeScreen());
}

else{
  Get.snackbar('Login Fail', 'invalid login email / password',
    backgroundColor: Colors.pink,
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 5,
    borderWidth: 2,
  );
}

}else{
  isDataSubmitting.value = false;
  Get.snackbar('Login Fail', 'Api Problem',
backgroundColor: Colors.black,
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 10,
    borderWidth: 2,
  );
}

  }

  final GlobalKey<FormState>loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController,passwordController;
  var email = '';
  var password = '';
  @override
  void onInit() {

    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
  @override
  // void onClose() {
  //  emailController.dispose();
  //  passwordController.dispose();
  // }
String? validateEmail(String value){
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

  void checkLogin(){
    final  isValid=loginFormKey.currentState!.validate();
    if(!isValid){
      return;
    }

    loginFormKey.currentState!.save();
  }




}