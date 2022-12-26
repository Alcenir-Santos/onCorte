import 'package:flutter/material.dart';

import '../Styles/Tema.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscure;
  final TextInputType teclado;
  final Stream<String> stream;
  final Function(String) onChanged;
  final TextEditingController controller;

  InputField({
    this.icon,
    this.hint,
    this.obscure,
    this.teclado,
    this.stream,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: stream,
      builder: (context, snapshot) {
        return TextFormField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration.collapsed(hintText: ''),
          keyboardType: teclado,
          obscureText: obscure,
          style: TextStyle(
            fontSize: 16,
            color: mainBg,
          ),
        );
      },
    );
  }
}
