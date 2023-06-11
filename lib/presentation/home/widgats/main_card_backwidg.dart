import 'package:flutter/material.dart';
import 'package:netflix_demo/core/api_constant.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/domain/downloads/popular_for_downloads.dart';
import 'package:netflix_demo/domain/search/search_api.dart';
import 'package:netflix_demo/domain/trending/trendig_api.dart';
import 'package:netflix_demo/presentation/home/widgats/custom_button.dart';

class MainCardBackWidget extends StatelessWidget {
  const MainCardBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTrendingImgs(),
      builder: (context, snapshot) {
        String? imgPaht = snapshot.data?[0].posterPath;
        return snapshot.hasData
            ? Stack(
                children: [
                  Container(
                    height: 780,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "${imgBaseUrl}${imgPaht == null ? "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg" : imgPaht}"),
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
              )
            : Container(
                height: 780,
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(
                    color: kRedColor,
                  ),
                ),
              );
      },
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
