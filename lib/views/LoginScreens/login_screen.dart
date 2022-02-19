import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tester_admin_panel/Providers/core_providers.dart';
import 'package:tester_admin_panel/controller/homescreen_controller.dart';
import 'package:tester_admin_panel/controller/login_controller.dart';
import 'package:tester_admin_panel/views/DashboardScreen/dashboard_screen.dart';
import 'package:tester_admin_panel/widget/WsignUpButton/w_signup_button.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);
  bool obscurePassword = true;
  final LoginController _loginController = Get.put(LoginController());
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;


    return Consumer<CoreProviders>(builder: (context,appPro,_){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 1000),
        initialRoute: '/',
        home: Scaffold(
          // backgroundColor: Colors.pink,
          body: SafeArea(
              child: Stack(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: width,
                        child: Column(
                          children: [
                            const SizedBox(height: 25,),
                            Image.asset('Assets/images/crcook.png', width: width * 0.5,)
                          ],
                        ),
                        //  child: Image.asset('Assets/images/crcook.png'),
                        color: const Color(0xffD9005E),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: width,
                          height: height / 1.5,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  topLeft: Radius.circular(50))),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            clipBehavior: Clip.none,
                            children: [
                              const Positioned(
                                top: -50,
                                child: CircleAvatar(
                                  radius: 62,
                                  backgroundImage:
                                  AssetImage('Assets/images/man-890885 (2).jpg'),
                                ),
                              ),
                              Column(
                                children: [
                                  const SizedBox(height: 100),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Form(
                                      key: _formKey,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      child: Column(
                                        children: [
                                          Text('Let\'s Cook Something... ',
                                              style: GoogleFonts.dongle(
                                                  textStyle: const TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    decoration: TextDecoration.none,
                                                  ))),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              labelText: 'Email',
                                              prefixIcon: const Icon(Icons.email),
                                            ),
                                            keyboardType: TextInputType.emailAddress,
                                            controller: emailController,
                                            // onSaved: (value) {
                                            //   _loginController.email = value!;
                                            // },
                                            validator: (value) {
                                              if(value!.isEmpty||value==''){
                                                return 'Provide Valid Email';
                                              }
                                              else{
                                                return null;
                                              }
                                            },
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          TextFormField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                ),
                                                labelText: 'Password',
                                                prefixIcon: const Icon(Icons.lock),
                                                suffixIcon: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      obscurePassword
                                                          ? Icons.visibility
                                                          : Icons.visibility_off,
                                                      color: Colors.grey,
                                                    ))),
                                            keyboardType: TextInputType.visiblePassword,
                                            obscureText: true,
                                            controller:passwordController,
                                            onSaved: (value) {
                                              _loginController.password = value!;
                                            },
                                            validator: (value) {
                                              if(value!.isEmpty||value==''){
                                                return 'provide valid password';
                                              }
                                              // return _loginController
                                              //     .validatePassword(value!);
                                            },
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        SignUpButton(
                                            inputText: 'Login',
                                            inOnPressed: () async{
                                              if(_formKey.currentState!.validate()){
                                                print('valide ok');
                                                appPro.getOrderLoader();
                                                BannerRepo().getBanners(context).then((value){
                                                  BannerRepo().getProductListing(context).then((value){
                                                    BannerRepo().getLogin(context,emailController.text.trim(),passwordController.text.trim()).then((value){
                                                      if(value!=null){
                                                        appPro.getOrderLoader();
                                                        print('*********************');
                                                        print(value.data!.name);
                                                        print('*********************');
                                                        Get.off(DashBoardScreen());
                                                      }
                                                      else{
                                                        appPro.getOrderLoader();
                                                        Get.snackbar('Error', 'Invalid Email Password');
                                                      }
                                                    });
                                                  });
                                                });
                                                // BannerRepo().getBanners(context);
                                                // BannerRepo().getProductListing(context);

                                              }
                                              else{
                                                print('valide null');
                                              }



                                            },)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  appPro.orderLoader?const Center(child: CircularProgressIndicator(color: Colors.black,),):const SizedBox()
                ],
              )
          ),
        ),
      );
    });
  }

  void userLogin() {
    final isValidate = _loginController.loginFormKey.currentState!.validate();
    if (isValidate) {
      _loginController.loginWithDetail(_loginController.emailController.text,
          _loginController.passwordController.text);
      // print(_loginController.emailController.text);
      // print(_loginController.passwordController.text);


    } else {
      return;
    }
  }

  String generateMd5(String pass) {
    return md5.convert(utf8.encode(pass)).toString();
  }

}