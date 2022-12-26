import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oncorte/Core/Assets.dart';
import 'package:oncorte/Model/UserModel.dart';
import 'package:oncorte/Styles/Tema.dart';
import 'package:oncorte/Views/LoginPage.dart';
import 'package:scoped_model/scoped_model.dart';

class MenuLateral extends StatelessWidget {
  final List<String> _cidades = [
    'São Gabriel da Palha',
    'Colatina',
    'São Domingos do Norte'
  ];

  final List<Item> _data = [
    Item(
      title: 'São Gabriel da Palha',
      catagory: "12 Estabelecimentos",
      place: "Singapore",
      ratings: "5.0/80",
      discount: "10 %",
    ),
    Item(
      title: 'São Domingos do Norte',
      catagory: "5 Estabelecimentos",
      place: "Singapore",
      ratings: "4.5/90",
      discount: null,
    ),
    Item(
      title: 'Colatina',
      catagory: "23 Estabelecimentos",
      place: "Singapore",
      ratings: "4.5/90",
      discount: "12 %",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Widget _buildMenuLateral() => Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        );
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: Drawer(
        child: Stack(
          children: <Widget>[
            _buildMenuLateral(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 230.0,
              color: mainBg,
              child: Center(
                child: Image(
                  height: 150,
                  width: 150,
                  image: CachedNetworkImageProvider(oneQuartLogo_vetor),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 30,
                left: 8,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 22,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(
                top: 205,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Material(
                  elevation: 15,
                  color: Colors.transparent,
                  borderRadius: BorderRadiusDirectional.circular(15),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.scatter_plot,
                          color: mainBg,
                          size: 15,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Center(
                            child: ScopedModelDescendant<UserModel>(
                              builder: (
                                context,
                                child,
                                model,
                              ) {
                                return Text(
                                  //${!model.isLoggedIn() ? "" : model.userData["Nome"]}
                                  "Informações",
                                  style: textoMiniInfo(),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.exit_to_app,
                                size: 13,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Sair',
                                style: textoMiniLogof(),
                              ),
                            ],
                          ),
                          onTap: () {
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 290,
              ),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.event_available,
                            color: mainBg,
                            size: 25,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            'Meus Agendamentos',
                            style: textoMiniMenu(),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: mainBg,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      print('object');
                    },
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.notifications,
                            color: mainBg,
                            size: 25,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            'Notificações',
                            style: textoMiniMenu(),
                          ),
                          SizedBox(
                            width: 87,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: mainBg,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      print('object');
                    },
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.edit_location,
                            color: mainBg,
                            size: 25,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            'Alterar Cidade',
                            style: textoMiniMenu(),
                          ),
                          SizedBox(
                            width: 71,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: mainBg,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      showCustomDialogWithImage(context);
                    },
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.person,
                            color: mainBg,
                            size: 25,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            'Minha Conta',
                            style: textoMiniMenu(),
                          ),
                          SizedBox(
                            width: 84,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: mainBg,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      print('object');
                    },
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.edit,
                            color: mainBg,
                            size: 25,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            'Configurações',
                            style: textoMiniMenu(),
                          ),
                          SizedBox(
                            width: 67,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: mainBg,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      print('object');
                    },
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void showCustomDialogWithImage(BuildContext context) {
    Dialog dialogWithImage = Dialog(
      child: Container(
        height: 400.0,
        width: 300.0,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: mainBg),
              child: Text(
                "Alterar Cidade",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 300,
              width: 300,
              child: ListView.builder(
                padding: EdgeInsets.all(6),
                itemCount: _data.length,
                itemBuilder: (BuildContext context, int index) {
                  Item item = _data[index];
                  return GestureDetector(
                    child: Card(
                      elevation: 3,
                      child: Row(
                        children: <Widget>[
                          //
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  item.title,
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  item.catagory,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
              // Container(
              //   child: ListView(
              //     padding: EdgeInsets.all(10.0),
              //     scrollDirection: Axis.vertical,
              //     children: _cidades
              //         .map((data) => CircleAvatar(
              //               minRadius: 50.0,
              //               backgroundColor: Colors.red,
              //               child: Text(data,
              //                   style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 19.0,
              //                   )),
              //             ))
              //         .toList(),
              //   ),
              // ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // RaisedButton(
                //   color: Colors.blue,
                //   onPressed: () {
                //     Navigator.of(context).pop();
                //   },
                //   child: Text(
                //     'Confirmar',
                //     style: TextStyle(fontSize: 18.0, color: Colors.white),
                //   ),
                // ),
                // SizedBox(
                //   width: 20,
                // ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancelar',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );

    showDialog(
        context: context, builder: (BuildContext context) => dialogWithImage);
  }

  TextStyle textoMiniInfo() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: mainBg,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle textoMiniMenu() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle textoMiniLogof() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.black45,
      fontSize: 12.0,
    );
  }
}

class Item {
  final String title;
  final String catagory;
  final String place;
  final String ratings;
  final String discount;

  Item({
    this.title,
    this.catagory,
    this.place,
    this.ratings,
    this.discount,
  });
}
