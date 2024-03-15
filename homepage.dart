import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/utilities/dialog_box.dart';
import 'package:todoapp/utilities/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
//reference the hive box

  final _mybox = Hive.box('mybox');

  tododatabase db = tododatabase();

  @override
  void initState() {
    //if the app is running first time
    if (_mybox.get("TODOLIST") == null) {
      db.createdata();
    } else {
      db.loaddata();
    }

    super.initState();
  }

  final _controller = TextEditingController();

//check box was tapped

  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updatedata();
  }

// save new task

  void savenewtask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    db.updatedata();
  }

//create a new task

  void createnewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialogbox(
          controller: _controller,
          onsaved: savenewtask,
          oncancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task

  void deltask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updatedata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 160, 123, 223),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('TO DO'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewtask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return Todotile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => checkboxchanged(value, index),
            deletetask: (context) => deltask(index),
          );
        },
      ),
    );
  }
}
