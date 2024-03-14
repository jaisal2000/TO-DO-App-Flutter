import 'package:flutter/material.dart';
import 'package:todoapp/utilities/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List todoList = [
    ["Bake a cake", false],
    ["Go to the GYM", false]
  ];

//check box was tapped

  void checkboxchanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 160, 123, 223),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('TO DO'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Todotile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkboxchanged(value, index),
          );
        },
      ),
    );
  }
}
