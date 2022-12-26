import 'dart:ui';
import 'package:flutter/cupertino.dart';

const Color primary = Color.fromRGBO(28, 146, 210, 1.0);
const Color accent = Color.fromRGBO(28, 146, 210, 1.0);
const Color mainOneQuart = Color.fromRGBO(2, 26, 88, 1.0);
const Color mainBg = Color(0xFF424242);
const Color mainDisable = Color.fromRGBO(195, 76, 108, 1.0);
const Color loginGradientStart = Color.fromRGBO(249, 70, 74, 1.0);
const Color loginGradientEnd = Color.fromRGBO(125, 44, 164, 1.0);
const Color mainBorder = Color(0xFFFFFFFF);
const primaryGradient = const LinearGradient(
  colors: const [loginGradientStart, loginGradientEnd],
  stops: const [0.5, 1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

final List<Color> introBackground = [
  Color(0xff452650),
  Color(0xff009688),
  Color(0xff3F51B5)
];

const String logo = "assets/Controle.png";
const String imgBackground = "assets/back2.png";
const String msgRelembrar =
    "Enviaremos o Código de Confirmação por SMS \nPor favor, digite seu número de celular abaixo.";
const String sNomeApp = "OnCorte";

class Cores {
  const Cores();
  static const Color loginGradientStart = Color.fromRGBO(249, 70, 74, 1.0);
  static const Color loginGradientEnd = Color.fromRGBO(125, 44, 164, 1.0);
  // static const Color loginGradientStart = const Color(0xFFfbab66);
  // static const Color loginGradientEnd = const Color(0xFFf7418c);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
