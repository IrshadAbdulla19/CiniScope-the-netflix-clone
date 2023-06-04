import 'package:flutter/material.dart';

class TopTextWidget extends StatelessWidget {
  final String titile;
  TopTextWidget({super.key, required this.titile});

  @override
  Widget build(BuildContext context) {
    return Text(
      titile,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
