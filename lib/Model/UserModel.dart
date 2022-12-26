import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class UserModel extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _usuarioLogado();
  }

  void recuperarSenha(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  bool isLoggedIn() {
    return firebaseUser != null;
  }

  Future<Null> _usuarioLogado() async {
    if (firebaseUser == null) {
      firebaseUser = await _auth.currentUser();
      if (firebaseUser != null) {
        if (userData["Nome"] == null) {
          DocumentSnapshot docUser = await Firestore.instance
              .collection("Usuarios")
              .document(firebaseUser.uid)
              .get();
          userData = docUser.data;
        }
        notifyListeners();
      }
    }
  }
}
