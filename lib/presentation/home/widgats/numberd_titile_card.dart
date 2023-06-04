import 'package:flutter/material.dart';
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
            children: List.generate(10, (index) {
              return HomeNumberCardWidget(
                index: index,
              );
            }),
          ),
        )
      ],
    );
  }
}
