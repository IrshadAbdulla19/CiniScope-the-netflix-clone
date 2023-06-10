import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_demo/core/api_constant.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';
import 'package:netflix_demo/domain/trending/trendig_api.dart';
import 'package:netflix_demo/domain/trending/trending_model/result.dart';
import 'package:netflix_demo/presentation/search/widgets/top_titile.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Expanded(
          child: FutureBuilder(
            future: getTrendingImgs(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Result>> snapshot) {
              return snapshot.hasData
                  ? ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (cntx, indx) {
                        String imagePath =
                            "${snapshot.data![indx].backdropPath}";
                        String titlePath = "${snapshot.data![indx].title}";
                        return ForTopSearchTile(
                          imagePath:
                              "${imgBaseUrl}${snapshot.data![indx].backdropPath}",
                          movieName: titlePath.isNotEmpty
                              ? "${snapshot.data![indx].title}"
                              : "Movie name",
                        );
                      },
                      separatorBuilder: (cntx, indx) {
                        return kheight;
                      },
                      itemCount: snapshot.data!.length)
                  : Center(
                      child: CircularProgressIndicator(
                        color: kRedColor,
                      ),
                    );
            },
          ),
        )
      ],
    );
  }
}

class ForTopSearchTile extends StatelessWidget {
  ForTopSearchTile(
      {super.key, required this.imagePath, required this.movieName});

  String imagePath;
  String movieName;

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
                  image: NetworkImage(imagePath), fit: BoxFit.fill)),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            movieName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: kWhite, fontWeight: FontWeight.bold, fontSize: 20),
          ),
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
