import 'package:flutter/material.dart';

class InitStateWidget extends StatelessWidget {
  const InitStateWidget({super.key, this.onSubmitted});
  final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(6),
      child: TextField(
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search Movies',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
