

import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
 const CustomTextFeild({super.key, 
    required this.text,
    required this.icon,
    required this.onchanged,
    this.obscureText = false,
  });

final  String text;
final IconData icon;
final  Function(String)? onchanged;
final  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      height: 70,
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          }
          return null;
        },
        onChanged: onchanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(
            fontSize: 20,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.deepPurple,
            size: 26,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
