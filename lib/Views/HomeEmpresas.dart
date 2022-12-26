import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeEmpresas extends StatefulWidget {
  @override
  _NewHome createState() => _NewHome();
}

class _NewHome extends State<HomeEmpresas> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final List<Item> _data = [
    Item(
      cliente: 'Itamar Filho',
      servico: "Corte desfarçado",
      data: "17/12/2019",
      hora: "09:35",
      valor: "R\$ 25,00",
    ),
    Item(
      cliente: 'Eduardo Cometti',
      servico: "Corte desfarçado",
      data: "17/12/2019",
      hora: "09:35",
      valor: "R\$ 25,00",
    ),
    Item(
      cliente: 'Alcenir Colodetti',
      servico: "Corte desfarçado",
      data: "17/12/2019",
      hora: "09:35",
      valor: "R\$ 25,00",
    ),
  ];

  final _Paginas = <Widget>[
    Tab(
      icon: Icon(
        FontAwesomeIcons.home,
        size: 16.0,
      ),
    ),
    Tab(
      icon: Icon(
        FontAwesomeIcons.calendar,
        size: 16.0,
      ),
    ),
    Tab(
      icon: Icon(
        FontAwesomeIcons.moneyBillAlt,
        size: 16.0,
      ),
    ),
    Tab(
      icon: Icon(
        FontAwesomeIcons.edit,
        size: 16.0,
      ),
    ),
  ];

  /*
		  Todo a screen foi dividida em três 'Containers', 
		  1º Container - Container superior, onde fica todas as informçaões de faturamento e fluxo de cliente do mês vigente.
		  2° Container - Container inferior, responsavel por abrigar a listview com os agendamentos do Salão.
		  3° Container - Container central, responsavel por abrigar os 'Cards' com ações rapidas sobre informações do Salão.
		  */

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      // drawer: MenuLateral(),
      body: Stack(
        children: <Widget>[
          /*
		  1º Container - (Superior)
		  */

          Container(
            width: MediaQuery.of(context).size.width,
            height: 480,
            color: Colors.black,
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 25,
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.tune,
                        color: Colors.white54,
                      ),
                      SizedBox(width: 15),
                      GestureDetector(
                        child: AutoSizeText(
                          'Terça, 23, Dezembro',
                          style: _textoTextMes(),
                        ),
                        onTap: () {},
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.notifications,
                        color: Colors.white54,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 2 - 1,
                    top: SizeConfig.blockSizeVertical * 9,
                  ),
                  height: 100,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 9,
                  ),
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2 - 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Faturamento',
                        style: _textoInformacoesMini(),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "R\$ 1.345,50",
                        style: _textoValorDestaque(),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'R\$ 10.345,50',
                        style: _textoInformacoesMini(),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 9,
                    left: MediaQuery.of(context).size.width / 2 + 1,
                  ),
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2 - 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Fluxo de Clientes',
                        style: _textoInformacoesMini(),
                      ),
                      SizedBox(height: 15),
                      Text(
                        '0053',
                        style: _textoValorDestaque(),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '413',
                        style: _textoInformacoesMini(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /*
		  2° Container - (Inferior)
		  */

          Container(
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 39),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: Colors.white,
            ),
            child: Container(
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 25,
              ),
              // height: 300,
              // width: 300,
              child: ListView.builder(
                padding: EdgeInsets.all(6),
                itemCount: _data.length,
                itemBuilder: (BuildContext context, int index) {
                  Item item = _data[index];
                  return GestureDetector(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.white,
                          height: 122,
                          width: MediaQuery.of(context).size.width - 20,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  //=====================
                                  Container(
                                    margin: EdgeInsets.only(top: 10, left: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      color: _corPadrao,
                                    ),
                                    height: 40,
                                    width: 40,
                                    child: Center(
                                      child: Icon(
                                        item.icone,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
//=====================
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        // margin: EdgeInsets.only(top: 13),
                                        child: Text(
                                          item.cliente,
                                          style: _textoValorDestaque(),
                                        ),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(
                                        //   top: 105,
                                        //   left: 15,
                                        // ),
                                        child: Text(
                                          item.servico,
                                          style: _textoInformacoesMini(),
                                        ),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(
                                        //   top: 145,
                                        //   left: 15,
                                        // ),
                                        child: Text(
                                          item.data,
                                          style: _textoInformacoesMini(),
                                        ),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(
                                        //   top: 145,
                                        //   left: 15,
                                        // ),
                                        child: Text(
                                          item.hora,
                                          style: _textoInformacoesMini(),
                                        ),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(
                                        //   top: 145,
                                        //   left: 15,
                                        // ),
                                        child: Text(
                                          item.valor,
                                          style: _textoInformacoesMini(),
                                        ),
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
                        Container(
                          // margin: EdgeInsets.only(top: 81),
                          height: 1,
                          color: Colors.black38,
                          width: MediaQuery.of(context).size.width - 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
//                       onTap: () {},
                    // child: CardAgendamento(
                    //   icone: FontAwesomeIcons.cut,
                    //   cliente: item.cliente,
                    //   servico: item.servico,
                    //   data: item.data,
                    //   hora: item.hora,
                    //   valor: item.valor,
                    // ),
                    //  child: Card(
                    //     elevation: 3,
                    //     child: Row(
                    //       children: <Widget>[
                    //         //
                    //         Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.start,
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: <Widget>[
                    //               Text(
                    //                 item.cliente,
                    //                 style: TextStyle(
                    //                     color: Colors.deepOrange,
                    //                     fontWeight: FontWeight.w700,
                    //                     fontSize: 17),
                    //               ),
                    //               SizedBox(
                    //                 height: 10,
                    //               ),
                    //               Text(
                    //                 item.servico,
                    //                 style: TextStyle(
                    //                     fontSize: 14, color: Colors.black87),
                    //               ),
                    //             ],
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    onTap: () {},
                  );
                },
              ),
            ),
          ),

          /*
				Os dois Container abaixo servem somente para exibir a mensagem "Agendamentos" 
		  */

          Container(
            margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 54, left: 25),
            child: Text(
              'Agendamentos',
              style: _textoTituloDestaque(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 54, left: 25, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  Icons.expand_more,
                  color: Colors.black45,
                ),
              ],
            ),
          ),

          /*
		  3° Container - (Central)
		  */

          /*
			'CardContainer' é uma classe que recebe argumentos para montar os cards exibidos no Container Central
			
			Forma de Uso:
			 
			 CardContainer(
				icone: Icons.(Icone Desejado),
				titulo: 'Titulo do Card, o mesmo sera exibido ao lado do Icone',
				cor: 'Cor em Hexadecial que será usada no fundo do Container',
				destaque: 'Texto em destaque no Container, o mesmo deve ser de no maximo 7 caracteres',
				observacao: 'Texto com opacidade reduzida que sera exibido em baixo do testo com destaque',
			),
			
		  */

          Container(
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 28),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  CardContainer(
                    icone: FontAwesomeIcons.gift,
                    titulo: 'Promo',
                    cor: '452650',
                    destaque: '23',
                    observacao: '05/12 - 15/12',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CardContainer(
                    icone: FontAwesomeIcons.cut,
                    titulo: 'Serviços',
                    cor: 'FF8C00',
                    destaque: '30',
                    observacao: 'R\$ 1.045,00',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CardContainer(
                    icone: Icons.card_giftcard,
                    titulo: 'Despesa',
                    cor: '8B0000',
                    destaque: '7',
                    observacao: 'R\$ 897,00',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _corPadrao = Color.fromRGBO(0, 22, 122, 1.0);

  TextStyle _textoCardBox() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _textoTextMes() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white54,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _textoValorDestaque() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _textoTituloDestaque() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.black45,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _textoInformacoesMini() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white54,
      fontSize: 12.0,
    );
  }
}

class CardContainer extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String destaque;
  final String observacao;
  final String cor;

  CardContainer({
    this.icone,
    this.titulo,
    this.destaque,
    this.observacao,
    this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            color: _getColorFromHex(cor)),
        height: SizeConfig.blockSizeVertical * 25,
        width: SizeConfig.blockSizeHorizontal * 32,
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      color: Colors.white),
                  height: 40,
                  width: 40,
                  child: Center(
                    child: Icon(
                      icone,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  margin: EdgeInsets.only(top: 13),
                  child: Text(
                    titulo,
                    style: _textoCardBox(),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 13,
                left: 15,
              ),
              child: Text(
                destaque,
                style: _textoValorDestaque(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 20,
                left: 15,
              ),
              child: Text(
                observacao,
                style: _textoInformacoesMini(),
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }

  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  Color _corPadrao = Color.fromRGBO(0, 22, 122, 1.0);

  TextStyle _textoCardBox() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontSize: SizeConfig.blockSizeVertical * 2,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _textoTextMes() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white54,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _textoValorDestaque() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontSize: SizeConfig.blockSizeVertical * 6,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _textoInformacoesMini() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white54,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    );
  }
}

class CardAgendamento extends StatelessWidget {
  final IconData icone;
  final String cliente;
  final String hora;
  final String data;
  final String servico;
  final String valor;

  CardAgendamento({
    this.icone,
    this.cliente,
    this.servico,
    this.hora,
    this.data,
    this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            height: 122,
            width: MediaQuery.of(context).size.width - 20,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    //=====================
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: _corPadrao,
                      ),
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Icon(
                          icone,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          // margin: EdgeInsets.only(top: 13),
                          child: Text(
                            cliente,
                            style: _textoValorDestaque(),
                          ),
                        ),
                        Container(
                          child: Text(
                            servico,
                            style: _textoInformacoesMini(),
                          ),
                        ),
                        Container(
                          child: Text(
                            data,
                            style: _textoInformacoesMini(),
                          ),
                        ),
                        Container(
                          child: Text(
                            hora,
                            style: _textoInformacoesMini(),
                          ),
                        ),
                        Container(
                          child: Text(
                            valor,
                            style: _textoInformacoesMini(),
                          ),
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
          Container(
            // margin: EdgeInsets.only(top: 81),
            height: 1,
            color: Colors.black38,
            width: MediaQuery.of(context).size.width - 30,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      onTap: () {},
    );
  }
  /*
  #-# Função para receber uma String de corres, a mesma pode ser usada em qualquer situação.
  Ela recebe uma string de cor Hexadecial ou popularmente falando, correr em HTML
  Sugiro em utilizem o site 'https://site112.com/tabela-cores-html'para códigos de cores, mas pode ser usado qualquer outro
  
  Forma de Uso:
  
  ...(
  color: _getColorFromHex('00BFFF'),
  )...
  
 */

  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  Color _corPadrao = Color.fromRGBO(0, 22, 122, 1.0);

  TextStyle _textoCardBox() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _textoTextMes() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.black54,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _textoValorDestaque() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.black54,
      fontSize: 19.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _textoInformacoesMini() {
    return TextStyle(
      fontFamily: 'Poppins',
      color: Colors.black26,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    );
  }
}

class Item {
  final IconData icone;
  final String cliente;
  final String servico;
  final String hora;
  final String data;
  final String valor;

  Item({
    this.icone,
    this.cliente,
    this.servico,
    this.valor,
    this.hora,
    this.data,
  });
}

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}
