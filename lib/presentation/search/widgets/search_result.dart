import 'package:flutter/material.dart';
import 'package:netflix_demo/core/api_constant.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';

import 'package:netflix_demo/domain/search/search_api.dart';
import 'package:netflix_demo/presentation/search/widgets/top_titile.dart';

import '../../../domain/search/for_search/result.dart';

class SearchResultWidget extends StatefulWidget {
  SearchResultWidget({super.key, required this.searchText});
  String searchText;
  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
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
          children: [
            FutureBuilder(
              future: searchImageGet(widget.searchText),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Result>> snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MainCard(
                              image:
                                  "${imgBaseUrl}${snapshot.data![index].posterPath}");
                        })
                    : Center(
                        child: CircularProgressIndicator(
                          color: kRedColor,
                        ),
                      );
              },
            )
          ],
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
