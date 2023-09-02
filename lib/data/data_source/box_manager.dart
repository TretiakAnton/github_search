import 'package:github_search/domain/model/search_repo_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BoxManager {
  static final BoxManager _instance = BoxManager._internal();
  late Box _searchesBox;

  factory BoxManager() {
    return _instance;
  }

  BoxManager._internal();

  Future<void> init() async {
    _searchesBox = await Hive.openBox(_KeyManager.searchesBoxKey);
  }

  Future<void> saveLastSearch(List<SearchRepoModel> model) async {
    return await _searchesBox.put(_KeyManager.lastSearchKey, model);
  }

  List<SearchRepoModel>? getLastSearch() {
    return _searchesBox.get(_KeyManager.lastSearchKey);
  }

  Future<void> saveFavouritesSearch(List<SearchRepoModel> model) async {
    return await _searchesBox.put(_KeyManager.favouriteSearchKey, model);
  }

  List<SearchRepoModel>? getFavouritesSearch() {
    return _searchesBox.get(_KeyManager.favouriteSearchKey);
  }
}

class _KeyManager {
  static const lastSearchKey = 'lastSearchKey';
  static const favouriteSearchKey = 'favouriteSearchKey';
  static const searchesBoxKey = 'searchesBoxKey';
}
