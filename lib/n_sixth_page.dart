import 'package:flutter/material.dart';
import 'package:prov1/n_seventh_page.dart';
import 'package:provider/provider.dart';



class SixthPage extends StatelessWidget {
  /// [=== build() ===]
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ValueNotifier("Previous Fancy"),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "6.ontext.read<ValueNotifier<T>>().value",
            style: TextStyle(fontSize:16),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SeventhPage(),
                ),
              ),
            ),
          ],
        ),
        body: Center(child: ChildWidget1()),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<ValueNotifier<String>>().value = "Latter Fancy";
          },
        ),
      ),
    );
  }
}


/// [--- CHILD widget --- multi net situation]
class ChildWidget1 extends StatelessWidget {
  const ChildWidget1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChildWidget2();
  }
}

class ChildWidget2 extends StatelessWidget {
  const ChildWidget2({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChildWidget3();
  }
}

class ChildWidget3 extends StatelessWidget {
  const ChildWidget3({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _textNotifier = context.watch<ValueNotifier<String>>();
    return Text(_textNotifier.value);
  }
}
