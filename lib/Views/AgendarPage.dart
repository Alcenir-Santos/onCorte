import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:date_format/date_format.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model/scoped_model.dart';
import '../Core/Assets.dart';
import '../Model/UserModel.dart';
import '../Styles/Tema.dart';

class AgendarPage extends StatefulWidget {
  @override
  _AgendarPage createState() => _AgendarPage();
  String idSalao;
  String nomeSalao;
  AgendarPage({this.idSalao, this.nomeSalao});
}

class _AgendarPage extends State<AgendarPage> {
  @override
  bool service = false;
  bool date = false;
  bool time = false;
  bool funcionario = false;

  String _time;
  String _service;
  String _funcionario;
  String _idFuncionario;
  String _cliente;

  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  DateTime _date = new DateTime.now();

  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(builder: (
        context,
        child,
        model,
      ) {
        _cliente = "${model.userData["Nome"]}";
        return Scaffold(
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180.0,
                  color: mainBg,
                  child: Center(
                    child: Image(
                      height: 120,
                      width: 120,
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
                    top: 155,
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
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Center(
                            child: ScopedModelDescendant<UserModel>(
                              builder: (
                                context,
                                child,
                                model,
                              ) {
                                return Text(
                                  widget.nomeSalao,
                                  style: textoMiniInfo(),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 200,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        //###################### TILE DATA ######################
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  color: !date ? mainBg : Colors.green,
                                  child: SizedBox(
                                    height: 70,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 12,
                                          child: Center(
                                            child: SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: Image.asset(
                                                "assets/date.png",
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                            height: 80,
                                            width: 3,
                                            child: Container(
                                              color: mainOneQuart,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  height: 70,
                                  child: InkWell(
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Expanded(
                                          flex: 3,
                                          child: !date
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Data",
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.w200),
                                                    )
                                                  ],
                                                )
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Data",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w200),
                                                    ),
                                                    Text(
                                                      formatDate(_date, [
                                                        dd,
                                                        "/",
                                                        mm,
                                                        "/",
                                                        yyyy
                                                      ]),
                                                      style: TextStyle(
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Icon(Icons.chevron_right,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        //###################### TILE SERVIÇOS ######################
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  color: !service ? mainBg : Colors.green,
                                  child: SizedBox(
                                    height: 70,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 12,
                                          child: Center(
                                            child: SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: Image.asset(
                                                "assets/barber_chair.png",
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                            height: 80,
                                            width: 3,
                                            child: Container(
                                              color: mainOneQuart,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  height: 70,
                                  child: InkWell(
                                    onTap: () {
                                      date
                                          ? _showService(context)
                                          : _showSnackbar(
                                              "Selecione uma data para escolher um Serviço",
                                              Colors.green,
                                              3);
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Expanded(
                                          flex: 3,
                                          child: !service
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Serviço",
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.w200),
                                                    )
                                                  ],
                                                )
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Serviço",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w200),
                                                    ),
                                                    Text(
                                                      _service,
                                                      style: TextStyle(
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Icon(Icons.chevron_right,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        //###################### TILE Funcionarios ######################
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  color: !funcionario ? mainBg : Colors.green,
                                  child: SizedBox(
                                    height: 70,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 12,
                                          child: Center(
                                            child: SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: Image.asset(
                                                  "assets/user.png",
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                            height: 80,
                                            width: 3,
                                            child: Container(
                                              color: mainOneQuart,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  height: 70,
                                  child: InkWell(
                                    onTap: () {
                                      service
                                          ? _showFuncionarios(context)
                                          : _showSnackbar(
                                              "Selecione um Serviço para escolher um funcionario",
                                              Colors.green,
                                              3);
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Expanded(
                                          flex: 3,
                                          child: !funcionario
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Funcionario",
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.w200),
                                                    )
                                                  ],
                                                )
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Funcionario",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w200),
                                                    ),
                                                    Text(
                                                      _funcionario,
                                                      style: TextStyle(
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Icon(Icons.chevron_right,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        //###################### TILE HORARIO ######################
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  color: !time ? mainBg : Colors.green,
                                  child: SizedBox(
                                    height: 70,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 12,
                                          child: Center(
                                            child: SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: Image.asset(
                                                  "assets/hora.png",
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                            height: 80,
                                            width: 3,
                                            child: Container(
                                              color: mainOneQuart,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  height: 70,
                                  child: InkWell(
                                    onTap: () {
                                      funcionario
                                          ? _showTime(context)
                                          : _showSnackbar(
                                              "Selecione um funcionario para escolher o horário",
                                              Colors.green,
                                              3);
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Expanded(
                                          flex: 3,
                                          child: !time
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Horário",
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.w200),
                                                    )
                                                  ],
                                                )
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Horário",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w200),
                                                    ),
                                                    Text(
                                                      _time,
                                                      style: TextStyle(
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Icon(Icons.chevron_right,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        //###################### BOTÃO AGENDAR ######################
                        Container(
                            margin: EdgeInsets.only(
                              top: 30.0,
                            ),
                            width: 250,
                            child: ElevatedButton(
                              onPressed: () {
                                if (service && date && time && funcionario) {
                                  _agendarHorario();
                                } else {
                                  _showSnackbar(
                                      "Escolha uma data, serviço, funcionario e um horário para agendar!",
                                      mainBg,
                                      3);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(16),
                                backgroundColor: mainBg,
                              ),
                              child: Text(
                                "Agendar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18.0),
                              ),
                            )),
                        SizedBox(
                          height: 20.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  //###################### FUNÇÃO SELECIONAR DATA ######################
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: new DateTime(2019),
      lastDate: new DateTime(2020),
    );

    if (picked != null && picked != _date) {
      print("Date Selected: ${_date.toString()}");
      setState(() {
        _date = picked;
        date = true;
      });
    }
  }

  //###################### FUNÇÃO SELECIONAR HORÁRIO ######################
  _showTime(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Selecione um Horário",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w200)),
                  SizedBox(height: 8.0),
                  FutureBuilder<QuerySnapshot>(
                    future: Firestore.instance
                        .collection("Cidades")
                        .document("São Gabriel da Palha")
                        .collection("Saloes")
                        .document(widget.idSalao)
                        .collection("Funcionarios")
                        .document(_idFuncionario)
                        .collection("Horarios")
                        .orderBy("id")
                        .getDocuments(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.active:
                        case ConnectionState.waiting:
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                              child: CircularProgressIndicator(),
                            ),
                          );
                          break;
                        case ConnectionState.none:
                        case ConnectionState.done:
                          if (!snapshot.hasData) {
                            return SizedBox(
                              height: 80,
                              child: Container(
                                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                child: Center(
                                  child: Text(
                                    "Sem horários disponiveis no momento!",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w200),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return StreamBuilder<QuerySnapshot>(
                                stream: Firestore.instance
                                    .collection("Cidades")
                                    .document("São Gabriel da Palha")
                                    .collection("Saloes")
                                    .document(widget.idSalao)
                                    .collection("Funcionarios")
                                    .document(_idFuncionario)
                                    .collection("Agendamentos")
                                    .snapshots(),
                                builder: (context, snap) {
                                  if (!snap.hasData) {
                                    return SizedBox(
                                      height: 80,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Center(
                                          child: Text(
                                            "Carregando...",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    for (var i = 0;
                                        i < snap.data.documents.length;
                                        i++) {
                                      if (snap.data.documents[i].data["data"] ==
                                          formatDate(_date,
                                              [dd, "/", mm, "/", yyyy])) {
                                        snapshot.data.documents.removeWhere(
                                            (item) =>
                                                item.data["horario"] ==
                                                snap.data.documents[i]
                                                    .data["horario"]);
                                      }
                                    }
                                    return GridView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.all(1.0),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                              mainAxisSpacing: 4.0,
                                              crossAxisSpacing: 4.0,
                                              childAspectRatio: 2.7),
                                      itemCount: snapshot.data.documents.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              time = true;
                                              _time = snapshot
                                                  .data
                                                  .documents[index]
                                                  .data["horario"];
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              color: Colors.green,
                                              child: Padding(
                                                padding: EdgeInsets.all(4),
                                                child: Center(
                                                  child: Text(
                                                    snapshot
                                                        .data
                                                        .documents[index]
                                                        .data["horario"],
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                });
                          }
                      }
                    },
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: EdgeInsets.all(16),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child:
                          Text('Fechar', style: TextStyle(color: Colors.white)))
                ],
              ),
            );
          },
        );
      },
    );
  }

  //###################### FUNÇÃO SELECIONAR SERVIÇOS ######################
  _showService(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Selecione um Serviço",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w200)),
                    SizedBox(height: 8.0),
                    FutureBuilder<QuerySnapshot>(
                      future: Firestore.instance
                          .collection("Cidades")
                          .document("São Gabriel da Palha")
                          .collection("Saloes")
                          .document(widget.idSalao)
                          .collection("Servicos")
                          .getDocuments(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.active:
                          case ConnectionState.waiting:
                            return Center(
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: 16.0, bottom: 16.0),
                                child: CircularProgressIndicator(),
                              ),
                            );
                            break;
                          case ConnectionState.none:
                          case ConnectionState.done:
                            if (!snapshot.hasData) {
                              return SizedBox(
                                height: 80,
                                child: Container(
                                  padding:
                                      EdgeInsets.only(top: 8.0, bottom: 8.0),
                                  child: Center(
                                    child: Text(
                                      "Sem serviços disponiveis no momento!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      setState(() {
                                        service = true;
                                        _service = snapshot.data
                                            .documents[index].data["Servico"];
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    leading: CircleAvatar(
                                      radius: 25.0,
                                      backgroundColor: mainOneQuart,
                                      backgroundImage:
                                          CachedNetworkImageProvider(snapshot
                                              .data
                                              .documents[index]
                                              .data["imagem"]),
                                    ),
                                    title: Text(
                                      snapshot.data.documents[index]
                                          .data["Servico"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    trailing: Column(
                                      children: <Widget>[
                                        Text(
                                          "R\$${snapshot.data.documents[index].data["Valor"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                            "${snapshot.data.documents[index].data["Tempo"]} min")
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                        }
                      },
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: EdgeInsets.all(16),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Fechar',
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              );
            },
          );
        });
  }

  //###################### FUNÇÃO SELECIONAR Funcionario ######################
  _showFuncionarios(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Selecione um Funcionario",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w200)),
                    SizedBox(height: 8.0),
                    FutureBuilder<QuerySnapshot>(
                      future: Firestore.instance
                          .collection("Cidades")
                          .document("São Gabriel da Palha")
                          .collection("Saloes")
                          .document(widget.idSalao)
                          .collection("Funcionarios")
                          .getDocuments(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.active:
                          case ConnectionState.waiting:
                            return Center(
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: 16.0, bottom: 16.0),
                                child: CircularProgressIndicator(),
                              ),
                            );
                            break;
                          case ConnectionState.none:
                          case ConnectionState.done:
                            if (!snapshot.hasData) {
                              return SizedBox(
                                height: 80,
                                child: Container(
                                  padding:
                                      EdgeInsets.only(top: 8.0, bottom: 8.0),
                                  child: Center(
                                    child: Text(
                                      "Sem funcionarios disponiveis no momento!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      setState(() {
                                        funcionario = true;
                                        _funcionario = snapshot
                                            .data.documents[index].data["Nome"];
                                        _idFuncionario = snapshot
                                            .data.documents[index].documentID;
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    leading: CircleAvatar(
                                      radius: 25.0,
                                      backgroundColor: mainOneQuart,
                                      backgroundImage:
                                          CachedNetworkImageProvider(snapshot
                                              .data
                                              .documents[index]
                                              .data["imagem"]),
                                    ),
                                    title: Text(
                                      snapshot
                                          .data.documents[index].data["Nome"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                  );
                                },
                              );
                            }
                        }
                      },
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: EdgeInsets.all(16),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Fechar',
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              );
            },
          );
        });
  }

  //###################### METODO PARA MOSTRAS AS SNACKBAR ######################
  _showSnackbar(String text, Color color, int seconds) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
      duration: Duration(seconds: seconds),
    ));
  }

  //###################### METODO QUANDO DA SUCESSO AO AGENDAR O HORARIO ######################
  _onSuccess() {
    _showSnackbar("Horário agendado com sucesso!", Colors.green, 5);
    setState(() {
      date = false;
      service = false;
      funcionario = false;
      time = false;
      _date = DateTime.now();
      _service = null;
      _funcionario = null;
      _time = null;
    });
  }

  //###################### METODO QUANDO DA ERRO AO AGENDAR O HORARIO ######################
  _onFail() {
    _showSnackbar("Falha ao agendar seu horário. Tente novamente mais tarde!",
        Colors.red, 3);
  }

  _agendarHorario() {
    Firestore.instance
        .collection("Cidades")
        .document("São Gabriel da Palha")
        .collection("Saloes")
        .document(widget.idSalao)
        .collection("Funcionarios")
        .document(_idFuncionario)
        .collection("Agendamentos")
        .document()
        .setData({
      "cliente": _cliente,
      "data": formatDate(_date, [dd, "/", mm, "/", yyyy]),
      "servico": _service,
      "funcionario": _funcionario,
      "horario": _time
    }).then((snapshot) {
      _onSuccess();
    }).catchError((error) {
      _onFail();
    });
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
