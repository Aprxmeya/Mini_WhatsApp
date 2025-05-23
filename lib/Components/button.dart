import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {

  final void Function()? onTap;
  final String text;

  const mybutton({
    super.key,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .colorScheme
              .secondary,
        ),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(text),
        ), // Center
      ), // Container
    );
  }
}// GestureDetector