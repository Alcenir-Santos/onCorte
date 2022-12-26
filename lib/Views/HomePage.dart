import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oncorte/Styles/Tema.dart';
import 'package:oncorte/Views/LoginPage.dart';
import 'package:oncorte/Views/SaloesPage.dart';
import 'package:oncorte/widgets/MenuLateral.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class HomePage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _pageController = PageController();
  final String _simpleValue1 = '_menu1';
  final String _simpleValue2 = '_menu2';
  final String _simpleValue3 = '_menu3';
  final String _filtro = '';

  void showMenuSelection(String value, ) {
    if (value == _simpleValue1) {
      print(value + ' 1');
      // _saloesLista(value, context);
    } else if (value == _simpleValue2) {
      print(value + ' 2');
    } else {
      print(value + ' 3');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuLateral(),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              color: mainBg,
              width: MediaQuery.of(context).size.width,
              height: 120.0,
              child: Center(
                child: Text(
                  "OnCorte",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 35,
                left: 12,
              ),
              child: IconButton(
                icon: Icon(
                  
                  Icons.menu,
                  color: Colors.white,
                  size: 32,
                ),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                },
              ),
            ),
            _saloesLista(_filtro, context),
            Container(
              margin: EdgeInsets.only(
                top: 95,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white),
                  child: Row(
                    children: [
                      PopupMenuButton<String>(
                        onSelected: showMenuSelection,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: _simpleValue1,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.black45,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Meus Favoritos",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: _simpleValue2,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: Colors.black45,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Mais Próximos",
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: _simpleValue3,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.library_add,
                                  color: Colors.black45,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Alterar Cidade",
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        icon: Icon(
                          Icons.tune,
                          color: mainBg,
                        ),
                        offset: Offset(0, 100),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Procurar Salão",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Color.fromRGBO(2, 26, 88, 1.0),
                        ),
                        onPressed: () {
                          print("your menu action here");
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: Color.fromRGBO(2, 26, 88, 1.0),
                        ),
                        onPressed: () {
                          FirebaseAuth.instance.signOut().then(
                            (e) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_saloesLista(String value, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 120),
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: SaloesPage(),
  );
}
