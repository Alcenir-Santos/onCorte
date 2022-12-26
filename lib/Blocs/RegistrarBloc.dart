import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oncorte/Validacao/RegistrarValidacao.dart';
import 'package:rxdart/rxdart.dart';



enum RegistrarState { SUCCESS, SUCCESSEMPRESA, FAIL, IDLE, CADGOOGLE }

class RegistrarBloc extends BlocBase with RegistrarValidacao {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  final _nomeController = BehaviorSubject<String>();
  final _sobrenomeController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _dtNascimentoController = BehaviorSubject<String>();
  final _cpfController = BehaviorSubject<String>();
  final _cepController = BehaviorSubject<String>();
  final _telefoneController = BehaviorSubject<String>();
  final _estadoController = BehaviorSubject<String>();
  final _cidadeController = BehaviorSubject<String>();
  final _bairroController = BehaviorSubject<String>();
  final _ruaController = BehaviorSubject<String>();
  final _numeroController = BehaviorSubject<String>();
  final _sexoController = BehaviorSubject<int>();
  final _senhaController = BehaviorSubject<String>();
  final _confirmaSenhaController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<RegistrarState>();
  final _dataController = BehaviorSubject<Map>();

  Stream<String> get outNome => _nomeController.stream.transform(validaNome);
  Stream<String> get outSobrenome =>
      _sobrenomeController.stream.transform(validaSobreNome);
  Stream<String> get outEmail => _emailController.stream.transform(validaEmail);
  Stream<String> get outDtNascimento =>
      _dtNascimentoController.stream.transform(validaDtNascimento);
  Stream<String> get outCPF => _cpfController.stream.transform(validaCPF);
  Stream<String> get outCEP => _cepController.stream.transform(validaCEP);
  Stream<String> get outTelefone =>
      _telefoneController.stream.transform(validaTelefone);
  Stream<String> get outEstado =>
      _estadoController.stream.transform(validaEstado);
  Stream<String> get outCidade =>
      _cidadeController.stream.transform(validaCidade);
  Stream<String> get outBairro =>
      _bairroController.stream.transform(validaBairro);
  Stream<String> get outRua => _ruaController.stream.transform(validaRua);
  Stream<String> get outNumero => _numeroController.stream;
  Stream<int> get outSexo => _sexoController.stream;
  Stream<String> get outSenha => _senhaController.stream.transform(validaSenha);
  Stream<String> get outConfirmaSenha =>
      _confirmaSenhaController.stream.transform(validaConfirmaSenha);
  Stream<RegistrarState> get outState => _stateController.stream;
  Stream<Map> get outData => _dataController.stream;

  Stream<bool> get outValidaSenha => Observable.combineLatest2(outSenha, outSenha, (a,b)=> true);

  Function(String) get changeNome => _nomeController.sink.add;
  Function(String) get changeSobrenome => _sobrenomeController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeDtNascimento => _dtNascimentoController.sink.add;
  Function(String) get changeCPF => _cpfController.sink.add;
  Function(String) get changeCEP => _cepController.sink.add;
  Function(String) get changeTelefone => _telefoneController.sink.add;
  Function(String) get changeEstado => _estadoController.sink.add;
  Function(String) get changeCidade => _cidadeController.sink.add;
  Function(String) get changeBairro => _bairroController.sink.add;
  Function(String) get changeRua => _ruaController.sink.add;
  Function(String) get changeNumero => _numeroController.sink.add;
  Function(int) get changeSexo => _sexoController.sink.add;
  Function(String) get changeSenha => _senhaController.sink.add;
  Function(String) get changeConfirmaSenha => _confirmaSenhaController.sink.add;

  StreamSubscription _streamSubscription;

  RegistrarBloc() {
    _streamSubscription =
        FirebaseAuth.instance.onAuthStateChanged.listen((data) async {
      if (data != null) {
        if (await verificaPrivilegios(data) == "Admin") {
          _stateController.add(RegistrarState.SUCCESSEMPRESA);
        } else if (await verificaPrivilegios(data) == "User") {
          _stateController.add(RegistrarState.SUCCESS);
        } else if (await verificaPrivilegios(data) == "Cad") {
          _stateController.add(RegistrarState.CADGOOGLE);
          user = await _auth.currentUser();
        } else {
          _stateController.add(RegistrarState.FAIL);
        }
      } else {
        _stateController.add(RegistrarState.IDLE);
      }
    });
  }
  retornarSexo(var val) {
    _sexoController.add(val);
  }

