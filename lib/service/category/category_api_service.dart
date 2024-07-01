import 'package:flutter/foundation.dart';
import 'package:flutter_wabiz_client/service/category/category_api.dart';
import 'package:flutter_wabiz_client/shared/network_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_api_service.g.dart';

@riverpod
CategoryApi categoryApiService(CategoryApiServiceRef ref) {
  final dio = ref.watch(dioProvider);

  var localhost = "localhost";
  if (defaultTargetPlatform == TargetPlatform.android) {
    localhost = "10.0.2.2";
  }

  return CategoryApi(dio, baseUrl: "http://$localhost:3000/api/v1");
}
