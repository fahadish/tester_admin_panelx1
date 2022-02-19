import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (s){if(s!.isEmpty){
        return "This is required field";
      }
      },
      obscureText: obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(labelText: 'Password',
        helperText: '',
        hintText: "Password",
        suffixIcon: IconButton(onPressed: ()=>setState(()=>obscurePassword = !obscurePassword)  , icon: Icon(
          obscurePassword?Icons.visibility: Icons.visibility_off,color: const Color(0xffd9005e),

        ))
      ),
    );
  }
}
