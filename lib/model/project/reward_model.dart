import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_model.freezed.dart';
part 'reward_model.g.dart';

@freezed
class RewardItemModel with _$RewardItemModel {
  factory RewardItemModel({
    int? id,
    int? projectId,
    String? imageUrl,
    String? title,
    int? price,
    String? description,
    @Default([]) List<int> imageRaw,
  }) = _RewardItemModel;

  factory RewardItemModel.fromJson(Map<String, dynamic> json) =>
      _$RewardItemModelFromJson(json);
}
