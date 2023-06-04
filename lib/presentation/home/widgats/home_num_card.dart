import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';

class HomeNumberCardWidget extends StatelessWidget {
  final int index;
  HomeNumberCardWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: 40,
              ),
              Container(
                // height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: kRadius,
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/Suraj-Pe-Mangal-Bhari-movie-poster-release-date.jpg'),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
          Positioned(
            bottom: 5,
            left: 15,
            child: BorderedText(
              strokeWidth: 7,
              strokeColor: kWhite,
              child: Text(
                '${index + 1}',
                style: TextStyle(
                    color: backgrondColorBlack,
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    decorationColor: kWhite),
              ),
            ),
          )
        ],
      ),
    );
  }
}
