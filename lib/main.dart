import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_search/data/data_source/box_manager.dart';
import 'package:github_search/domain/model/search_repo_model.dart';
import 'package:github_search/search_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loggy/loggy.dart';

Future<void> main() async {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]);
  await _initHive();
  runApp(const SearchApp());
}

_initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SearchRepoModelAdapter());
  await BoxManager().init();
}
