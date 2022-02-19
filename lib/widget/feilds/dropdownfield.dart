import 'package:flutter/material.dart';
class MyDropDownField extends StatefulWidget {


  const MyDropDownField({Key? key}) : super(key: key);

  @override
  State<MyDropDownField> createState() => _MyDropDownFieldState();
}

class _MyDropDownFieldState extends State<MyDropDownField> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Lahore';
    var city =  ['Lahore','Islamabad','Karachi','Multan',];
    return DropdownButton(
      value:  dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      items:city.map((String items) {
        return DropdownMenuItem(
            value: items,
            child: Text(items)
        );
      }
      ).toList(),
      onChanged: (String? newValue){
        setState(() {
          dropdownValue = newValue!;
        });
      });
  }
}
