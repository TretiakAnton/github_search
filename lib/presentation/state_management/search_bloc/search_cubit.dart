import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/domain/model/search_repo_model.dart';
import 'package:github_search/domain/use_case/search_use_case.dart';
import 'package:github_search/presentation/view/widgets/snackbar.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final SearchUseCase _useCase = SearchUseCase();
  bool _searchMade = false;
  bool _focused = false;
  String _text = '';

  bool get focused => _focused;

  bool get searchMade => _searchMade;

  List<SearchRepoModel> get elements =>
      _searchMade ? _useCase.searchResult : _useCase.lastSearch;

  set focused(bool value) {
    _focused = value;
    emit(SearchFocusChanged());
  }

  set textUpdate(String value) {
    bool needEmit = false;
    if (_text == '' && value != '') {
      needEmit = true;
    }
    if (_text != '' && value == '') {
      needEmit = true;
    }
    if (needEmit) {
      emit(TextEmptyChanged());
    }
    _text = value;
  }

  Future<void> search(String word) async {
    emit(SearchInProgress());
    _searchMade = true;
    SearchState resultState = await _useCase.search(word);
    if (resultState is SearchFailed) {
      OrdinarySnackbar().showSnackBar(label: resultState.error ?? 'Error');
    }
    emit(resultState);
    return;
  }

  Future addSelected(SearchRepoModel model) async {
    return await _useCase.addSelected(model);
  }

  Future removeSelected(SearchRepoModel model) async {
    return await _useCase.removeSelected(model);
  }
}
