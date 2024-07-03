import 'package:flutter/material.dart';
import 'package:flutter_wabiz_client/views/category/category_page.dart';
import 'package:flutter_wabiz_client/views/home/home_page.dart';
import 'package:flutter_wabiz_client/views/login/sign_up_page.dart';
import 'package:flutter_wabiz_client/views/my/my_page.dart';
import 'package:flutter_wabiz_client/views/wabiz_app_shell.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: '/sign-up',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SignUpPage(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => WabizAppShell(
        currentIndex: switch (state.uri.path) {
          var p when p.startsWith("/my") => 3,
          _ => 0,
        },
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/home',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: 'category/:id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;

                return CategoryPage(
                  categoryId: id,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/my',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const MyPage(),
        ),
      ],
    ),
  ],
);
