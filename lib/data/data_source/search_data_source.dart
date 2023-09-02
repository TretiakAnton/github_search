import 'dart:convert';

import 'package:github_search/core/constants.dart';
import 'package:github_search/core/networking/rest_loggy.dart';
import 'package:github_search/data/data_source/box_manager.dart';
import 'package:github_search/data/entity/request/search_request.dart';
import 'package:github_search/data/entity/response/search_response.dart';
import 'package:github_search/domain/model/search_repo_model.dart';
import 'package:http/http.dart' as http;

class SearchDataSource with RestLoggy {
  final BoxManager _boxManager = BoxManager();

  Future<SearchResponse> search(SearchRequest request) async {
    loggy.debug(request);
    final url = Uri.parse('$baseUrl?q=${request.searchWord}');
    final http.Response response = await http.get(url);
    final json = jsonDecode(response.body);
    loggy.debug(json);
    return SearchResponse.fromJson(json);
  }

  Future saveLastSearch(List<SearchRepoModel> searchResult) async {
    return await _boxManager.saveLastSearch(searchResult);
  }

  List<SearchRepoModel> getLastSearch() {
    return _boxManager.getLastSearch() ?? [];
  }
}
