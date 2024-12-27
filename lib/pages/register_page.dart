import 'package:flutter/material.dart';

import '../Components/Textfield.dart';
import '../Components/button.dart';

class registerpage extends StatelessWidget {

  registerpage({super.key,required this.onTap});

  final TextEditingController ewcontroller = new TextEditingController();
  final TextEditingController pwcontroller = new TextEditingController();
  final TextEditingController cpwcontroller = new TextEditingController();

  void register_method(){}
  final void Function()? onTap;

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
              Text(
                "Lets create an account for you ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 17,
                ),
              ),

              SizedBox(height : 30),

              txtfld(hinttet: "Email",visible: false,controller:ewcontroller ,),

              SizedBox(height: 15),

              txtfld(hinttet: "Password",visible: true,controller:pwcontroller ,),

              SizedBox(height: 15),

              txtfld(hinttet: "Confirm Password",visible: true,controller:cpwcontroller ,),

              SizedBox(height: 30),

              mybutton(text: "Register", onTap: register_method),

              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already a memeber ? ",
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login Now",
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



    );;
  }
}
