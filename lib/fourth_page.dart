import 'package:flutter/material.dart';



class FourthPage extends StatefulWidget {   /// [_countのデータ受け渡し管理するにはFul]
  const FourthPage({Key key}) : super(key:key);
  @override
  _FourthPageState createState() => _FourthPageState();
}



class _FourthPageState extends State<FourthPage> {
  var _count = 0;

  /// [=== build() ===]
  @override
  Widget build(BuildContext context) {
    return _InheritedWidget(
      message: _createMessage(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("4th : FizzBuzz_inher"),
          centerTitle: true,
        ),
        body: const _Message(),   /// [rebuild抑制const]
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one),
          onPressed: (){
            setState(() {
              _count++;
            });
            // setState(() => _count++);
          },
        ),
      ),
    );
  }


  /// [calculation]
  String _createMessage() {
    final result = _count % 15 == 0
        ? "${_count} : FizzBuzz"
        : (_count % 3 == 0
            ? "${_count} : Fizz"
            : (_count % 5 == 0
                ? "${_count} : Buzz"
                : "${_count} : ----"
              )
          );
    return result;
  }
}

class _Message extends StatelessWidget{
  const _Message({Key key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "No. ${_InheritedWidget.of(context, listen: true).message}",
              style: TextStyle(fontSize: 44),
            ),
          ],
        );
  }
}



/// [--- sup---]
// class _InheritedWidget {
class _InheritedWidget extends InheritedWidget{
  const _InheritedWidget({
    Key key,
    @required this.message,
    @required Widget child,
  })
  : super(key:key, child:child);

  final String message;

  static _InheritedWidget of(BuildContext context, {@required bool listen}){
    return listen
      ? context.dependOnInheritedWidgetOfExactType<_InheritedWidget>()  /// [監視]
      : context
          .getElementForInheritedWidgetOfExactType<_InheritedWidget>()
          .widget as _InheritedWidget;
  }

  @override
  bool updateShouldNotify(_InheritedWidget old) => message != old.message;

}
