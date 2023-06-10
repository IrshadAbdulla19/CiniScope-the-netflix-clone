import 'dart:convert';

import 'package:netflix_demo/core/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_demo/domain/now_playing/now_play_model/nowplaying_model/nowplaying_model.dart';
import 'package:netflix_demo/domain/now_playing/now_play_model/nowplaying_model/result.dart';

Future<List<Result>> getNowPlayingImgs() async {
  var uri = "${domain}/movie/now_playing?api_key=${apiKey}";
  var url = Uri.parse(uri);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var nowPlaybody = response.body;
    var jsonBody = jsonDecode(nowPlaybody);
    var nowPlayData = NowplayingModel.fromJson(jsonBody);
    if (nowPlayData.results != null) {
      return nowPlayData.results!;
    }
  } else {
    print(response.statusCode);
  }

  List<Result> empty = [];
  return empty;
}
