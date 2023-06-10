import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';
import 'package:netflix_demo/domain/trending/trendig_api.dart';

import 'package:netflix_demo/presentation/home/widgats/main_card_backwidg.dart';
import 'package:netflix_demo/presentation/home/widgats/numberd_titile_card.dart';

import 'package:netflix_demo/presentation/widgets/main_title_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (context, index, _) {
              return SafeArea(
                child: NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;
                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    } else {
                      scrollNotifier.value = true;
                    }
                    return true;
                  },
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          MainCardBackWidget(),
                          MainTitleCard1(title: 'Released in the past years'),
                          MainTitleCard2(
                            title: 'Tredning Now',
                          ),
                          NumberedTitleCard(),
                          MainTitleCard3(
                            title: 'Tense Dramas',
                          ),
                          MainTitleCard4(
                            title: 'South indian Cinema',
                          ),
                        ],
                      ),
                      scrollNotifier.value == true
                          ? AnimatedContainer(
                              duration: Duration(milliseconds: 2000),
                              width: double.infinity,
                              height: 90,
                              color: Colors.black.withOpacity(0.3),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/netflix_png_logo.png',
                                        height: 40,
                                        width: 40,
                                      ),
                                      Spacer(),
                                      const Icon(
                                        Icons.cast,
                                        color: kWhite,
                                        size: 30,
                                      ),
                                      kWidth,
                                      Container(
                                        width: 30,
                                        height: 30,
                                        color: Colors.blue,
                                      ),
                                      kWidth
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'TV Shows',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Movies',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Catogories',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          : kheight
                    ],
                  ),
                ),
              );
            }));
  }
}
