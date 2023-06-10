import 'dart:convert';
import 'package:netflix_demo/core/api_constant.dart' as apiConst;
import 'package:http/http.dart' as http;
import 'package:netflix_demo/domain/trending/trending_model/result.dart';
import 'package:netflix_demo/domain/trending/trending_model/trending_model.dart';

Future<List<Result>> getTrendingImgs() async {
  var uri = "${apiConst.domain}/trending/all/week?api_key=${apiConst.apiKey}";
  var url = Uri.parse(uri);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var trendingData = response.body;
    var jsonBody = jsonDecode(trendingData);
    var trendingResult = TrendingModel.fromJson(jsonBody);
    if (trendingResult.results != null) {
      return trendingResult.results!;
    }
  } else {
    print(response.statusCode);
  }
  List<Result> emty = [];
  return emty;
}
