import 'package:flutter/material.dart';
import 'package:prov1/model_change.dart';
import 'package:provider/provider.dart';


class TopPage extends StatelessWidget {
  int indexInt;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){print("BACK");},
          ),
          title: Text("provider gogo"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: (){print("PLAY");},
            ),
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: (){print("PAUSE");},
            ),
          ],
        ),

        body: Consumer<ModelChange>(builder: (context, model, child){
          /// [model.dart/Model()/return todoList -> model]
          return Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 100),
                Text(model.todoList[0]["name"]),
                // Text(model.todoList[1]["name"]),
                // Text(model.todoList[2]["name"]),
                // Text(model.todoList[3]["name"]),
                Text(model.todoList.length == 2
                  ? model.todoList[1]["name"]
                  : "",
                ),
                // Text(model.todoList.length == 3
                //   ? model.todoList[2]["name"]
                //   : "",
                // ),
                // Text(model.todoList.length == 4
                //   ? model.todoList[3]["name"]
                //   : "",
                // ),
                RaisedButton(
                  child: Text("ADD"),
                  onPressed: () {
                    // do something
                    if(model.todoList.length == 1) {
                      model.addTask({"name": "this added"});   /// [To add for next line]
                    }
                  }
                ),
                RaisedButton(
                  child: Text("CHANGE"),
                  onPressed: () {
                    // do something
                    model.changeTask(0, "this changed");   /// [To change line 1st]
                  }
                ),
                RaisedButton(
                  child: Text("REMOVE"),
                  onPressed: () {
                    // do something
                    if(model.todoList.length == 2) {
                      model.removeTask(0);   /// [To remove line 1st]
                    }
                  }
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}