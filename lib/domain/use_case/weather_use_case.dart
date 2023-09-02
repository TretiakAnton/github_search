import 'package:github_search/domain/translator/weather_translator.dart';
import 'package:github_search/presentation/state_management/weather_bloc/weather_cubit.dart';

class WeatherUseCase {
  // final WeatherRepository _repository = WeatherRepository();
  final SearchTranslator _translator = SearchTranslator();

  Future<WeatherState> getForecast() async {
    return ForecastInitial();
/*    ///default lat lon for Kyiv
    return await _madeForecastRequest(
        lat: position?.latitude ?? 50.45,
        lon: position?.longitude ?? 30.52,
        isOnline: isInternetAvailable);*/
  }

  Future<WeatherState> _madeForecastRequest({
    required double lat,
    required double lon,
    required bool isOnline,
  }) async {
    WeatherState result = ForecastInitial();
    /* final response = await _repository.getForecast(
      request: _translator.createWeatherRequest(lat: lat, lon: lon),
      isOnline: isOnline,
    );
    response.fold((failure) {
      return result = ForecastFailed(failure.toString());
    }, (forecast) async {
      if (forecast != null) {
        if (isOnline) {
          _fillCache(forecast);
        }
        _dailyForecast =
            _translator.weatherResponseToDailyForecast(forecast: forecast);
        _hourlyForecast =
            _translator.weatherResponseToHourlyForecast(forecast: forecast);
      }
      result = ForecastCompleted();
    });*/
    return result;
  }
}
