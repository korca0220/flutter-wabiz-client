// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryMOdel with _$CategoryMOdel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CategoryMOdel({
    String? status,
    int? totalCount,
    @Default([]) List<CategoryItemModel> projects,
  }) = _CategoryMOdel;

  factory CategoryMOdel.fromJson(Map<String, dynamic> json) =>
      _$CategoryMOdelFromJson(json);
}

@freezed
class CategoryItemModel with _$CategoryItemModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CategoryItemModel({
    int? id,
    int? categoryId,
    int? projectTypeId,
    String? userId,
    String? title,
    String? owner,
    int? price,
    String? thumbnail,
    String? deadline,
    String? description,
    int? waitlistCount,
    int? totalFundedCount,
    int? totalFunded,
    String? isOpen,
    String? category,
    String? type,
    String? projectType,
    @Default([]) List<int> image,
  }) = _CategoryItemModel;

  factory CategoryItemModel.fromJson(Map<String, Object?> json) =>
      _$CategoryItemModelFromJson(json);
}
