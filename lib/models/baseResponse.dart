import 'package:json_annotation/json_annotation.dart';
import 'package:movie/models/movie.dart';
part 'baseResponse.g.dart';

@JsonSerializable()
class BaseResponse<T> extends Object with _$BaseResponseSerializerMixin {
  int page;
  int totalPage;
  int totalResults;
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  List<T> results;

  BaseResponse(this.page, this.totalPage, this.totalResults, this.results);


  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

}
List<T> _dataFromJson<T> (List input) {
  return new List<T>.from(input.map((f) {
    if (T == Movie) {
      return Movie.fromJson(f);
    }
    throw Exception("Unknow type");
  }));
}

Map<String, dynamic> _dataToJson<T>(List<T> input) => {'results': input};