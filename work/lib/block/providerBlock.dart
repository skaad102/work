import 'package:flutter/material.dart';
import 'package:work/block/logingBlock.dart';

class Provider extends InheritedWidget {
  static Provider _instacia;

  factory Provider({Key key, Widget child}) {
    if (_instacia == null) {
      _instacia = Provider._internal(key: key, child: child);
    }
    return _instacia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  final loginBlock = LoginBlock();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBlock of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).loginBlock;
  }
}
