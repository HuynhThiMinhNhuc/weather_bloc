part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, loaded, error }

class WeatherState extends Equatable {
  final WeatherStatus status;
  final WeatherData? weatherData;
  final ForecastData? forecastData;
  final String? city;

  const WeatherState({
    this.status = WeatherStatus.initial,
    this.weatherData,
    this.forecastData,
    this.city,
  });

  const WeatherState.loading()
    : status = WeatherStatus.loading,
      weatherData = null,
      forecastData = null,
      city = null;

  const WeatherState.initial()
    : status = WeatherStatus.initial,
      weatherData = null,
      forecastData = null,
      city = null;

  const WeatherState.loaded(
    WeatherData this.weatherData,
    ForecastData this.forecastData,
    String this.city,
  ) : status = WeatherStatus.loaded;

  const WeatherState.error()
    : status = WeatherStatus.error,
      weatherData = null,
      forecastData = null,
      city = null;

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherData? weatherData,
    ForecastData? forecastData,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weatherData: weatherData ?? this.weatherData,
      forecastData: forecastData ?? this.forecastData,
    );
  }

  @override
  List<Object?> get props => [status, weatherData, forecastData];
}
