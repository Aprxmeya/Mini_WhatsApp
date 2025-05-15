import 'dart:math';

import 'package:chat_app_final/Components/Textfield.dart';
import 'package:chat_app_final/Components/button.dart';
import 'package:chat_app_final/auth/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:chat_app_final/theme/lightmode.dart';


class loginpage extends StatelessWidget {

  final TextEditingController ewcontroller = new TextEditingController();
  final TextEditingController pwcontroller = new TextEditingController();

  void login(BuildContext context) async{  // login is used for login button

    //import authservice function from auth/authservice
    final authService = AuthService();

    //try for login; catch the error
    try{
      await authService.signinwithemailpassword(ewcontroller.text, pwcontroller.text);
    }catch(e){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ));
    }

  }
  final void Function()? onTap;

  loginpage({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon Display
            Icon(
                Icons.message,
                size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height : 30),
            Text("Welcome back, you've been missed",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 17,
              ),
            ),

            SizedBox(height : 30),

            txtfld(hinttet: "Email",visible: false,controller:ewcontroller ,),

            SizedBox(height: 15),

            txtfld(hinttet: "Password",visible: true,controller:pwcontroller ,),

            SizedBox(height: 30),

            mybutton(text: "Login", onTap: ()=> login(context)),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? "),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                ),
              ],
            ),


          ],
        ),
      )



    );
  }
}
