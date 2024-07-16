import 'package:flutter_wabiz_client/domain/entity/home/home_entity.dart';
import 'package:flutter_wabiz_client/domain/use_cases/home/fetch_home_projects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.freezed.dart';
part 'home_provider.g.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({@Default([]) List<HomeEntity> projects}) = _HomeState;
}

@riverpod
class HomeProvider extends _$HomeProvider {
  @override
  Future<HomeState> build() async {
    final result = await ref.watch(fetchHomeProjectsProvider.future);

    return HomeState(projects: result);
  }
}
