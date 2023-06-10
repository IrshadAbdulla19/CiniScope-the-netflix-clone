import 'package:json_annotation/json_annotation.dart';

import 'dates.dart';
import 'result.dart';

part 'up_coming_model.g.dart';

@JsonSerializable()
class UpComingModel {
	Dates? dates;
	int? page;
	List<Result>? results;
	@JsonKey(name: 'total_pages') 
	int? totalPages;
	@JsonKey(name: 'total_results') 
	int? totalResults;

	UpComingModel({
		this.dates, 
		this.page, 
		this.results, 
		this.totalPages, 
		this.totalResults, 
	});

	factory UpComingModel.fromJson(Map<String, dynamic> json) {
		return _$UpComingModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UpComingModelToJson(this);
}
