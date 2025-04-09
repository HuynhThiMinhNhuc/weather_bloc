// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherParams _$WeatherParamsFromJson(Map<String, dynamic> json) =>
    _WeatherParams(
      temp: (json['temp'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherParamsToJson(_WeatherParams instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
    };

_WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) => _WeatherInfo(
  main: json['main'] as String,
  description: json['description'] as String,
  icon: json['icon'] as String,
);

Map<String, dynamic> _$WeatherInfoToJson(_WeatherInfo instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

_Weather _$WeatherFromJson(Map<String, dynamic> json) => _Weather(
  weatherParams: WeatherParams.fromJson(json['main'] as Map<String, dynamic>),
  weatherInfo:
      (json['weather'] as List<dynamic>)
          .map((e) => WeatherInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
  dt: (json['dt'] as num).toInt(),
);

Map<String, dynamic> _$WeatherToJson(_Weather instance) => <String, dynamic>{
  'main': instance.weatherParams,
  'weather': instance.weatherInfo,
  'dt': instance.dt,
};
