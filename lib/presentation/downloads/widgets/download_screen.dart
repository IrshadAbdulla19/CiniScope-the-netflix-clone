import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';
import 'package:netflix_demo/presentation/widgets/app_bar_widget.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({super.key});

  final _widgetList = [const _SmartWidget(), Section2(), const Section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: 'Downloads',
            )),
        body: ListView.separated(
            padding: EdgeInsets.all(15),
            itemBuilder: (cntx, indx) {
              return _widgetList[indx];
            },
            separatorBuilder: (cntx, indx) {
              return SizedBox(
                height: 50,
              );
            },
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  var images = [
    'assets/images/download.jpg',
    'assets/images/shubh-mangal-zyada-saavdhan-movie-star-cast-release-date-poster.jpg',
    'assets/images/Suraj-Pe-Mangal-Bhari-movie-poster-release-date.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'Introduction Downloads for you',
          style: TextStyle(
              color: kWhite, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kheight,
        Text(
          'We will download personlised selectionsed moives and shows for you so there is somthing to watch on your \n divice',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.43,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              DownloadsImageWidget(
                image: images[0],
                margin: EdgeInsets.only(left: 130),
                angle: 20,
                size: Size(size.width * 0.4, size.width * 0.68),
              ),
              DownloadsImageWidget(
                image: images[1],
                margin: EdgeInsets.only(right: 130),
                angle: -20,
                size: Size(size.width * 0.4, size.width * 0.68),
              ),
              DownloadsImageWidget(
                image: images[2],
                margin: EdgeInsets.only(left: 0),
                size: Size(size.width * 0.4, size.width * 0.68),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              color: buttonColorBlue,
              onPressed: () {},
              child: Text(
                'Set up',
                style: TextStyle(
                    color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),
              )),
        ),
        MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            color: kWhite,
            onPressed: () {},
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: backgrondColorBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}

class _SmartWidget extends StatelessWidget {
  const _SmartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhite,
        ),
        kWidth,
        Text('Start Downloads')
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  DownloadsImageWidget(
      {super.key,
      this.angle = 0,
      required this.image,
      required this.margin,
      required this.size});

  double angle;
  final String image;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
          )),
    );
  }
}
