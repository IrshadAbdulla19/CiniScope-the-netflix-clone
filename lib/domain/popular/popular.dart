import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'popular.g.dart';

@JsonSerializable()
class Popular {
	int? page;
	List<Result>? results;
	@JsonKey(name: 'total_pages') 
	int? totalPages;
	@JsonKey(name: 'total_results') 
	int? totalResults;

	Popular({this.page, this.results, this.totalPages, this.totalResults});

	factory Popular.fromJson(Map<String, dynamic> json) {
		return _$PopularFromJson(json);
	}

	Map<String, dynamic> toJson() => _$PopularToJson(this);
}
