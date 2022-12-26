import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oncorte/widgets/CardSaloes.dart';

class SaloesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      /* ## Recebendo os icones dos produtos do Firebase ## */
      future: Firestore.instance
          .collection("Cidades")
          .document("São Gabriel da Palha")
          .collection("Saloes")
          .getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          var dividerTitle = ListTile.divideTiles(
                  /* ## Pegando ListTitle e dividindo as Titles ## */
                  context: context,
                  tiles: snapshot.data.documents.map(
                    (doc) {
                      return CardSaloes(doc, doc.documentID);
                    },
                  ).toList(),
                  color: Colors
                      .transparent) /* ## Passando a cor do Divisor - ( Uso obrigatório, caso retirado irá dar erro de exibição ) ## */
              .toList(); /* ## Transformando em Lista ## */
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/screen.png',
                  ),
                  fit: BoxFit.cover,
                ),
                color: Colors.white24,
              ),
              child: ListView(
                /* ## Coloca os dados em uma ListView ## */
                children: dividerTitle,
              ),
            ),
          );
        }
      },
    );
  }
}
