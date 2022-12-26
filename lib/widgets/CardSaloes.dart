import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oncorte/Styles/Tema.dart';
import 'package:oncorte/Views/DetalhesSaloes.dart';

class CardSaloes extends StatelessWidget {
  final DocumentSnapshot snapshot;
  final String idSalao;
  CardSaloes(this.snapshot, this.idSalao);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return DetalhesSaloes(snapshot, idSalao);
              },
            ),
          ), // Chamar a tela de Detalhes
          child: Stack(
            children: <Widget>[
              Container(
                height: 100,
                margin: EdgeInsets.only(
                  left: 70.0,
                  top: 7.5,
                  right: 26,
                ),
                decoration: BoxDecoration(
                  color: mainBg, //Painel de Fundo dos salões,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 5.0,
                      offset: Offset(5.0, 5.0),
                    )
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                    90.0,
                    14.0,
                    8.0, 
                    8.0,
                  ),
                  constraints: BoxConstraints.expand(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        (snapshot.data["nome"]).toUpperCase(),
                        style: textocabecalhoStyle(),
                      ),
                      Container(height: 2.0),
                      Text(
                        snapshot.data["endereco"],
                        style: textoNormalStyle(),
                      ),
                      Container(height: 6.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: _valoresSaloes(
                                value: snapshot.data["distancia"],
                                image: 'assets/img/ic_distance.png'),
                          ),
                          Container(width: 32.0),
                          Expanded(
                            flex: 1,
                            child: _valoresSaloes(
                                value: snapshot.data["avaliacao"],
                                image: 'assets/img/star.png'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 24.0,
                  top: 3,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    100.0,
                  ),
                  color: mainBg,
                ),
                child: CircleAvatar(
                  radius: 53.0,
                  backgroundImage: CachedNetworkImageProvider(
                    snapshot.data['perfil'],
                  ),
                ),
                height: 110,
                width: 110,
              )
            ],
          ),
        ),
      ),
    );
  }

  _valoresSaloes({String value, String image}) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            image,
            height: 12.0,
            color: Colors.white,
          ),
          Container(width: 8.0),
          Text(
            value,
            style: textoNormalStyle(),
          ),
        ],
      ),
    );
  }
}

TextStyle textoNormalStyle() {
  return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white70,
      fontWeight: FontWeight.w400,
      fontSize: 12.0);
}

TextStyle textocabecalhoStyle() {
  return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontSize: 17.0,
      fontWeight: FontWeight.w600);
}
