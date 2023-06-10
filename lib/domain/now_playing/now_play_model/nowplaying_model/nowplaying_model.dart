import 'package:json_annotation/json_annotation.dart';

import 'dates.dart';
import 'result.dart';

part 'nowplaying_model.g.dart';

@JsonSerializable()
class NowplayingModel {
	Dates? dates;
	int? page;
	List<Result>? results;
	@JsonKey(name: 'total_pages') 
	int? totalPages;
	@JsonKey(name: 'total_results') 
	int? totalResults;

	NowplayingModel({
		this.dates, 
		this.page, 
		this.results, 
		this.totalPages, 
		this.totalResults, 
	});

	factory NowplayingModel.fromJson(Map<String, dynamic> json) {
		return _$NowplayingModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$NowplayingModelToJson(this);
}
