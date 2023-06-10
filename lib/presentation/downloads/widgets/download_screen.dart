import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_demo/core/api_constant.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';
import 'package:netflix_demo/domain/downloads/popular_for_downloads.dart';
import 'package:netflix_demo/domain/popular/result.dart';

import 'package:netflix_demo/presentation/widgets/app_bar_widget.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({super.key});

  final _widgetList = [const _SmartWidget(), Section2(), const Section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
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
              return const SizedBox(
                height: 50,
              );
            },
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  var images = [];

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
            child: FutureBuilder(
                future: popularForDownloads(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Result>> snapshot) {
                  return snapshot.hasData
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: size.width * 0.43,
                              backgroundColor: Colors.grey.withOpacity(0.5),
                            ),
                            DownloadsImageWidget(
                              image:
                                  "${imgBaseUrl}${snapshot.data![1].posterPath}",
                              margin: EdgeInsets.only(left: 130),
                              angle: 20,
                              size: Size(size.width * 0.4, size.width * 0.68),
                            ),
                            DownloadsImageWidget(
                              image:
                                  "${imgBaseUrl}${snapshot.data![2].posterPath}",
                              margin: EdgeInsets.only(right: 130),
                              angle: -20,
                              size: Size(size.width * 0.4, size.width * 0.68),
                            ),
                            DownloadsImageWidget(
                              image:
                                  "${imgBaseUrl}${snapshot.data![3].posterPath}",
                              margin: EdgeInsets.only(left: 0),
                              size: Size(size.width * 0.4, size.width * 0.68),
                            )
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: kRedColor,
                          ),
                        );
                })),
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
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  image,
                )),
          )),
    );
  }
}
