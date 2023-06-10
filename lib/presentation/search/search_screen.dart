import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_demo/core/api_constant.dart';

import 'package:netflix_demo/domain/search/search_api.dart';

import 'package:netflix_demo/presentation/search/widgets/search_idle.dart';

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
                  style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w600),
                ),
              ),
              (searchControllor.text.isEmpty)
                  ? Expanded(child: SearchIdleWidget())
                  : Expanded(
                      child: FutureBuilder(
                      future: searchImageGet(searchText),
                      builder: (context, snapshot) {
                        return snapshot.data != null &&
                                snapshot.data!.isNotEmpty
                            ? GridView.builder(
                                itemCount: snapshot.data!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisExtent: 220,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8),
                                itemBuilder: (context, index) {
                                  String? imagepath =
                                      snapshot.data?[index].posterPath;
                                  return snapshot.hasData
                                      ? Container(
                                          height: 80,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                              '$imgBaseUrl${(imagepath != null) ? imagepath : '/7syc6DmjSeUSNp4VSGELfHQW17Q.jpg'}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.red,
                                          ),
                                        );
                                },
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.red,
                                ),
                              );
                      },
                    ))
            ],
          );
        },
      )),
    );
  }
}
