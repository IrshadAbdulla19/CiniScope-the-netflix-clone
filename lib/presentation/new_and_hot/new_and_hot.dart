import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: AppBar(
        title: Text(
          'New & hot',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.cast,
            color: kWhite,
            size: 30,
          ),
          kWidth,
          Container(
            width: 30,
            height: 30,
            color: Colors.blue,
          ),
        ],
      ),
    ));
  }
}
