import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'top_rated_model.g.dart';

@JsonSerializable()
class TopRatedModel {
	int? page;
	List<Result>? results;
	@JsonKey(name: 'total_pages') 
	int? totalPages;
	@JsonKey(name: 'total_results') 
	int? totalResults;

	TopRatedModel({
		this.page, 
		this.results, 
		this.totalPages, 
		this.totalResults, 
	});

	factory TopRatedModel.fromJson(Map<String, dynamic> json) {
		return _$TopRatedModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$TopRatedModelToJson(this);
}
