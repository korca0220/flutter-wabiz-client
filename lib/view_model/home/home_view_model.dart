import 'package:flutter_wabiz_client/domain/entity/home/home_entity.dart';
import 'package:flutter_wabiz_client/domain/use_cases/home/fetch_home_projects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.freezed.dart';
part 'home_view_model.g.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({@Default([]) List<HomeEntity> projects}) = _HomeState;
}

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState? build() {
    return null;
  }

  update(List<HomeEntity> projects) {
    state = state?.copyWith(projects: [...projects]);
  }

  Future<List<HomeEntity>?> fetchHomeData() async {
    final result = ref.watch(fetchHomeProjectsProvider);

    return result.when(
      data: (data) {
        update(data);

        return data;
      },
      loading: () {
        return null;
      },
      error: (error, stackTrace) {
        return null;
      },
    );
  }
}
