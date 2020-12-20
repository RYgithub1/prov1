import 'package:flutter_super_state/flutter_super_state.dart';


class CounterModule extends StoreModule {
  var counter = 0;

  CounterModule(Store store) : super(store);

  void increment(){
    setState((){
      counter++;
    });
  }

}