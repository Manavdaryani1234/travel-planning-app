import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../Screens/Auth/login.dart';
import '../Screens/Auth/new_workspace.dart';
import '../constants.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key, required String email}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AuthScreen();
  }
}

class _AuthScreen extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();
  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';

  void _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    print(_enteredEmail);
    print(_enteredPassword);
    if (_isLogin) {
      try {
        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
        print(userCredentials);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => Login(
              email: _enteredEmail,
            )));
      } on FirebaseAuthException catch (error) {
        if (error.code == 'email-already-in-use') {}
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(error.message ?? "Authentication Failed"),
        ));
      }
    } else {
      try {
        final userCredentials = await _firebase
            .createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
        print(userCredentials);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => Login(
              email: _enteredEmail,
            )));
      } on FirebaseAuthException catch (error) {
        if (error.code == 'email-already-in-use') {}
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(error.message ?? "Authentication Failed"),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/openai-wordmark.svg',
                height: 30,
              ),
              SizedBox(
                height: 130,
              ),
              Text(
                _isLogin ? 'Welcome Back' : "Create your account",
                style: TextStyle(
                  color: Colors.white, // Set text color to white
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: 5, left: 10, right: 20, bottom: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(142, 142, 142, 1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: MyColors.orange,
                      width: 1,
                    ),
                  ),
                  hintText: 'Please enter your Email',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(224, 224, 224, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Nunito',
                  ),
                ),
                textAlign: TextAlign.start,
                cursorColor: MyColors.blue,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.none,
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      !value.contains('@')) {
                    return 'Please enter a valid E-mail Address';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _enteredEmail = value!;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: 5, left: 10, right: 20, bottom: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(142, 142, 142, 1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: MyColors.orange,
                      width: 1,
                    ),
                  ),
                  hintText: 'Please enter your Password',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(224, 224, 224, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Nunito',
                  ),
                ),
                textAlign: TextAlign.start,
                cursorColor: Colors.blue,
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.trim().length < 6) {
                    return 'Password must be atleast 6 characters long...';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredPassword = value!;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.orange,
                    disabledBackgroundColor: MyColors.veryLightBlue,
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _submit,
                  child: Text(
                    _isLogin ? "Login" : "SignUp",
                    style: TextStyle(
                      color: MyColors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                      _isLogin ? " Sign Up" : ' Login',
                      style: TextStyle(
                        color: MyColors.orange,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleFonts {
  const GoogleFonts();
  static lato({required TextStyle TextStyle}) {}
}
