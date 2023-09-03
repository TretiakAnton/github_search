import 'package:github_search/data/repository/login_repository.dart';
import 'package:github_search/domain/model/search_repo_model.dart';
import 'package:github_search/domain/translator/weather_translator.dart';
import 'package:github_search/presentation/state_management/login_bloc/search_cubit.dart';

class SearchUseCase {
  final SearchRepository _repository = SearchRepository();
  final SearchTranslator _translator = SearchTranslator();
  List<SearchRepoModel> _searchResult = [];

  List<SearchRepoModel> get searchResult => _searchResult;

  List<SearchRepoModel> get lastSearch => _repository.getLastSearch();

  Future<SearchState> search(String word) async {
    SearchState result = SearchInitial();
    final request = _translator.createSearchRequest(word);
    final response = await _repository.search(request);
    await response.fold(
      (l) async => result = SearchFailed(l.toString()),
      (r) async {
        _searchResult = _translator.searchRepoModelFromEntity(r);
        await _repository.saveLastSearch(_searchResult);
        return result = SearchCompleted();
      },
    );
    return result;
  }

  Future addSelected(SearchRepoModel model) async {
    return await _repository.addSelected(model);
  }

  Future removeSelected(SearchRepoModel model) async {
    return await _repository.removeSelected(model);
  }
}
