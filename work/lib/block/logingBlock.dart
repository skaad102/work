import 'dart:async';

import 'package:work/block/validatorBlock.dart';
import 'package:rxdart/rxdart.dart';

class LoginBlock with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passController = BehaviorSubject<String>();

  // insertar valores a strem

  Function get inserEmail => _emailController.sink.add;
  Function get inserPass => _passController.sink.add;

  // recuper

  Stream<String> get recEmail =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get recPass => _passController.stream.transform(validarPas);

  // validar formulario
  //
  Stream<bool> get formValid =>
      Rx.combineLatest2(recEmail, recPass, (a, b) => true);

  // obterner ultimo stem
  String get email => _emailController.value;
  String get pass => _passController.value;

  // cerrar
  dispose() {
    _emailController?.close();
    _passController?.close();
  }
}
