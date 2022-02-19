import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tester_admin_panel/controller/config/text_fields/my_input_theme.dart';
import 'package:tester_admin_panel/Providers/core_providers.dart';
import 'package:tester_admin_panel/views/LoginScreens/login_screen.dart';
void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>CoreProviders())
    ],child: const MyApp(),),);
  }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Flutter Demo',

      theme: ThemeData(
        inputDecorationTheme: MyInputTheme().theme(),
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen()
    );
  }
}
