import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:oncorte/Blocs/LoginBloc.dart';
import 'package:oncorte/Blocs/RegistrarBloc.dart';
import 'package:oncorte/Core/Assets.dart';
import 'package:oncorte/Styles/Tema.dart';
import 'package:oncorte/Views/HomePage.dart';
import 'package:oncorte/Views/RegistrarPage.dart';
import 'package:oncorte/widgets/inputfield.dart';
import 'package:oncorte/widgets/network_image.dart';
import '../widgets/BottomPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginBloc = LoginBloc();
  final _registrarBloc = RegistrarBloc();
  final _email = TextEditingController();
  final _senha = TextEditingController();

  void initState() {
    super.initState();

    _loginBloc.outState.listen(
      (state) {
        switch (state) {
          case LoginState.SUCCESS:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
            break;
          case LoginState.SUCCESSEMPRESA:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => BottomPage(),
              ),
            );
            break;
          case LoginState.CADUSER:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => RegistrarPage(),
              ),
            );
            break;
          case LoginState.FAIL:
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Erro"),
                content: Text("Voce nao possui privilegios"),
              ),
            );
            break;
          case LoginState.IDLE:
          case LoginState.LOADING:
        }
      },
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  Widget _buildPageContent(BuildContext context) {
    return Container(
      color: Colors.white,
      child: StreamBuilder<LoginState>(
        stream: _loginBloc.outState,
        initialData: LoginState.LOADING,
        builder: (context, snapshot) {
          print(snapshot.data);
          switch (snapshot.data) {
            case LoginState.LOADING:
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Color.fromARGB(255, 4, 125, 141),
                  ),
                ),
              );
            case LoginState.FAIL:
            case LoginState.SUCCESS:
            case LoginState.SUCCESSEMPRESA:
            case LoginState.IDLE:
            case LoginState.CADUSER:
              return ListView(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: CircleAvatar(
                      child: PNetworkImage(onCorteLogo),
                      maxRadius: 50,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Entrar',
                      style: textoNomeSalao(),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  _buildLoginForm(context),
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<bool>(
                    stream: _loginBloc.outSubmitValid,
                    builder: (context, snapshot) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Material(
                            elevation: 15,
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(60),
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                gradient: new LinearGradient(
                                  colors: [
                                    Color(0xFF424242),
                                    Color(0xFF455A64),
                                  ],
                                  begin: const FractionalOffset(0.9, 0.3),
                                  end: const FractionalOffset(0.1, 0.9),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp,
                                ),
                                borderRadius: BorderRadius.circular(60),
                              ),
                              child: TextButton(
                                onPressed:
                                    snapshot.hasData ? _loginBloc.submit : null,
                                child: Text(
                                  "Entrar",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  RegistrarPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Não possue uma conta? RESGISTRE-SE agora!",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black45,
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
          }
        },
      ),
    );
  }

  TextStyle textoNomeSalao() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: mainBg,
      fontSize: 25.0,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle textoDescricao() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.black45,
      fontSize: 15.0,
    );
  }

  TextStyle textoMiniInfo() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.black45,
      fontSize: 12.0,
    );
  }

  Container _buildLoginForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          Material(
            elevation: 15,
            color: Colors.transparent,
            borderRadius: BorderRadiusDirectional.circular(20),
            child: Container(
              height: 320,
              // padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                gradient: new LinearGradient(
                  colors: [
                    Color(0xFF424242),
                    Color(0xFF455A64),
                  ],
                  begin: const FractionalOffset(0.5, 0.0),
                  end: const FractionalOffset(0.5, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
                // color: mainBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          'E-mail',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 140,
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Icon(
                          FontAwesomeIcons.solidEnvelope,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      height: 50.0,
                      decoration: new BoxDecoration(
                        color: Colors.white30,
                        borderRadius: new BorderRadius.circular(6.0),
                      ),
                      child: InputField(
                        controller: _email,
                        obscure: false,
                        teclado: TextInputType.emailAddress,
                        stream: _loginBloc.outEmail,
                        onChanged: _loginBloc.changeEmail,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          'Senha',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 140,
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Icon(
                          FontAwesomeIcons.key,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      height: 50.0,
                      decoration: new BoxDecoration(
                        color: Colors.white30,
                        borderRadius: new BorderRadius.circular(6.0),
                      ),
                      child: InputField(
                        obscure: true,
                        teclado: TextInputType.text,
                        stream: _loginBloc.outSenha,
                        onChanged: _loginBloc.changeSenha,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          right: 20,
                          top: 20,
                        ),
                        alignment: AlignmentDirectional.center,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "    Esqueceu sua senha?    ",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 340,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    elevation: 15,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                    child: GestureDetector(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffff4645),
                              Color(0xffff9997),
                            ],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      // onTap: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute<void>(
                      //     builder: (BuildContext context) {
                      //       return RegistrarPage();
                      //     },
                      //   ),
                      // ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Material(
                    elevation: 15,
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.transparent,
                    child: GestureDetector(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff1346b4),
                              Color(0xff0cb2eb),
                            ],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      onTap: () {
                        // snapshot.hasData
                        //     ? _registrarBloc.initiateFacebookLogin()
                        //     : null;
                        // Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             RegistrarPage()));
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Material(
                    elevation: 15,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                    child: GestureDetector(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF424242),
                              Color(0xFF616161),
                            ],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.userSecret,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      onTap: () {
                        // snapshot.hasData
                        //     ? _registrarBloc.initiateFacebookLogin()
                        //     : null;
                        // Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             RegistrarPage()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }
}
