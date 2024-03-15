import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/utilities/mybutton.dart';

class Dialogbox extends StatelessWidget {
  final controller;

  VoidCallback onsaved;
  VoidCallback oncancel;
  Dialogbox(
      {super.key,
      required this.controller,
      required this.onsaved,
      required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),

            //button save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save
                Mybuutton(text: "Save", onPressed: onsaved),

                const SizedBox(width: 12),

                //cancel
                Mybuutton(text: "Cancel", onPressed: oncancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
