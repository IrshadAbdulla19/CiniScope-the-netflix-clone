import 'package:flutter/material.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key,
  });

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
                image: AssetImage(
                    'assets/images/Suraj-Pe-Mangal-Bhari-movie-poster-release-date.jpg'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
