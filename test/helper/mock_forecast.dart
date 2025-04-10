// test/helpers/mock_forecast.dart

import 'package:example_app/src/features/weather/domain/forecast/forecast.dart';
import 'package:example_app/src/features/weather/domain/weather/weather.dart';

Forecast createMockForecast() {
  return Forecast(
    list: [
      Weather(
        dt: 1700000000, // epoch in seconds
        weatherInfo: [WeatherInfo(main: 'Clear', description: 'Sunny')],
        weatherParams: WeatherParams(temp: 25, tempMin: 22, tempMax: 27),
      ),
      Weather(
        dt: 1700086400,
        weatherInfo: [WeatherInfo(main: 'Rain', description: 'Light rain')],
        weatherParams: WeatherParams(
          temp: 27.84,
          tempMin: 27.03,
          tempMax: 27.84,
        ),
      ),
    ],
  );
}
