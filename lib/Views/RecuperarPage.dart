import 'package:flutter/material.dart';
import 'package:oncorte/Model/UserModel.dart';
import 'package:oncorte/Styles/Tema.dart';
import 'package:oncorte/widgets/inputfield.dart';
import 'package:scoped_model/scoped_model.dart';

class RecuperarPage extends StatefulWidget {
  @override
  _RecuperarPageState createState() => _RecuperarPageState();
}

class _RecuperarPageState extends State<RecuperarPage> {
  final _emailController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return Container(
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                colors: [
                  Color.fromRGBO(249, 70, 74, 1.0),
                  Color.fromRGBO(125, 44, 164, 1.0),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                    top: 70,
                    left: 16.0,
                    right: 16.0,
                    bottom: 10.0,
                  ),
                  padding: const EdgeInsets.only(
                    top: 80.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                    color: Colors.white.withOpacity(
                      0.5,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Recuperar Senha",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                            "Enviaremos todas Instruções para Recuperação de Senha em seu E-mail"),
                        const SizedBox(
                          height: 20.0,
                        ),
                        InputField(
                          controller: _emailController,
                          hint: "Informe seu E-mail",
                          obscure: false,
                          teclado: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: mainBg,
                            ),
                            child: Text(
                              "Enviar".toUpperCase(),
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              if (_emailController.text.isEmpty)
                                _scaffoldKey.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Insira seu email para recuperação",
                                    ),
                                    backgroundColor: Colors.redAccent,
                                    duration: Duration(
                                      seconds: 3,
                                    ),
                                  ),
                                );
                              else {
                                model.recuperarSenha(_emailController.text);
                                _scaffoldKey.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text("Confira seu Email"),
                                    backgroundColor: Colors.amber,
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Divider(
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Está com problemas?",
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        GestureDetector(
                          child: Text(
                            "entre em contato".toUpperCase(),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  alignment: Alignment.center,
                  height: 100,
                  child: Image.asset(
                    logo,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
