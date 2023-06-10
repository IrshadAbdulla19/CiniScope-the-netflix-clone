import 'package:flutter/material.dart';
import 'package:netflix_demo/core/api_constant.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/domain/top_rated/top_rated_api.dart';
import 'package:netflix_demo/presentation/home/widgats/home_num_card.dart';
import 'package:netflix_demo/presentation/widgets/main_title.dart';

class NumberedTitleCard extends StatelessWidget {
  const NumberedTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitileWidget(titile: 'Top 10 TV Show In India Today'),
        LimitedBox(
          maxHeight: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (indx) {
              return FutureBuilder(
                  future: getTopRatedImgs(),
                  builder: (context, snapshot) {
                    String? imagePath = snapshot.data?[indx].posterPath;
                    return snapshot.hasData
                        ? HomeNumberCardWidget(
                            index: indx,
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
          ),
        )
      ],
    );
  }
}
