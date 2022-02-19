import 'package:flutter/material.dart';
class MyElevateButton extends StatelessWidget {
 String? inPuText;
 VoidCallback? inOnPress;
 Icon? myIcon;
 MyElevateButton({Key? key,required this.myIcon,
   required this.inPuText,required this.inOnPress
  }) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.white,elevation: 10)
        ,
        onPressed: inOnPress, child: Row(children: [Text(inPuText!,style: const TextStyle(color: Colors.black),),Padding(
      padding: const EdgeInsets.all(8.0),
      child: myIcon,
    ),],));
  }
}