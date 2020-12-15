import 'package:flutter/material.dart';
import 'package:prov1/top_page.dart';
import 'package:provider/provider.dart';
import 'model.dart';


void main(List<String> args) {
  runApp(MyToDoApp());
}


class MyToDoApp extends StatelessWidget {
  const MyToDoApp({Key key}) : super(key: key);

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
    return MultiProvider(   /// [MULTI]
      providers: [
        ChangeNotifierProvider(
          create: (context) => Model(),
        ),
      ],
      child: MaterialApp(
        title: "provider",
        theme: ThemeData.dark(),
        initialRoute: "/",
        routes: {"/": (content) => TopPage()},
      )
    );
  }
}
