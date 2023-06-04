import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';

class CoustomButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  CoustomButtonWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhite,
          size: 30,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
