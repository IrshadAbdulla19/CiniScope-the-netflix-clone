import 'dart:convert';

import 'package:netflix_demo/core/api_constant.dart';
import 'package:netflix_demo/domain/up_coming/up_coming_model/result.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_demo/domain/up_coming/up_coming_model/up_coming_model.dart';

Future<List<Result>> getTvTopRated() async {
  var uri = "${domain}/tv/top_rated?api_key=${apiKey}";
  var url = Uri.parse(uri);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var uoComingbody = response.body;
    var jsonBody = jsonDecode(uoComingbody);
    var upComingData = UpComingModel.fromJson(jsonBody);
    if (upComingData.results != null) {
      return upComingData.results!;
    }
  } else {
    print(response.statusCode);
  }

  List<Result> empty = [];
  return empty;
}
