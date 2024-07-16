import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_category.freezed.dart';
part 'project_category.g.dart';

@freezed
class ProjectCategory with _$ProjectCategory {
  factory ProjectCategory({
    int? id,
    String? category,
    String? title,
    String? iconPath,
    String? created,
  }) = _ProjectCategory;

  factory ProjectCategory.fromJson(Map<String, dynamic> json) =>
      _$ProjectCategoryFromJson(json);
}
