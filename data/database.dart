import 'package:hive_flutter/hive_flutter.dart';

class tododatabase {
  List todoList = [];

//reference the box

  final _mybox = Hive.box('mybox');

//run only if first time opening this app
  void createdata() {
    todoList = [
      ["bake cake", false],
      ["go to gym", false]
    ];
  }
//load the data from  database

  void loaddata() {
    todoList = _mybox.get("TODOLIST");
  }

  //update database

  void updatedata() {
    _mybox.put("TODOLIST", todoList);
  }
}
