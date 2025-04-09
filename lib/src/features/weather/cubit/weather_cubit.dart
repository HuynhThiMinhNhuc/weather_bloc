import 'package:equatable/equatable.dart';
import 'package:example_app/src/core/config/locator.dart';
import 'package:example_app/src/core/services/location_service.dart';
import 'package:example_app/src/features/weather/data/weather_repository.dart';
import 'package:example_app/src/features/weather/domain/forecast/forecast_data.dart';
import 'package:example_app/src/features/weather/domain/weather/weather_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit()
    : _weatherRepository = locator.get<WeatherRepository>(),
      super(WeatherState.initial()) {
    fetchWeather();
  }

  final WeatherRepository _weatherRepository;

  Future<void> fetchWeather() async {
    emit(WeatherState.loading());
    final locationService = LocationService();

    try {
      final location = await locationService.getLocationInfo();
      final latitude = location.latitude;
      final longitude = location.longitude;

      final weatherResponse = await _weatherRepository.getWeather(
        lat: latitude,
        lon: longitude,
      );
      final forecastResponse = await _weatherRepository.getForecast(
        lat: latitude,
        lon: longitude,
      );

      if (weatherResponse.isSuccess && forecastResponse.isSuccess) {
        final weather = weatherResponse.data!;
        final forecast = forecastResponse.data!;
        emit(
          WeatherState.loaded(
            WeatherData.from(weather),
            ForecastData.from(forecast),
            location.city,
          ),
        );
      } else {
        emit(WeatherState.error());
      }
    } catch (e) {
      emit(WeatherState.error());
    }
  }
}
