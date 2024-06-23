import 'package:flutter/material.dart';
import 'package:flutter_wabiz_client/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: wabizDefaultTheme,
        home: const Scaffold(
          body: Center(
            child: Text("Hello, World!"),
          ),
        ));
  }
}
