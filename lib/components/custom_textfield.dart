import 'package:flutter/material.dart';

// Dipakai di halaman login dan kolom pencarian.
class CustomTextfield extends StatelessWidget {
  final TextEditingController txtController;
  final String myHint;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  const CustomTextfield({
    super.key,
    required this.txtController,
    required this.myHint,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hint: Text(myHint),
      ),
    );
  }
}
