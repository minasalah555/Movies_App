import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$errMessage 🐢🤔',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );
  }
}
