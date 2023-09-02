part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchInProgress extends SearchState {}

class SearchCompleted extends SearchState {}

class SearchFocusChanged extends SearchState {}

class TextEmptyChanged extends SearchState {}

class SearchFailed extends SearchState {
  final String? error;

  SearchFailed(this.error);
}
