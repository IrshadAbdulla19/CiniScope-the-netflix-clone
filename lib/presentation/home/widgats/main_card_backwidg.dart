import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/presentation/home/widgats/custom_button.dart';

class MainCardBackWidget extends StatelessWidget {
  const MainCardBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 780,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/home_page_bg_pic.jpg'),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CoustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                ),
                _playArrowButton(),
                CoustomButtonWidget(
                  icon: Icons.info,
                  title: 'Info',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playArrowButton() {
    return TextButton.icon(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhite)),
        onPressed: () {},
        icon: Icon(
          Icons.play_arrow,
          size: 25,
          color: backgrondColorBlack,
        ),
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Play',
            style: TextStyle(fontSize: 20, color: backgrondColorBlack),
          ),
        ));
  }
}
