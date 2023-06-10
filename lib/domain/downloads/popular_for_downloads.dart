import "dart:convert";
import "package:http/http.dart" as http;
import "package:netflix_demo/core/api_constant.dart" as apiConst;
import "package:netflix_demo/domain/popular/popular.dart";
import "package:netflix_demo/domain/popular/result.dart";

Future<List<Result>> popularForDownloads() async {
  var uri =
      "${apiConst.domain}/movie/popular?api_key=${apiConst.apiKey}&language=en-US&page=1";
  var url = Uri.parse(uri);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var popularList = response.body;
    var jsonBody = jsonDecode(popularList);
    var result = Popular.fromJson(jsonBody);
    if (result.results != null) {
      return result.results!;
    }
  } else {
    print(response.statusCode);
  }
  List<Result> emty = [];

  return emty;
}
