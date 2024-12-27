import 'package:chat_app_final/pages/login_page.dart';
import 'package:chat_app_final/pages/register_page.dart';
import 'package:flutter/material.dart';

class SignInUp extends StatefulWidget {
  const SignInUp({super.key});

  @override
  State<SignInUp> createState() => _SignInUpState();
}

class _SignInUpState extends State<SignInUp> {

  bool loginpageshowup = true;
  // boolean variable to switch from login and sign up
  void toggle(){
    setState(() {
      loginpageshowup = !loginpageshowup;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loginpageshowup){
      return loginpage(
        onTap: toggle,
      );
    }
    else {
      return registerpage(
        onTap: toggle,
      );
    }
  }
}


