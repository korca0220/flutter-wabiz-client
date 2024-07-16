import 'package:flutter_wabiz_client/domain/entity/home/home_entity.dart';
import 'package:flutter_wabiz_client/domain/use_cases/home/fetch_home_categories.dart';
import 'package:flutter_wabiz_client/domain/use_cases/home/fetch_home_projects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entity/shared/project_category.dart';

part 'home_provider.freezed.dart';
part 'home_provider.g.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default([]) List<HomeEntity> projects,
    @Default([]) List<ProjectCategory> categories,
  }) = _HomeState;
}

@riverpod
class HomeProvider extends _$HomeProvider {
  @override
  Future<HomeState> build() async {
    final result = await ref.watch(fetchHomeProjectsProvider.future);
    final result2 = await ref.watch(fetchHomeCategoriesProvider.future);

    return HomeState(
      projects: result,
      categories: result2,
    );
  }
}
