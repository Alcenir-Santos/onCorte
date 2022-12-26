import 'dart:async';

/**
 * classe para validações de campos se estao atendendo os requisitos minimos
 */

class RegistrarValidacao {
  final validaNome =
      StreamTransformer<String, String>.fromHandlers(handleData: (nome, sink) {
    if (nome.length != 0) {
      sink.add(nome);
    } else {
      sink.addError("O Nome é obrigatorio");
    }
  });
  final validaSobreNome = StreamTransformer<String, String>.fromHandlers(
      handleData: (sobreNome, sink) {
    if (sobreNome.length != 0) {
      sink.add(sobreNome);
    } else {
      sink.addError("O Sobrenome é obrigatorio");
    }
  });
  final validaEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains("@")) {
      sink.add(email);
    } else {
      sink.addError("O E-mail é obrigatorio");
    }
  });
  final validaDtNascimento =
      StreamTransformer<String, String>.fromHandlers(handleData: (dtNascimento, sink) {
    if (dtNascimento.length != 0) {
      sink.add(dtNascimento);
    } else {
      sink.addError("A Data de Nascimento é obrigatorio");
    }
  });
  final validaCPF =
      StreamTransformer<String, String>.fromHandlers(handleData: (cpf, sink) {
    if (cpf.length != 0) {
      sink.add(cpf);
    } else {
      sink.addError("O CPF é obrigatorio");
    }
  });
  final validaCEP =
      StreamTransformer<String, String>.fromHandlers(handleData: (cep, sink) {
    if (cep.length != 0) {
      sink.add(cep);
    } else {
      sink.addError("O CEP é obrigatorio");
    }
  });
  final validaEstado = StreamTransformer<String, String>.fromHandlers(
      handleData: (estado, sink) {
    if (estado.length != 0) {
      sink.add(estado);
    } else {
      sink.addError("O Estado é obrigatorio");
    }
  });
  final validaCidade = StreamTransformer<String, String>.fromHandlers(
      handleData: (cidade, sink) {
    if (cidade.length != 0) {
      sink.add(cidade);
    } else {
      sink.addError("O Cidade é obrigatorio");
    }
  });
  final validaBairro = StreamTransformer<String, String>.fromHandlers(
      handleData: (bairro, sink) {
    if (bairro.length != 0) {
      sink.add(bairro);
    } else {
      sink.addError("O Bairro é obrigatorio");
    }
  });
  final validaRua =
      StreamTransformer<String, String>.fromHandlers(handleData: (rua, sink) {
    if (rua.length != 0) {
      sink.add(rua);
    } else {
      sink.addError("A Rua é obrigatorio");
    }
  });
  final validaSenha =
      StreamTransformer<String, String>.fromHandlers(handleData: (senha, sink) {
    if (senha.length != 0) {
      sink.add(senha);
    } else {
      sink.addError("A senha é obrigatorio");
    }
  });
  final validaConfirmaSenha = StreamTransformer<String, String>.fromHandlers(
      handleData: (confirmaSenha, sink) {
    if (confirmaSenha.length > 5) {
      sink.add(confirmaSenha);
    } else {
      sink.addError("A confirmação de senha é obrigatorio");
    }
  });
   final validaTelefone = StreamTransformer<String, String>.fromHandlers(
      handleData: (telefone, sink) {
    if (telefone.length > 5) {
      sink.add(telefone);
    } else {
      sink.addError("O telefone é obrigatorio");
    }
  });
  final validaSexo =
      StreamTransformer<String, String>.fromHandlers(handleData: (sexo, sink) {
    if (sexo.contains("-1")) {
      sink.addError("Escolha o Sexo");
    } else {
      sink.add(sexo);
    }
  });
}
