import 'package:flutter/material.dart';


class ModelProv1 extends ChangeNotifier {

  List<Map> todoList = [
    {"name": "START NOW"},
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