import 'dart:async';

class LoginValidacao {
  final validaEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains("@")) {
      sink.add(email);
    } else {
      sink.addError("Insira um E-mail valido!");
    }
  });
  final validaSenha =
      StreamTransformer<String, String>.fromHandlers(handleData: (senha, sink) {
    if (senha.length > 5) {
      sink.add(senha);
    } else {
      sink.addError("Senha Invalida");
    }
  });
}
