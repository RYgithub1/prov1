import 'package:flutter/material.dart';
import 'package:prov1/n_fourth_page.dart';
import 'package:provider/provider.dart';


/// [状態管理をするクラス]
class CalcModel extends ChangeNotifier {  /// [Class T extends ChanegNotifier{} ->]
  int _count = 0;
  void decrement() {
    _count--;
    notifyListeners();   /// [変更通知]
  }
}


class ThirdPage extends StatelessWidget {
  /// [--- build() ---]
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalcModel>(   /// [ChangeNotifierProvider<T>()] #childでaccept可の宣言

      create: (context) => CalcModel(),  /// [Class T extends ChanegNotifier{}]
      // builder: (context) => CalcModel(),  // "v4.0.0"以降builder->createに変更

      child: Scaffold(
        appBar: AppBar(
          title: Text('3.ChangeNotifierProvider<T>()'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FourthPage(),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Calc Discount',
                style: TextStyle(fontSize: 24),
              ),
              Text("What's the discount on this item?"),
              CalcText(),  /// [-> Provider.of<T>()]
            ],
          ),
        ),
        floatingActionButton: Consumer<CalcModel>(   /// [Consumer<T>()] rebuild for ancestor
          // builder: (_, model, __) {
          builder: (context, model, child){
            return FloatingActionButton(
              onPressed: model.decrement,
              tooltip: 'DECREMENT',
              child: Icon(Icons.exposure_minus_1),
            );
          }
        ),
      ),
    );
  }
}


class CalcText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<CalcModel>(context)._count.toString(),   /// [Provider.of<T>()]
      style: Theme.of(context).textTheme.headline4,
    );
  }
}