import 'package:example_app/src/core/config/app_constant.dart';
import 'package:example_app/src/core/network/api_provider.dart';
import 'package:example_app/src/core/network/api_response.dart';
import 'package:example_app/src/features/weather/domain/forecast/forecast.dart';
import 'package:example_app/src/features/weather/domain/weather/weather.dart';

class WeatherRepository {
  final APIProvider apiProvider;

  WeatherRepository({required this.apiProvider});

  Future<ResponseData<Weather>> getWeather({
    required double lon,
    required double lat,
  }) async {
    try {
      final params = {"lat": lat, "lon": lon, "units": "metric"};

      final res = await apiProvider.get(
        AppConstants.weatherEndpoint,
        params: params,
      );

      final weather = Weather.fromJson(res);
      return ResponseData.success(weather);
    } catch (e) {
      return ResponseData.error(e);
    }
  }

  Future<ResponseData<Forecast>> getForecast({
    required double lon,
    required double lat,
  }) async {
    try {
      final params = {"lat": lat, "lon": lon, "units": "metric"};

      final res = await apiProvider.get(
        AppConstants.forecastEndpoint,
        params: params,
      );

      final forecast = Forecast.fromJson(res);
      return ResponseData.success(forecast);
    } catch (e) {
      return ResponseData.error(e);
    }
  }
}
