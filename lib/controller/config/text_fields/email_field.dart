import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class EmailField extends StatefulWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (s){if(s!.isEmpty){
        return "Enter a valid email";
      }
      },

      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(labelText: 'Email',

          helperText: '',

          hintText: "email@test.com",

      ),
    );
  }
}
