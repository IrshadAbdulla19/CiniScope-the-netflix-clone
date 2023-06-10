import 'dart:convert';
import 'package:netflix_demo/core/api_constant.dart' as apiConst;
import 'package:http/http.dart' as http;
import 'package:netflix_demo/domain/search/for_search/for_search.dart';

import 'for_search/result.dart';

Future<List<Result>> searchImageGet(String name) async {
  var uri =
      "${apiConst.domain}/search/movie?query=$name&api_key=${apiConst.apiKey}";
  var url = Uri.parse(uri);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var data = response.body;
    var jsonData = jsonDecode(data);
    // print(data);
    var searchModel = ForSearch.fromJson(jsonData);
    if (searchModel.results != null) {
      return searchModel.results!;
    }
  } else {
    print(response.statusCode);
  }
  List<Result> emty = [];

  return emty;
}
