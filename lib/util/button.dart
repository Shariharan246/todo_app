import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final String name;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        color: Colors.purple.shade200,
        child: Text(name),
    );
  }
}
