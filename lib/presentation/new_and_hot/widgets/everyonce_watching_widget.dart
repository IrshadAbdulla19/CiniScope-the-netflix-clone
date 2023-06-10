import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';
import 'package:netflix_demo/presentation/home/widgats/custom_button.dart';
import 'package:netflix_demo/presentation/new_and_hot/widgets/vedio_widget.dart';

class EveryonceWatcingWidget extends StatelessWidget {
  EveryonceWatcingWidget(
      {super.key,
      required this.title,
      required this.content,
      required this.imgPath});
  String? title;
  String? content;
  String? imgPath;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(title ?? 'Movie name',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
        kheight,
        Text(
          content ??
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
          maxLines: 8,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: kGreyColor),
        ),
        kheight50,
        VedioWidget(
          imgPth: imgPath,
        ),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
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
