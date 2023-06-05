import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';
import 'package:netflix_demo/presentation/home/widgats/custom_button.dart';
import 'package:netflix_demo/presentation/new_and_hot/widgets/vedio_widget.dart';

class EveryonceWatcingWidget extends StatelessWidget {
  const EveryonceWatcingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text('Friends',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
        kheight,
        Text(
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: kGreyColor),
        ),
        kheight50,
        VedioWidget(),
        kheight,
        Row(
          children: [
            CoustomButtonWidget(
              icon: Icons.send,
              title: 'Share',
              iconSize: 26,
              textSize: 16,
            ),
            kWidth,
            CoustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconSize: 28,
              textSize: 16,
            ),
            kWidth,
            CoustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 28,
              textSize: 16,
            ),
            kWidth,
          ],
        )
      ],
    );
  }
}
