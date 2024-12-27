import 'package:chat_app_final/Components/Textfield.dart';
import 'package:chat_app_final/Components/button.dart';
import 'package:flutter/material.dart';

import 'package:chat_app_final/theme/lightmode.dart';

class loginpage extends StatelessWidget {

  final TextEditingController ewcontroller = new TextEditingController();
  final TextEditingController pwcontroller = new TextEditingController();

  void ontapp(){
    // do nothing for current status
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

            mybutton(text: "Login", onTap: ontapp),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a memeber yet ? ",
                  style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
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
