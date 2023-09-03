part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteInProgress extends FavouriteState {}

class FavouriteCompleted extends FavouriteState {}

class FavouriteUpdated extends FavouriteState {}

class FavouriteFailed extends FavouriteState {
  final String? error;

  FavouriteFailed(this.error);
}
