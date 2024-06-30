import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_type.freezed.dart';
part 'project_type.g.dart';

@freezed
class ProjectType with _$ProjectType {
  factory ProjectType({
    int? id,
    String? type,
    String? created,
    String? imagePath,
  }) = _ProjectType;

  factory ProjectType.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypeFromJson(json);
}
