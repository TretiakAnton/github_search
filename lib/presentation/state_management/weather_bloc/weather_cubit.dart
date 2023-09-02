import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/domain/use_case/weather_use_case.dart';
import 'package:github_search/presentation/view/widgets/snackbar.dart';

part 'weather_state.dart';

class FavouriteCubit extends Cubit<WeatherState> {
  FavouriteCubit() : super(ForecastInitial());

  final WeatherUseCase _useCase = WeatherUseCase();

  Future<void> getForecast() async {
    emit(ForecastInProgress());
    WeatherState resultState = await _useCase.getForecast();
    if (resultState is ForecastFailed) {
      OrdinarySnackbar().showSnackBar(label: resultState.error ?? 'Error');
      resultState = ForecastCompleted();
    }
    emit(resultState);
    return;
  }
}
