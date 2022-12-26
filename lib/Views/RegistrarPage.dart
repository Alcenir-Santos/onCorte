// Navigator.pop(context);

import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:oncorte/Blocs/RegistrarBloc.dart';
import 'package:oncorte/Styles/Tema.dart';

import '../widgets/inputfield.dart';

class RegistrarPage extends StatelessWidget {
  final _registrarBloc = RegistrarBloc();
  PersonData person = PersonData();

  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();
  final _UsNumberTextInputFormatter _phoneNumberFormatter =
      _UsNumberTextInputFormatter();

  String _value = '';

  Future _selectDate() async {}

  Widget _buildPageContent(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: mainBg,
                        size: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Crie sua Conta',
                    style: textoNomeSalao(),
                  ),
                ],
              )),
          _buildLoginForm(context),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Material(
                  elevation: 5,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(60),
                  child: Container(
                    width: 35,
                    height: 35,
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
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: Material(
                  elevation: 5,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(60),
                  child: Container(
                    width: 35,
                    height: 35,
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
                ),
                onTap: () {},
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: Material(
                  elevation: 5,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(60),
                  child: Container(
                    width: 35,
                    height: 35,
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
                ),
                onTap: () {},
              ),
              SizedBox(
                width: 15,
              ),
              StreamBuilder<bool>(
                stream: _registrarBloc.outValidaSenha,
                builder: (context, snapshot) {
                  return Material(
                    elevation: 5,
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
                          begin: const FractionalOffset(0.5, 0.0),
                          end: const FractionalOffset(0.5, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp,
                        ),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: TextButton(
                        onPressed: snapshot.hasData
                            ? _registrarBloc.registrarEmail
                            : null,

                        //_registrarBloc.registrarEmail();
                        //Navigator.pop(context);

                        child: Text(
                          "Cadastrar",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
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
              height: 500,
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
                          'Nome',
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
                          FontAwesomeIcons.solidUser,
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
                          obscure: false,
                          teclado: TextInputType.text,
                          stream: _registrarBloc.outNome,
                          onChanged: _registrarBloc.changeNome,
                        )),
                  ),
                  SizedBox(
                    height: 6.0,
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
                          obscure: false,
                          teclado: TextInputType.emailAddress,
                          stream: _registrarBloc.outEmail,
                          onChanged: _registrarBloc.changeEmail,
                        )),
                  ),
                  SizedBox(
                    height: 6.0,
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
                        stream: _registrarBloc.outSenha,
                        onChanged: _registrarBloc.changeSenha,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 17),
                        child: Text(
                          'Celular',
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
                          FontAwesomeIcons.phone,
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
                          obscure: false,
                          teclado: TextInputType.text,
                          stream: _registrarBloc.outTelefone,
                          onChanged: _registrarBloc.changeTelefone,
                        )),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 17),
                        child: Text(
                          'Cidade',
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
                          Icons.location_on,
                          color: Colors.white,
                          size: 24,
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
                          obscure: false,
                          teclado: TextInputType.text,
                          stream: _registrarBloc.outCidade,
                          onChanged: _registrarBloc.changeCidade,
                        )),
                  ),
                  SizedBox(
                    height: 10.0,
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

class PersonData {
  String name = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          dragStartBehavior: DragStartBehavior.down,
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            semanticLabel: _obscureText ? 'show password' : 'hide password',
          ),
        ),
      ),
    );
  }
}

class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 3) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 2) + ') ');
      if (newValue.selection.end >= 2) selectionIndex += 2;
    }
    if (newTextLength >= 8) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 8) + '-');
      if (newValue.selection.end >= 7) selectionIndex++;
    }
    if (newTextLength >= 12) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 11) + ' ');
      if (newValue.selection.end >= 11) selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
