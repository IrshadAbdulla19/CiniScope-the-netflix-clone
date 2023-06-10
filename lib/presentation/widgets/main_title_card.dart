import 'package:flutter/material.dart';
import 'package:netflix_demo/core/api_constant.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/domain/now_playing/now_playing_api.dart';
import 'package:netflix_demo/domain/trending/trendig_api.dart';
import 'package:netflix_demo/domain/up_coming/up_coming_api.dart';
import 'package:netflix_demo/presentation/widgets/main_card.dart';
import 'package:netflix_demo/presentation/widgets/main_title.dart';

class MainTitleCard1 extends StatelessWidget {
  MainTitleCard1({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitileWidget(titile: title),
        LimitedBox(
            maxHeight: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (indx) {
                return FutureBuilder(
                    future: getTrendingImgs(),
                    builder: (context, snapshot) {
                      String? imagePath = snapshot.data?[indx].posterPath;
                      return snapshot.hasData
                          ? MainCardWidget(
                              imgPath:
                                  "${imgBaseUrl}${imagePath == null ? "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg" : imagePath}",
                            )
                          : Container(
                              alignment: Alignment.center,
                              width: 150,
                              child: CircularProgressIndicator(
                                color: kRedColor,
                              ),
                            );
                    });
              }),
            ))
      ],
    );
  }
}

class MainTitleCard2 extends StatelessWidget {
  MainTitleCard2({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitileWidget(titile: title),
        LimitedBox(
            maxHeight: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (indx) {
                return FutureBuilder(
                    future: getNowPlayingImgs(),
                    builder: (context, snapshot) {
                      String? imagePath = snapshot.data?[indx].posterPath;
                      return snapshot.hasData
                          ? MainCardWidget(
                              imgPath:
                                  "${imgBaseUrl}${imagePath == null ? "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg" : imagePath}",
                            )
                          : Container(
                              alignment: Alignment.center,
                              width: 150,
                              child: CircularProgressIndicator(
                                color: kRedColor,
                              ),
                            );
                    });
              }),
            ))
      ],
    );
  }
}

class MainTitleCard3 extends StatelessWidget {
  MainTitleCard3({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitileWidget(titile: title),
        LimitedBox(
            maxHeight: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (indx) {
                return FutureBuilder(
                    future: getTvTopRated(),
                    builder: (context, snapshot) {
                      String? imagePath = snapshot.data?[indx].posterPath;
                      return snapshot.hasData
                          ? MainCardWidget(
                              imgPath:
                                  "${imgBaseUrl}${imagePath == null ? "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg" : imagePath}",
                            )
                          : Container(
                              alignment: Alignment.center,
                              width: 150,
                              child: CircularProgressIndicator(
                                color: kRedColor,
                              ),
                            );
                    });
              }),
            ))
      ],
    );
  }
}

class MainTitleCard4 extends StatelessWidget {
  MainTitleCard4({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitileWidget(titile: title),
        LimitedBox(
            maxHeight: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (indx) {
                return FutureBuilder(
                    future: getTrendingImgs(),
                    builder: (context, snapshot) {
                      String? imagePath = snapshot.data?[indx].posterPath;
                      return snapshot.hasData
                          ? MainCardWidget(
                              imgPath:
                                  "${imgBaseUrl}${imagePath == null ? "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg" : imagePath}",
                            )
                          : Container(
                              alignment: Alignment.center,
                              width: 150,
                              child: CircularProgressIndicator(
                                color: kRedColor,
                              ),
                            );
                    });
              }),
            ))
      ],
    );
  }
}
