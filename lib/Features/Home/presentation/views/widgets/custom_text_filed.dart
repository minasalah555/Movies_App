import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        prefixIcon: Icon(Icons.search),
        hintText: 'Search Movies ',
        enabledBorder: textBorder(),
        focusedBorder: textBorder(),
      ),
    );
  }

  OutlineInputBorder textBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.blueGrey),
    );
  }
}
