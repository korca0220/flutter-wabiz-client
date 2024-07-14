import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wabiz_client/router.dart';
import 'package:flutter_wabiz_client/shared/shared_pref_provider.dart';
import 'package:flutter_wabiz_client/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final pref = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sHaredPreferencesProvider.overrideWithValue(pref),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "wabiz",
      routerConfig: router,
      theme: wabizDefaultTheme,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      themeAnimationStyle: AnimationStyle(
        curve: Curves.easeInCirc,
        duration: const Duration(milliseconds: 350),
      ),
    );
  }
}
