import 'package:flutter/material.dart';
import 'package:prov1/model_prov1.dart';
import 'package:prov1/model_prov2.dart';
import 'package:prov1/n_first_page.dart';
import 'package:provider/provider.dart';
import 'model_change.dart';


void main(List<String> args) {
  runApp(MyToDoApp());
}


class MyToDoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // MultiProvider(
    //   providers: [
    //     Provider<Something>(create: (_) => Something()),
    //     Provider<SomethingElse>(create: (_) => SomethingElse()),
    //     Provider<AnotherThing>(create: (_) => AnotherThing()),
    //   ],
    //   child: someWidget,
    // )
    return MultiProvider(   /// [MULTI = nest]
      providers: [
        // ChangeNotifierProvider(
        ChangeNotifierProvider<ModelChange>(
          create: (context) => ModelChange(),
        ),
        Provider<ModelProv1>(
          // create: (_) => ModelProv1(),
          create: (context) => ModelProv1(),
        ),
        Provider<ModelProv2>(
          create: (context) => ModelProv2(),
        ),
      ],
      child: MaterialApp(
        title: "provider",
        theme: ThemeData.dark(),
        initialRoute: "/",
        routes: {"/": (content) => FirstPage()},
      )
    );
  }
}
