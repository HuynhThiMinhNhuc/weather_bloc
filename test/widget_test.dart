import 'package:example_app/src/core/network/api_response.dart';
import 'package:example_app/src/features/weather/data/weather_repository.dart';
import 'package:example_app/src/features/weather/domain/forecast/forecast.dart';
import 'package:example_app/src/features/weather/domain/forecast/forecast_data.dart';
import 'package:example_app/src/features/weather/domain/weather/weather.dart';
import 'package:example_app/src/features/weather/domain/weather/weather_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'helper/mock_api_provider.mocks.dart';
import 'helper/mock_forecast.dart';
import 'helper/mock_weather.dart';

void main() {
  group('WeatherData.from', () {
    test('from() should map Weather correctly', () {
      final mockWeather = createMockWeather();
      final weatherData = WeatherData.from(mockWeather);

      expect(weatherData.temp.celsius, 27.84);
      expect(weatherData.minTemp.celsius, 27.03);
      expect(weatherData.maxTemp.celsius, 27.84);
      expect(weatherData.description, 'Cloudy');
      expect(
        weatherData.date,
        DateTime.fromMillisecondsSinceEpoch(1696867200 * 1000),
      );
    });
  });

  group('ForecastData.from', () {
    test(
      'should convert a Forecast into ForecastData with correct WeatherData items',
      () {
        // Arrange
        final forecast = createMockForecast();

        // Act
        final forecastData = ForecastData.from(forecast);

        // Assert
        expect(forecastData.list.length, 2);

        final first = forecastData.list[0];
        expect(first.temp.celsius, 25);
        expect(first.minTemp.celsius, 22);
        expect(first.maxTemp.celsius, 27);
        expect(first.description, 'Clear');
        expect(first.date.millisecondsSinceEpoch, 1700000000 * 1000);

        final second = forecastData.list[1];
        expect(second.description, 'Rain');
        expect(second.temp.celsius, 27.84);
      },
    );
  });

  late WeatherRepository repository;
  late MockAPIProvider mockAPIProvider;

  setUp(() {
    mockAPIProvider = MockAPIProvider();
    repository = WeatherRepository(apiProvider: mockAPIProvider);
  });

  group('WeatherRepository', () {
    test('getWeather returns ResponseData.success with Weather', () async {
      // Arrange
      const lat = 10.0, lon = 20.0;
      final mockJson = {
        "dt": 1700000000,
        "weather": [
          {"main": "Clear", "description": "Sunny"},
        ],
        "main": {
          "temp": 25.0,
          "temp_min": 22.0,
          "temp_max": 28.0,
          "pressure": 1010,
          "humidity": 80,
        },
      };

      when(
        mockAPIProvider.get(any, params: anyNamed('params')),
      ).thenAnswer((_) async => mockJson);

      // Act
      final result = await repository.getWeather(lat: lat, lon: lon);

      // Assert
      expect(result.isSuccess, true);
      expect(result.data, isA<Weather>());
      expect(result.data?.weatherInfo[0].main, 'Clear');
    });

    test('getForecast returns ResponseData.success with Forecast', () async {
      // Arrange
      const lat = 10.0, lon = 20.0;
      final mockJson = {
        "list": [
          {
            "dt": 1700000000,
            "weather": [
              {"main": "Rain", "description": "light rain"},
            ],
            "main": {
              "temp": 24.0,
              "temp_min": 21.0,
              "temp_max": 26.0,
              "pressure": 1008,
              "humidity": 90,
            },
          },
        ],
      };

      when(
        mockAPIProvider.get(any, params: anyNamed('params')),
      ).thenAnswer((_) async => mockJson);

      // Act
      final result = await repository.getForecast(lat: lat, lon: lon);

      // Assert
      expect(result.isSuccess, true);
      expect(result.data, isA<Forecast>());
      expect(result.data?.list.first.weatherInfo[0].main, 'Rain');
    });

    test('getWeather returns error ResponseData on exception', () async {
      when(
        mockAPIProvider.get(any, params: anyNamed('params')),
      ).thenThrow(Exception('Network error'));

      final result = await repository.getWeather(lat: 0, lon: 0);

      expect(result.isSuccess, false);
      expect(result, isA<ResponseData>());
    });

    test('getForecast returns error ResponseData on exception', () async {
      when(
        mockAPIProvider.get(any, params: anyNamed('params')),
      ).thenThrow(Exception('API failed'));

      final result = await repository.getForecast(lat: 0, lon: 0);

      expect(result.isSuccess, false);
      expect(result, isA<ResponseData>());
    });
  });
}
