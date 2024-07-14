import 'package:flutter_wabiz_client/shared/shared_pref_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorite_repository.g.dart';

@riverpod
FavoriteRepository favoriteRepository(FavoriteRepositoryRef ref) {
  final pref = ref.watch(sHaredPreferencesProvider);

  return FavoriteRepositoryImpl(pref);
}

abstract class FavoriteRepository {
  Future<bool> saveValue(String key, String value);
  String? readValue(String key);
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteRepositoryImpl(this.pref);

  final SharedPreferences pref;

  @override
  Future<bool> saveValue(String key, String value) async {
    final result = await pref.setString(key, value);

    return result;
  }

  @override
  String? readValue(String key) {
    final result = pref.getString(key);

    return result;
  }
}
