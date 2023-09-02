// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    FavouriteScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FavouriteScreen(),
      );
    },
    SearchScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/splash_screen',
          fullMatch: true,
        ),
        RouteConfig(
          SplashScreenRoute.name,
          path: '/splash_screen',
        ),
        RouteConfig(
          FavouriteScreenRoute.name,
          path: '/favourite_screen',
        ),
        RouteConfig(
          SearchScreenRoute.name,
          path: '/search_screen',
        ),
      ];
}

/// generated route for
/// [SplashScreen]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/splash_screen',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [FavouriteScreen]
class FavouriteScreenRoute extends PageRouteInfo<void> {
  const FavouriteScreenRoute()
      : super(
          FavouriteScreenRoute.name,
          path: '/favourite_screen',
        );

  static const String name = 'FavouriteScreenRoute';
}

/// generated route for
/// [SearchScreen]
class SearchScreenRoute extends PageRouteInfo<void> {
  const SearchScreenRoute()
      : super(
          SearchScreenRoute.name,
          path: '/search_screen',
        );

  static const String name = 'SearchScreenRoute';
}
