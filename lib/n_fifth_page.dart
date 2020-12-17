import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class FifthPage extends StatefulWidget {   /// [_countのデータ受け渡し管理するにはFul]
  const FifthPage({Key key}) : super(key:key);
  @override
  _FifthPageState createState() => _FifthPageState();
}



class _FifthPageState extends State<FifthPage> {
  var _count = 1;

  /// [=== build() ===]
  @override
  Widget build(BuildContext context) {
    /// [Provider<T>.value で下位ツリーにデータ受け渡し]
    return Provider<String>.value(   /// [-- Provider<String>.valueへ変更  --]
      value: _createMessage(),   /// [-- create -> value --]
      child: Scaffold(
        appBar: AppBar(
          title: Text("5.Provider<T>.value"),
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
            Text("FIZZBUZZ", style: TextStyle(fontSize: 40)),
            /// [データへのアクセス・監視に Provider.of<T>]
            Text(
              "No. ${Provider.of<String>(context, listen: true)}",   /// [-- Providerに変更 --]
              style: TextStyle(fontSize: 28),
            ),
          ],
        );
  }
}


/// [Providerにより_InheritedWidget classが丸ごと不要になる]
// /// [--- sup---]
// // class _InheritedWidget {
// class _InheritedWidget extends InheritedWidget{
//   const _InheritedWidget({
//     Key key,
//     @required this.message,
//     @required Widget child,
//   })
//   : super(key:key, child:child);

//   final String message;

//   static _InheritedWidget of(BuildContext context, {@required bool listen}){
//     return listen
//       ? context.dependOnInheritedWidgetOfExactType<_InheritedWidget>()  /// [監視]
//       : context
//           .getElementForInheritedWidgetOfExactType<_InheritedWidget>()
//           .widget as _InheritedWidget;
//   }

//   @override
//   bool updateShouldNotify(_InheritedWidget old) => message != old.message;

// }
