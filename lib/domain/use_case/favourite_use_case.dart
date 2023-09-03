import 'package:github_search/data/repository/search_repository.dart';
import 'package:github_search/domain/model/search_repo_model.dart';

class FavouriteUseCase {
  final SearchRepository _repository = SearchRepository();

  List<SearchRepoModel> get favourites => _repository.getFavourites();

  Future addSelected(SearchRepoModel model) async {
    return await _repository.addSelected(model);
  }

  Future removeSelected(SearchRepoModel model) async {
    return await _repository.removeSelected(model);
  }
}
