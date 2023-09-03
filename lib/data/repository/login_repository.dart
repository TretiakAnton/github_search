import 'package:dartz/dartz.dart';
import 'package:github_search/data/data_source/search_data_source.dart';
import 'package:github_search/data/entity/request/search_request.dart';
import 'package:github_search/data/entity/response/search_response.dart';
import 'package:github_search/domain/model/search_repo_model.dart';

class SearchRepository {
  final SearchDataSource _source = SearchDataSource();

  Future<Either<Exception, SearchResponse>> search(
      SearchRequest request) async {
    try {
      final result = await _source.search(request);
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Future saveLastSearch(List<SearchRepoModel> searchResult) async {
    return await _source.saveLastSearch(searchResult);
  }

  List<SearchRepoModel> getLastSearch() {
    return _source.getLastSearch();
  }

  Future addSelected(SearchRepoModel model) async {
    return await _source.addSelected(model);
  }

  Future removeSelected(SearchRepoModel model) async {
    return await _source.removeSelected(model);
  }
}
