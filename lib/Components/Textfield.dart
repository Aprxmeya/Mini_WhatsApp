import 'package:flutter/material.dart';

class txtfld extends StatelessWidget {
  final String hinttet;
  final bool visible;
  final TextEditingController controller;

  const txtfld({
      super.key,
    required this.hinttet,
    required this.visible,
    required this.controller
  });

  // const txtfld({super,key});default

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30,0,30,0),
      child: TextField(

          obscureText: visible,
          controller: controller,

          decoration: InputDecoration(

          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
            hintText: hinttet,
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            )

        )

      ),
    );

  }
}
