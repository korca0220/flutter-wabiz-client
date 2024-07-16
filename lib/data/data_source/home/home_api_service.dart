import 'package:flutter/foundation.dart';
import 'package:flutter_wabiz_client/data/data_source/home/home_api.dart';
import 'package:flutter_wabiz_client/shared/network_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_api_service.g.dart';

@riverpod
HomeApi homeApiService(HomeApiServiceRef ref) {
  final dio = ref.watch(dioProvider);

  var localhost = "localhost";
  if (defaultTargetPlatform == TargetPlatform.android) {
    localhost = "10.0.2.2";
  }

  return HomeApi(dio, baseUrl: "http://$localhost:3000/api/v1");
}
