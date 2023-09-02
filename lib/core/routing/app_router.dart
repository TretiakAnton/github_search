import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:github_search/core/routing/routes.dart';
import 'package:github_search/presentation/view/screens/favourite_screen.dart';
import 'package:github_search/presentation/view/screens/search_screen.dart';
import 'package:github_search/presentation/view/screens/splash_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      path: Routes.splashScreen,
      initial: true,
    ),
    AutoRoute(
      page: FavouriteScreen,
      path: Routes.favouriteScreen,
    ),
    AutoRoute(
      page: SearchScreen,
      path: Routes.searchScreen,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
