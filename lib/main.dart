import 'package:chat_app_final/auth/auth_gate.dart';
import 'package:chat_app_final/auth/login_or_register.dart';
import 'package:chat_app_final/firebase_options.dart';
import 'package:chat_app_final/pages/home.dart';
import 'package:chat_app_final/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:chat_app_final/pages/login_page.dart';
import 'theme/lightmode.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Myapp());

}   // const ?

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light_mode,
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
