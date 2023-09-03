import 'package:github_search/data/entity/request/search_request.dart';
import 'package:github_search/data/entity/response/search_response.dart';
import 'package:github_search/domain/model/search_repo_model.dart';

class SearchTranslator {
  SearchRequest createSearchRequest(String word) {
    return SearchRequest(searchWord: word);
  }

  List<SearchRepoModel> searchRepoModelFromEntity(SearchResponse r) {
    List<SearchRepoModel> result = [];
    if (r.items?.isNotEmpty ?? false) {
      for (SearchEntity entity in r.items!) {
        result.add(SearchRepoModel(id: entity.id!.toInt(), name: entity.name!));
      }
    }
    return result.take(15).toList();
  }
}
