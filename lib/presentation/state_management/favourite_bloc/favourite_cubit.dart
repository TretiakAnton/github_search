import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/domain/model/search_repo_model.dart';
import 'package:github_search/domain/use_case/favourite_use_case.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  final FavouriteUseCase _useCase = FavouriteUseCase();

  List<SearchRepoModel> get elements => _useCase.favourites;

  Future addSelected(SearchRepoModel model) async {
    await _useCase.addSelected(model);
    emit(FavouriteUpdated());
  }

  Future removeSelected(SearchRepoModel model) async {
    await _useCase.removeSelected(model);
    emit(FavouriteUpdated());
  }
}
