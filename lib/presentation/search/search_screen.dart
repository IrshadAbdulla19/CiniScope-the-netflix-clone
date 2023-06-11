import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_demo/domain/search/search_api.dart';
import 'package:netflix_demo/presentation/search/widgets/search_idle.dart';
import 'package:netflix_demo/presentation/search/widgets/search_result.dart';

TextEditingController searchControllor = TextEditingController();
ValueNotifier searchscreenNotifier = ValueNotifier([]);

class ForSearchScreen extends StatelessWidget {
  ForSearchScreen({super.key});
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ValueListenableBuilder(
        valueListenable: searchscreenNotifier,
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: TextFormField(
                    onChanged: (value) {
                      searchText = value.trim();
                      searchImageGet(searchText);
                      searchscreenNotifier.notifyListeners();
                    },
                    controller: searchControllor,
                    decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 208, 205, 205)),
                        prefixIcon: const Icon(
                          Icons.search,
                          // size: 26,
                          color: Color.fromARGB(255, 208, 205, 205),
                        ),
                        fillColor: const Color.fromARGB(255, 106, 106, 106),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  (searchControllor.text.isEmpty)
                      ? 'Top Searches'
                      : 'Movies & TV',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ),
              (searchControllor.text.isEmpty)
                  ? Expanded(child: SearchIdleWidget())
                  : Expanded(
                      child: SearchResultWidget(
                      searchText: searchText,
                    ))
            ],
          );
        },
      )),
    );
  }
}
