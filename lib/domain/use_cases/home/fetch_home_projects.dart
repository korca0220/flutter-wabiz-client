import 'package:dio/dio.dart';
import 'package:flutter_wabiz_client/data/repository/home/home_repository_impl.dart';
import 'package:flutter_wabiz_client/domain/entity/home/home_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../presentation/views/home/home_page.dart';

part 'fetch_home_projects.g.dart';

@riverpod
Future<List<HomeEntity>> fetchHomeProjects(FetchHomeProjectsRef ref) async {
  try {
    final result = await ref.watch(homeRepositoryProvider).getHomeProjects();

    return result;
  } on DioException catch (e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw ConnectionTimeoutError(e);
      case DioExceptionType.connectionError:
        throw ConnectionError(e);
      default:
    }

    return const [];
  }
}
