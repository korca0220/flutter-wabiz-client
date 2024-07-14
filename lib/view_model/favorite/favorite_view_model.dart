import 'dart:convert';

import 'package:flutter_wabiz_client/model/category/category_model.dart';
import 'package:flutter_wabiz_client/repository/favorite/favorite_repository.dart';
import 'package:flutter_wabiz_client/shared/enum/shared_pref.key.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_view_model.g.dart';

@riverpod
class FavoriteViewModel extends _$FavoriteViewModel {
  @override
  CategoryModel build() {
    String? value = ref.read(favoriteRepositoryProvider).readValue(
          EnumSharedPPreferencesKey.favoriteProjects.value,
        );

    if (value?.isEmpty ?? true) {
      return const CategoryModel(projects: []);
    }

    return CategoryModel.fromJson(jsonDecode(value ?? ""));
  }

  void addItem(CategoryItemModel value) {
    final oldState = state.projects;

    state = state.copyWith(
      projects: [...oldState, value],
    );

    ref.read(favoriteRepositoryProvider).saveValue(
          EnumSharedPPreferencesKey.favoriteProjects.value,
          jsonEncode(
            state.toJson(),
          ),
        );
  }

  void removeItem(CategoryItemModel value) {
    final oldState = [...state.projects];
    oldState.removeWhere((element) => element.id == value.id);

    state = state.copyWith(
      projects: [...oldState],
    );

    ref.read(favoriteRepositoryProvider).saveValue(
          EnumSharedPPreferencesKey.favoriteProjects.value,
          jsonEncode(
            state.toJson(),
          ),
        );
  }
}
