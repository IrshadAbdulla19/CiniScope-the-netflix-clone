import 'package:flutter/material.dart';
import 'package:netflix_demo/presentation/widgets/main_card.dart';
import 'package:netflix_demo/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  const MainTitleCard({super.key, required this.title});

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
            children: List.generate(10, (index) {
              return MainCardWidget();
            }),
          ),
        )
      ],
    );
  }
}
