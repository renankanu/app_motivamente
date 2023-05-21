import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/home/home_view.dart';

abstract class AppRoutes {
  static const String _home = '/';
  static const String _message = 'message';

  static String get message => '/$_message';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: _home,
        builder: (context, state) => const HomeView(),
        routes: [
          GoRoute(
            path: _message,
            builder: (context, state) => Container(),
          ),
        ],
      ),
    ],
  );
}
