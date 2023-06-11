import 'package:flutter/material.dart';

ValueNotifier<int> pageChangeNotifier = ValueNotifier(0);

class BottomNavigatonWidget extends StatelessWidget {
  const BottomNavigatonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pageChangeNotifier,
        builder: (cntx, int currentPage, child) {
          return BottomNavigationBar(
            onTap: (value) {
              pageChangeNotifier.value = value;
            },
            currentIndex: currentPage,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections), label: 'New & hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions), label: 'Fast Laugh'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download_for_offline_sharp),
                  label: 'Downloads'),
            ],
          );
        });
  }
}
