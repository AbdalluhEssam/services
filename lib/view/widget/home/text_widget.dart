import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  final String title;
  final String value;
  const RowText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text("$title : $value",style: const TextStyle(color: Colors.black),);
  }
}
