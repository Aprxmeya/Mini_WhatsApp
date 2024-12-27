import 'package:chat_app_final/auth/Sign_in_up.dart';
import 'package:chat_app_final/pages/register_page.dart';
import 'package:flutter/material.dart';

import 'package:chat_app_final/pages/login_page.dart';
import 'theme/lightmode.dart';


void main() => runApp(const Myapp());   // const ?

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: light_mode,

      home: SignInUp(),

    );
  }
}
