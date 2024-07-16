import 'package:flutter_wabiz_client/domain/entity/home/home_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/repository/home/home_repository.dart';
import '../../data_source/home/home_api.dart';
import '../../data_source/home/home_api_service.dart';

part 'home_repository_impl.g.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this.homeApiService);

  HomeApi homeApiService;

  @override
  Future<List<HomeEntity>> getHomeProjects() async {
    final result = await homeApiService.getHomeProjects();

    return result.projects.map((item) => HomeEntity.fromModel(item)).toList();
  }
}

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  final service = ref.watch(homeApiServiceProvider);

  return HomeRepositoryImpl(service);
}
