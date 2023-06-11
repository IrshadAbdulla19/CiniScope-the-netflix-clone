import 'package:flutter/material.dart';
import 'package:netflix_demo/core/api_constant.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';
import 'package:netflix_demo/domain/trending/trendig_api.dart';
import 'package:netflix_demo/presentation/fast_laugh/widgets/vedio_list_item.dart';
import 'package:video_player/video_player.dart';

class FastLaughScreen extends StatefulWidget {
  const FastLaughScreen({super.key});

  @override
  State<FastLaughScreen> createState() => _FastLaughScreenState();
}

class _FastLaughScreenState extends State<FastLaughScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: List.generate(10, (indx) {
        return Stack(
          children: [
            FutureBuilder(
              future: getTrendingImgs(),
              builder: (context, snapshot) {
                String? imgPath = snapshot.data?[indx].posterPath;
                return snapshot.hasData
                    ? Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("${imgBaseUrl}${imgPath}"),
                                fit: BoxFit.cover)),
                        // color: Colors.accents[indx % Colors.accents.length],
                      )
                    : Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: kRedColor,
                          ),
                        ),
                      );
              },
            ),
            // SizedBox(
            //     child: _controller.value.isInitialized
            //         ? VideoPlayer(_controller)
            //         : Center(
            //             child: CircularProgressIndicator(
            //             color: kRedColor,
            //           ))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black.withOpacity(0.5),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.volume_off,
                            color: kWhite,
                            size: 30,
                          )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: FutureBuilder(
                            future: getTrendingImgs(),
                            builder: (context, snapshot) {
                              String? imgPath =
                                  snapshot.data?[indx].backdropPath;
                              return snapshot.hasData
                                  ? CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                          "${imgBaseUrl}${imgPath}"),
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                        color: kRedColor,
                                      ),
                                    );
                            },
                          ),
                        ),
                        VedoListItemWidget(
                            icon: Icons.emoji_emotions, title: 'LOL'),
                        VedoListItemWidget(icon: Icons.add, title: 'My List'),
                        VedoListItemWidget(icon: Icons.share, title: 'Share'),
                        VedoListItemWidget(
                            icon: Icons.play_arrow, title: 'Play'),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        );
      }),
    )));
  }
}
