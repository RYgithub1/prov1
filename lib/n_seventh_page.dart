import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_super_state/flutter_super_state.dart';
import 'package:prov1/counter_module.dart';


final store = Store();
// CounterModule(store);
// StoreModule(store);


class SeventhPage extends StatelessWidget {
  const SeventhPage({Key key}) : super(key: key);
  /// [=== build() ===]
  @override
  Widget build(BuildContext context) {
    return StoreProvider(   /// [StoreProvider]
      store: store,

      child: Scaffold(
        appBar: AppBar(
          title: Text("7.StoreProvider"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            IncrementButton(),
            Counter(),
          ],
        )
      ),
    );
  }
}


class IncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ModuleBuilder<CounterModule>(
    return ModuleBuilder<StoreModule>(
      builder: (context, counterModule) =>
          RaisedButton(
            onPressed: () {
              counterModule.store;
            },
            child: Text("INCREMENT"),
          ),
    );
  }
}



class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ModuleBuilder<CounterModule>(
    return ModuleBuilder<StoreModule>(
      builder: (context, counterModule) =>
          // Text(counterModule.counter.toString()),
          Text(counterModule.toString()),
    );
  }
}