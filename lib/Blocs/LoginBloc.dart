import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:oncorte/Validacao/LoginValidacao.dart';

enum LoginState { IDLE, LOADING, SUCCESS, FAIL, SUCCESSEMPRESA, CADUSER }

class LoginBloc extends BlocBase with LoginValidacao {
  final _emailController = BehaviorSubject<String>();
  final _senhaController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<LoginState>();
  

  Stream<String> get outEmail => _emailController.stream.transform(validaEmail);
  Stream<String> get outSenha => _senhaController.stream.transform(validaSenha);
  Stream<LoginState> get outState => _stateController.stream;

  Stream<bool> get outSubmitValid =>
      Observable.combineLatest2(outEmail, outSenha, (a, b) => true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeSenha => _senhaController.sink.add;

  StreamSubscription _streamSubscription;

  LoginBloc() {
    _streamSubscription =
        FirebaseAuth.instance.onAuthStateChanged.listen((data) async {
      if (data != null) {
        if (await verificaPrivilegios(data) == "Admin") {
          _stateController.add(LoginState.SUCCESSEMPRESA);
        } else if (await verificaPrivilegios(data) == "User") {
          _stateController.add(LoginState.SUCCESS);
        } else if (await verificaPrivilegios(data) == "Cad") {
          _stateController.add(LoginState.CADUSER);
        } else {
          FirebaseAuth.instance.signOut();
          _stateController.add(LoginState.FAIL);
        }
      } else {
        _stateController.add(LoginState.IDLE);
      }
    });
  }

  submit() {
    final email = _emailController.value;
    final senha = _senhaController.value;
    print(email + " " + senha);
    _stateController.add(LoginState.LOADING);

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .catchError((e) {
      _stateController.add(LoginState.FAIL);
    });
  }

  Future<String> verificaPrivilegios(FirebaseUser user) async {
    return await Firestore.instance
        .collection("permissoes")
        .document(user.uid)
        .get()
        .then((snapshot) {
      for (var item in snapshot.data.values) {
        return item;
      }
    }).catchError((e) {
      return false;
    });
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  Future<FirebaseUser> signInGoogle() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    user = await _auth.signInWithCredential(credential).then((onValue) {
      if (verificaCadastro(onValue.user.uid) != "User" ||
          verificaCadastro(onValue.user.uid) != "Admin") {
        _stateController.add(LoginState.CADUSER);
      }
    }).catchError((e) {
      print(e.toString());
    });

    print(user.displayName);
  }

  signInGoogleAccount() {
    _googleSignIn.signOut();
  }

  verificaCadastro(String user) async {
    return await Firestore.instance
        .collection("permissoes")
        .document(user)
        .get()
        .then((snapshot) {
      return snapshot.data.values;
    }).catchError((e) {
      return e;
    });
  }

  @override
  void dispose() {
    _emailController.close();
    _senhaController.close();
    _stateController.close();

    _streamSubscription.cancel();
  }
}
