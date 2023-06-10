import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'for_search.g.dart';

@JsonSerializable()
class ForSearch {
	int? page;
	List<Result>? results;
	@JsonKey(name: 'total_pages') 
	int? totalPages;
	@JsonKey(name: 'total_results') 
	int? totalResults;

	ForSearch({this.page, this.results, this.totalPages, this.totalResults});

	factory ForSearch.fromJson(Map<String, dynamic> json) {
		return _$ForSearchFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ForSearchToJson(this);
}
