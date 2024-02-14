import 'package:flutter/material.dart';
import 'package:todo_app/util/button.dart';
class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final  VoidCallback onCancel;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple.shade100,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration:
              InputDecoration(
                  border: OutlineInputBorder(),
                hintText: ("Add a new task"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(name: "Save", onPressed: onSave ),
                const SizedBox(width: 8,),
                MyButton(name: "Cancel", onPressed: onCancel ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
