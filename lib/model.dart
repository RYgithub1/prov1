import 'package:flutter/material.dart';


class Model extends ChangeNotifier {

  List<Map> todoList = [
    {"name": "START NOW"},
    // {"id": 1, "name": "pikachu"},
    // {"id": 2, "name": "hitokage"},
    // {"id": 3, "name": "zenigame"},
    // {"id": 4, "name": "hushigidane"},
  ];

  /// [ADD]
  void addTask(Map item) {
    todoList.add(item);
    notifyListeners();   /// [To notice UPDATE]
  }

  /// [CHANGE]
  void changeTask(int index, String item) {
    todoList[index]["name"] = item;
    notifyListeners();   /// [To notice UPDATE]
  }

  /// [REMOVE]
  void removeTask(int index) {
    todoList.removeAt(index);
    notifyListeners();   /// [To notice UPDATE]
  }

  /// [-- RETURN --]
  void getTaskName(int index) {
    return todoList[index]["name"];
  }
}