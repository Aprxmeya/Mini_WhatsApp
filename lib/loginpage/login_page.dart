import 'package:chat_app_final/Components/Textfield.dart';
import 'package:flutter/material.dart';

import 'package:chat_app_final/theme/lightmode.dart';

class login extends StatelessWidget {

  final TextEditingController ewcontroller = new TextEditingController();
  final TextEditingController pwcontroller = new TextEditingController();

  login({super.key});

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

            SizedBox(height: 30),

            txtfld(hinttet: "Password",visible: true,controller:pwcontroller ,),
            
            // Email Enter






          ],
        ),
      )



    );
  }
}
