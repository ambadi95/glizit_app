import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final bool obscureText;
  final String? Function(String?)? validator;
  Function(String)? onChanged;

   CommonTextField(
      {super.key,
      this.controller,
      this.label,
      this.obscureText = false,
      this.validator, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey,
          )),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: label,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 15, right: 15),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 2, color: Colors.greenAccent),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
