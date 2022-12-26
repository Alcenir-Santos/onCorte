import 'package:flutter/material.dart';
import 'package:oncorte/Styles/Tema.dart';
import 'package:oncorte/Views/SplashPage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Model/UserModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: 'On Corte',
        theme: ThemeData(
          primaryColor: mainBg,
        ),
        home: SplashPage(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
        ],
      ),
    );
  }
}
