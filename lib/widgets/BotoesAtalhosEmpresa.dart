import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotoesAtalhosEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Material(
              elevation: 15,
              borderRadius: BorderRadius.circular(100),
              color: Colors.transparent,
              child: GestureDetector(
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.userAlt,
                      color: Colors.black38,
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
              height: 10,
            ),
            Text(
              'Clientes',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          children: <Widget>[
            Material(
              elevation: 15,
              borderRadius: BorderRadius.circular(100),
              color: Colors.transparent,
              child: GestureDetector(
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.box,
                      color: Colors.black38,
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
              height: 10,
            ),
            Text(
              'Produtos',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          children: <Widget>[
            Material(
              elevation: 15,
              borderRadius: BorderRadius.circular(100),
              color: Colors.transparent,
              child: GestureDetector(
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.cashRegister,
                      color: Colors.black38,
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
              height: 10,
            ),
            Text(
              'Faturamento',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          children: <Widget>[
            Material(
              elevation: 15,
              borderRadius: BorderRadius.circular(100),
              color: Colors.transparent,
              child: GestureDetector(
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.calculator,
                      color: Colors.black38,
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
              height: 10,
            ),
            Text(
              'Despesas',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          children: <Widget>[
            Material(
              elevation: 15,
              borderRadius: BorderRadius.circular(100),
              color: Colors.transparent,
              child: GestureDetector(
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.gift,
                      color: Colors.black38,
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
              height: 10,
            ),
            Text(
              'Promoções',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
