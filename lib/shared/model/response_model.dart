import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

@freezed
class ResponseModel with _$ResponseModel {
  factory ResponseModel({
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "body") String? body,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}
