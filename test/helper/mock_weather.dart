import 'package:example_app/src/features/weather/domain/weather/weather.dart';

Weather createMockWeather() {
  return Weather(
    dt: 1696867200,
    weatherInfo: [WeatherInfo(main: 'Cloudy', description: 'Overcast')],
    weatherParams: WeatherParams(temp: 27.84, tempMin: 27.03, tempMax: 27.84),
  );
}
