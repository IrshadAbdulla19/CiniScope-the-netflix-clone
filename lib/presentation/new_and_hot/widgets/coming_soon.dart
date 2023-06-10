import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';
import 'package:netflix_demo/presentation/home/widgats/custom_button.dart';
import 'package:netflix_demo/presentation/new_and_hot/widgets/vedio_widget.dart';

class ComingSoonMainWidget extends StatelessWidget {
  ComingSoonMainWidget(
      {super.key,
      required this.date,
      required this.content,
      required this.titile,
      required this.imgPath});
  String? date;
  String? titile;
  String? content;
  String? imgPath;

  String mnth = '';
  String day = '';
  String? one;
  String? ten;

  @override
  Widget build(BuildContext context) {
    if (date != null) {
      one = date?[5];
      ten = date?[6];
      mnth = "${one}${ten}";
    } else {
      mnth = '12';
    }
    if (date != null) {
      one = date?[8];
      ten = date?[9];
      day = "${one}${ten}";
    } else {
      mnth = '24';
    }
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        kheight,
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                mnth,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                day,
                style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 60,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VedioWidget(
                imgPth: imgPath,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      titile ?? "Movie Name",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      CoustomButtonWidget(
                        icon: Icons.all_out_sharp,
                        title: 'Remind me',
                        iconSize: 20,
                        textSize: 10,
                      ),
                      kWidth,
                      CoustomButtonWidget(
                        icon: Icons.info,
                        title: 'Info',
                        iconSize: 20,
                        textSize: 10,
                      ),
                    ],
                  )
                ],
              ),
              kheight,
              Text(titile ?? "Movie name",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              kheight,
              Text(
                content ??
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                maxLines: 8,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: kGreyColor),
              )
            ],
          ),
        )
      ],
    );
  }
}
