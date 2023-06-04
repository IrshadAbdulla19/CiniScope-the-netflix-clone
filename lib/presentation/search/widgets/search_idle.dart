import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';
import 'package:netflix_demo/presentation/search/widgets/top_titile.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopTextWidget(
          titile: 'Top searches',
        ),
        kheight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (cntx, indx) {
                return ForTopSearchTile();
              },
              separatorBuilder: (cntx, indx) {
                return kheight;
              },
              itemCount: 10),
        )
      ],
    );
  }
}

class ForTopSearchTile extends StatelessWidget {
  const ForTopSearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.4,
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/image_for_search.jpg'),
                  fit: BoxFit.fill)),
        ),
        Expanded(
            child: Text(
          'Movie name',
          style: TextStyle(
              color: kWhite, fontWeight: FontWeight.bold, fontSize: 20),
        )),
        CircleAvatar(
          backgroundColor: kWhite,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: backgrondColorBlack,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kWhite,
            ),
          ),
        )
      ],
    );
  }
}
