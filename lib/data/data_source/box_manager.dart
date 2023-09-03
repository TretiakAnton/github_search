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
    return _searchesBox.get(_KeyManager.lastSearchKey)?.cast<SearchRepoModel>();
  }

  Future<void> saveFavouritesSearch(List<SearchRepoModel> model) async {
    return await _searchesBox.put(_KeyManager.favouriteSearchKey, model);
  }

  List<SearchRepoModel>? getFavouritesSearch() {
    return _searchesBox
        .get(_KeyManager.favouriteSearchKey)
        ?.cast<SearchRepoModel>();
  }

  Future addSelected(SearchRepoModel model) async {
    List<SearchRepoModel> favourites = _searchesBox
            .get(_KeyManager.favouriteSearchKey)
            ?.cast<SearchRepoModel>() ??
        [];
    favourites.add(model.copyWith(isSelected: true));
    await _searchesBox.put(_KeyManager.favouriteSearchKey, favourites);
    List<SearchRepoModel> lastSearch =
        _searchesBox.get(_KeyManager.lastSearchKey)?.cast<SearchRepoModel>() ??
            [];
    lastSearch.removeWhere((element) => element.id == model.id);
    SearchRepoModel selected = model.copyWith(isSelected: true);
    lastSearch.add(selected);
    return await _searchesBox.put(_KeyManager.lastSearchKey, lastSearch);
  }

  Future removeSelected(SearchRepoModel model) async {
    List<SearchRepoModel> favourites = _searchesBox
            .get(_KeyManager.favouriteSearchKey)
            ?.cast<SearchRepoModel>() ??
        [];
    favourites.removeWhere((element) => element.id == model.id);
    await _searchesBox.put(_KeyManager.favouriteSearchKey, favourites);
    List<SearchRepoModel> lastSearch =
        _searchesBox.get(_KeyManager.lastSearchKey)?.cast<SearchRepoModel>() ??
            [];
    SearchRepoModel? unselected;
    if (lastSearch.contains(model)) {
      unselected = model.copyWith(isSelected: false);
      lastSearch.removeWhere((element) => element.id == model.id);
      lastSearch.add(unselected);
    }
    return await _searchesBox.put(_KeyManager.lastSearchKey, lastSearch);
  }
}

class _KeyManager {
  static const lastSearchKey = 'lastSearchKey';
  static const favouriteSearchKey = 'favouriteSearchKey';
  static const searchesBoxKey = 'searchesBoxKey';
}
