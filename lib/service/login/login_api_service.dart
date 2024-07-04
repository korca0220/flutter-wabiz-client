import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/network_provider.dart';
import 'login_api.dart';

part 'login_api_service.g.dart';

@Riverpod(keepAlive: true)
LoginApi loginApiService(LoginApiServiceRef ref) {
  final dio = ref.watch(dioProvider);

  var localhost = "localhost";
  if (defaultTargetPlatform == TargetPlatform.android) {
    localhost = "10.0.2.2";
  }

  return LoginApi(dio, baseUrl: "http://$localhost:3000/api/v1");
}
