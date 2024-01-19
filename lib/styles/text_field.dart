import 'package:flutter/material.dart';

class NewTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscure;
  final String hint;
  const NewTextField({super.key, required this.controller, required this.obscure, required this.hint});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white38)
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
        ),
        fillColor: Colors.grey[200],
        filled: true,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white)
      )
    );
  }
}
