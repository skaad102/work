import 'dart:async';

class Validators {
  final validarPas = StreamTransformer<String, String>.fromHandlers(
      handleData: (pasword, sink) {
    if (pasword.length >= 6) {
      sink.add(pasword);
    } else {
      sink.addError('Debe ser mayor a 6 caracteres');
    }
  });

  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(pattern);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email incorrecto');
    }
  });
}
