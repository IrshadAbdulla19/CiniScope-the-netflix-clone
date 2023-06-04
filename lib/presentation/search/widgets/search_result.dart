import 'package:flutter/material.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';
import 'package:netflix_demo/presentation/search/widgets/top_titile.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopTextWidget(titile: 'Movie & TV'),
        kheight,
        Expanded(
            child: GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.4,
          children: List.generate(20, (index) {
            return MainCard();
          }),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/shubh-mangal-zyada-saavdhan-movie-star-cast-release-date-poster.jpg'),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
