import 'package:flutter/material.dart';

import 'package:chat_app_final/loginpage/login_page.dart';
import 'theme/lightmode.dart';


void main() => runApp(const Myapp());   // const ?

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: light_mode,
      home: login(),

    );
  }
}
