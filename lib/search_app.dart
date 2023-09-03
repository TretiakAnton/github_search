import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/core/routing/app_router.dart';
import 'package:github_search/presentation/state_management/favourite_bloc/favourite_cubit.dart';
import 'package:github_search/presentation/state_management/search_bloc/search_cubit.dart';

class SearchApp extends StatefulWidget {
  const SearchApp({Key? key}) : super(key: key);

  @override
  State<SearchApp> createState() => _SearchAppState();
}

class _SearchAppState extends State<SearchApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavouriteCubit>(create: (context) => FavouriteCubit()),
        BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
      ],
      child: const _MaterialForecastApp(),
    );
  }
}

final GlobalKey<ScaffoldMessengerState> materialAppKey =
    GlobalKey<ScaffoldMessengerState>();

class _MaterialForecastApp extends StatefulWidget {
  const _MaterialForecastApp({Key? key}) : super(key: key);

  @override
  State<_MaterialForecastApp> createState() => _MaterialForecastAppState();
}

class _MaterialForecastAppState extends State<_MaterialForecastApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: materialAppKey,
      theme: ThemeData(primaryColor: const Color.fromRGBO(20, 99, 245, 1)),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
