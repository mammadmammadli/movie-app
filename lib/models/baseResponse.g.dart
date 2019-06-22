part of 'baseResponse.dart';

BaseResponse<T> _$BaseResponseFromJson<T>(Map<String, dynamic> json) {
  return new BaseResponse<T>(
      json['page'] as int,
      json['total_pages'] as int,
      json['total_results'] as int,
      json['results'] == null
          ? null
          : _dataFromJson(json['results'] as List));
}

abstract class _$BaseResponseSerializerMixin<T> {
  int page;
  int totalPage;
  int totalResults;
  List<T> get results;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'page': page,
        'total_page': totalPage,
        'total_results': totalResults,
        'results': results == null ? null : _dataToJson(results)
      };
}