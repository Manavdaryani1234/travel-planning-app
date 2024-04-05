import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskez/Values/values.dart';
import 'package:taskez/widgets/DarkBackground/darkRadialBackground.dart';
import 'package:taskez/widgets/Forms/form_input_with%20_label.dart';
import 'package:taskez/widgets/Navigation/back.dart';

import '../../Authentication/auth.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  final String email;
  const SignUp({required this.email});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      DarkRadialBackground(
        color: HexColor.fromHex("#181a1f"),
        position: "topLeft",
      ),
      Padding(
          padding: EdgeInsets.all(20.0),
          child: SafeArea(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            NavigationBack(),
            SizedBox(height: 40),
            Text('Sign Up',),
            AppSpaces.verticalSpace20,
            RichText(
              text: TextSpan(
                text: 'Using  ',
                children: <TextSpan>[
                  TextSpan(text: widget.email, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
                  TextSpan(text: "  to login.", ),
                ],
              ),
            ),
            SizedBox(height: 30),
            LabelledFormInput(
                placeholder: "Name",
                keyboardType: "text",
                controller: _nameController,
                obscureText: obscureText,
                label: "Your Name"),
            SizedBox(height: 15),
            LabelledFormInput(
                placeholder: "Password",
                keyboardType: "text",
                controller: _passController,
                obscureText: obscureText,
                label: "Your Password"),
            SizedBox(height: 40),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => AuthScreen(email: widget.email));
                  },
                  child: Text('Sign Up'),)
            )
          ])))
    ]));
  }
}
