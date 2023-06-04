import 'package:flutter/material.dart';

import 'package:netflix_demo/presentation/downloads/widgets/download_screen.dart';
import 'package:netflix_demo/presentation/fast_laugh/fast_laugh_screen.dart';
import 'package:netflix_demo/presentation/home/home.dart';
import 'package:netflix_demo/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_demo/presentation/new_and_hot/new_and_hot.dart';
import 'package:netflix_demo/presentation/search/search_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  var pages = [
    HomePage(),
    NewAndHotScreen(),
    FastLaughScreen(),
    SearchScreen(),
    DownloadScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: pageChangeNotifier,
            builder: (cntx, int currentPage, child) {
              return pages[currentPage];
            }),
      ),
      bottomNavigationBar: BottomNavigatonWidget(),
    );
  }
}
