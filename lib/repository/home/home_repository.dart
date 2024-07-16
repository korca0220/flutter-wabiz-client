import 'package:flutter_wabiz_client/data/model/home/home_model.dart';
import 'package:flutter_wabiz_client/service/home/home_api.dart';
import 'package:flutter_wabiz_client/service/home/home_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

abstract class HomeRepository {
  Future<HomeModel> getHomeProjects();
}

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this.homeApiService);

  HomeApi homeApiService;

  @override
  Future<HomeModel> getHomeProjects() async {
    return await homeApiService.getHomeProjects();
  }
}

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  final service = ref.watch(homeApiServiceProvider);

  return HomeRepositoryImpl(service);
}
