import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'trending_model.g.dart';

@JsonSerializable()
class TrendingModel {
	int? page;
	List<Result>? results;
	@JsonKey(name: 'total_pages') 
	int? totalPages;
	@JsonKey(name: 'total_results') 
	int? totalResults;

	TrendingModel({
		this.page, 
		this.results, 
		this.totalPages, 
		this.totalResults, 
	});

	factory TrendingModel.fromJson(Map<String, dynamic> json) {
		return _$TrendingModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$TrendingModelToJson(this);
}
