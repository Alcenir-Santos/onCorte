import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Styles/Tema.dart';
import 'package:oncorte/Views/AgendarPage.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalhesSaloes extends StatelessWidget {
  final DocumentSnapshot snapshot;
  final String idSalao;
  // final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  DetalhesSaloes(this.snapshot, this.idSalao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            /* Container superior (Local onde fica a imagen das tesouras) */
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250.0,
              decoration: BoxDecoration(
                color: mainBg,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    snapshot.data['imagemFundo'],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      right: 20.0,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 60.0,
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Icon(
                      Icons.favorite,
                      color: mainBg,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 60.0,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 60.0,
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Icon(
                      Icons.info,
                      color: mainBg,
                    ),
                  ),
                ],
              ),
            ),

            /* Container Centro (Local onde fica o perfil do Salao) */
            Container(
              margin: EdgeInsets.only(
                top: 110.0,
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 240,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                      top: 40.0,
                      left: 20.0,
                      right: 20.0,
                      bottom: 10.0,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      elevation: 5.0,
                      color: Colors.white,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              left: 110,
                              top: 20,
                            ),
                            child: Text(
                              snapshot.data["nome"],
                              style: textoNomeSalao(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 110,
                              top: 55,
                            ),
                            child: Text(
                              snapshot.data["endereco"],
                              style: textoDescricao(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 110,
                              top: 75,
                            ),
                            child: Text(
                              '(27) 99986-6787',
                              style: textoDescricao(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 110,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                //SERVIÇOS
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      "001",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    subtitle: Icon(
                                      Icons.list,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                                //FUNCIONARIOS
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      "001",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    subtitle: Icon(
                                      Icons.group,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                                //SERGUIDORES
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      "001",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    subtitle: Icon(
                                      Icons.favorite,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                                //AVALIAÇÃO
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      snapshot.data['avaliacao'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    subtitle: Icon(
                                      Icons.star,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 120,
              width: 80,
              margin: EdgeInsets.only(
                top: 130,
                left: 40,
              ),
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        snapshot.data['perfil'],
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  margin: EdgeInsets.only(
                    top: 350.0,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    elevation: 3,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          margin: EdgeInsets.only(
                            left: 5,
                            top: 10,
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.pin_drop),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'LOCALIZAÇÃO',
                                        style: textoDescricao(),
                                      ),
                                      Text(
                                        'Vila Comboni - Rua Daniel Comboni, 322',
                                        style: textoMiniInfo(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: mainBg,
                                      size: 18,
                                    ),
                                    onPressed: () {
                                      _BuscarSalaoURL();
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.alternate_email),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'E-MAIL',
                                        style: textoDescricao(),
                                      ),
                                      Text(
                                        'email@provedor.com.br',
                                        style: textoMiniInfo(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.phone),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'TELEFONE',
                                        style: textoDescricao(),
                                      ),
                                      Text(
                                        '2737273727',
                                        style: textoMiniInfo(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 170,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: mainBg,
                                      size: 18,
                                    ),
                                    onPressed: () {
                                      _abrirChamada('2737273727');
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.credit_card),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'FORMAS DE PAGAMENTO',
                                        style: textoDescricao(),
                                      ),
                                      Text(
                                        'Cartão de Crédito',
                                        style: textoMiniInfo(),
                                      ),
                                      Text(
                                        'Cartão de Débito',
                                        style: textoMiniInfo(),
                                      ),
                                      Text(
                                        'Dinheiro',
                                        style: textoMiniInfo(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    elevation: 3,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                              height: 30,
                            ),
                            Text(
                              'Descricao'.toUpperCase(),
                              style: textoDescricao(),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          margin: EdgeInsets.only(
                            left: 5,
                            top: 10,
                          ),
                          child: Text(
                            snapshot.data['descricao'],
                            style: textoMiniInfo(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: imagensSalao(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 220.0,
        child: FloatingActionButton.extended(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return AgendarPage(
                  idSalao:  idSalao,
                  nomeSalao: snapshot.data["nome"],
                );
              },
            ),
          ),
          backgroundColor: mainBg,
          icon: Icon(Icons.calendar_today),
          label: Text(
            "Agendar",
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _abrirChamada(String numero) async {
    String url = "tel:$numero";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _abrirSms(String numero) async {
    String url = "tel:$numero";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _abrirEmail(String email) async {
    String url = "tel:$email";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  TextStyle textoNormalStyle() {
    return TextStyle(
        fontFamily: 'Poppins',
        color: Colors.white60,
        fontWeight: FontWeight.w400,
        fontSize: 12.0);
  }

  TextStyle textTituloStyle() {
    return TextStyle(
        fontFamily: 'Poppins',
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600);
  }

  Container exibirImagemSalao(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      //  MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            snapshot.data['imagemFundo'],
          ),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Container imagensSalao() {
    return Container(
      color: Colors.transparent,
      height: 200.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0),

      // elevation: 10.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              width: 110.0,
              // height: 300.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Material(
                        elevation: 10.0,
                        child: Image(
                          image: CachedNetworkImageProvider(
                            snapshot.data['imagemFundo'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () => exibirImagemSalao(context),
          );
        },
      ),
    );
  }

  Future<Null> _BuscarSalaoURL() async {
    String url = snapshot.data['localizacao'].toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Erro ao buscar localização $url';
    }
  }
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
        Container(
          width: 8.0,
        ),
        Text(
          value,
        ),
      ],
    ),
  );
}

TextStyle textoNomeSalao() {
  return TextStyle(
    fontFamily: 'Poppins',
    color: Colors.black87,
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

// class CallsAndMessagesService {
//   void call(String number) => launch("tel:$number");
//   void sendSms(String number) => launch("sms:$number");
//   void sendEmail(String email) => launch("mailto:$email");
// }

// GetIt locator = GetIt();

// void setupLocator() {
//   locator.registerSingleton(CallsAndMessagesService());
// }