  registrarEmail() {
    final nome = _nomeController.value;
    final sobreNome = _sobrenomeController.value;
    final email = _emailController.value;
    final dtNascimento = _dtNascimentoController.value;
    final cpf = _cpfController.value;
    final cep = _cepController.value;
    final telefone = _telefoneController.value;
    final estado = _estadoController.value;
    final cidade = _cidadeController.value;
    final bairro = _bairroController.value;
    final rua = _ruaController.value;
    final numero = _numeroController.value;
    final sexo = _sexoController.value;
    final senha = _senhaController.value;
    try {
      if (_stateController.value == RegistrarState.CADGOOGLE) {
        Firestore.instance.collection("Usuarios").document(user.uid).setData({
          "Nome": user.displayName.substring(0, user.displayName.indexOf(" ")),
          "Sobrenome": user.displayName.substring(user.displayName.indexOf(" ") + 1,user.displayName.length),
          "DtNascimento": dtNascimento,
          "CPF": cpf,
          "CEP": cep,
          "Telefone": telefone,
          "Estado": estado,
          "Cidade": cidade,
          "Bairro": bairro,
          "Rua": rua,
          "Numero": numero,
          "Sexo": sexo
        });
        Firestore.instance
            .collection("permissoes")
            .document(user.uid)
            .setData({"TipoPermissao": "User"});
            _stateController.add(RegistrarState.SUCCESS);
      } else {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: senha)
            .then((data) {
          Firestore.instance
              .collection("Usuarios")
              .document(data.user.uid)
              .setData({
            "Nome": nome,
            "Sobrenome": sobreNome,
            "DtNascimento": dtNascimento,
            "CPF": cpf,
            "CEP": cep,
            "Telefone": telefone,
            "Estado": estado,
            "Cidade": cidade,
            "Bairro": bairro,
            "Rua": rua,
            "Numero": numero,
            "Sexo": sexo
          });
          Firestore.instance
              .collection("permissoes")
              .document(data.user.uid)
              .setData({"TipoPermissao": "User"});
        }).catchError((e) {
          _stateController.add(RegistrarState.FAIL);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void loginFacebook() async {
    // var facebookLogin = await FacebookLogin();
    // var facebookLoginResult = 
        // await facebookLogin.logInWithReadPermissions(['email']);
    //  switch (facebookLoginResult.status) {
      // case FacebookLoginStatus.error:
        // print("Error");
        //onLoginStatusChanged(false);
        // break;
      // case FacebookLoginStatus.cancelledByUser:
      //   print("CancelledByUser");
      //   //onLoginStatusChanged(false);
      //   break;
      // case FacebookLoginStatus.loggedIn:
      //   print("LoggedIn");
      //   //onLoginStatusChanged(true);
      //   break;
    // }
  }


Future<FirebaseUser> signInGoogle() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    print(credential.toString());
    user = await _auth.signInWithCredential(credential).then((onValue) {
     
    }).catchError((e) {
      print(e.toString());
    });

    print(user.displayName);
  }

  signInGoogleAccount() {
    _googleSignIn.signOut();
  }
  Future<FirebaseUser> registrarGoogle() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    print(credential.toString());
    user = await _auth.signInWithCredential(credential).then((onValue) {
      Firestore.instance
          .collection("permissoes")
          .document(onValue.user.uid)
          .setData({"TipoPermissao": "Cad"});
    }).catchError((e) {
      print(e.toString());
    });

    print(user.displayName);
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
      return e;
    });
  }

  @override
  void dispose() {
    _nomeController.close();
    _sobrenomeController.close();
    _emailController.close();
    _telefoneController.close();
    _dtNascimentoController.close();
    _cpfController.close();
    _cepController.close();
    _estadoController.close();
    _cidadeController.close();
    _bairroController.close();
    _ruaController.close();
    _numeroController.close();
    _sexoController.close();
    _senhaController.close();
    _confirmaSenhaController.close();
    _dataController.close();

    _streamSubscription.cancel();
  }
}
