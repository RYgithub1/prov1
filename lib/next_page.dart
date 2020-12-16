import 'package:flutter/material.dart';
import 'package:prov1/third_page.dart';
import 'package:provider/provider.dart';


// class CountData {   /// [渡すデータのクラス]
//   int count = 0;
// }
class CountData extends ChangeNotifier{   /// [渡すデータ(変更可能)のクラス]
  int count = 0;
  void increment() {
    count = count + 1;
    notifyListeners();   /// [変更通知]
  }
}


class NextPage extends StatelessWidget {
  final countData = CountData();   /// [渡すデータ]
  @override
  Widget build(BuildContext context) {
    /// [渡すデータのクラス と <T> は揃える]
    // return Provider<CountData>.value(   /// [Provider<T>.value()]
    return ChangeNotifierProvider<CountData>.value(   /// [ChangeNotifierProvider<T>.value()]
      value: countData,
      child: Container(
        child: NextPageChild(),
      ),
    );
  }
}


class NextPageChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// [受けるデータのクラス と <T> は揃える]
    final CountData countDataYa = Provider.of<CountData>(context);   /// [Provider.of<T>()]
    return Scaffold(
      appBar: AppBar(title: Text("COUNTER"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// [parentから受けたデータでUI]
            Text('count: ${countDataYa.count.toString()}'),
            RaisedButton(
              child: Text('INCREMENT'),
              onPressed: () {
                countDataYa.increment();   /// [データ更新]
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.fire_extinguisher),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ThirdPage(),
            ),
          ),
      ),
    );
  }
}