import 'package:flutter/material.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';

class MainCardWidget extends StatelessWidget {
  MainCardWidget({super.key, required this.imgPath});
  String imgPath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 150,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: kRadius,
            image: DecorationImage(
                image: NetworkImage(imgPath), fit: BoxFit.cover)),
      ),
    );
  }
}
