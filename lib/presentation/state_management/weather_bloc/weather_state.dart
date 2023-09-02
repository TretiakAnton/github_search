part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class ForecastInitial extends WeatherState {}

class ForecastInProgress extends WeatherState {}

class ForecastCompleted extends WeatherState {}

class ForecastFailed extends WeatherState {
  final String? error;

  ForecastFailed(this.error);
}
