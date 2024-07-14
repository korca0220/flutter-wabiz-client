import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref_provider.g.dart';

@riverpod
SharedPreferences sHaredPreferences(SHaredPreferencesRef ref) =>
    throw Exception("SharedPreferences is not initialized");
