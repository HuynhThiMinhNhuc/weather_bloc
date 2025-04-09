// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Forecast _$ForecastFromJson(Map<String, dynamic> json) => _Forecast(
  list:
      (json['list'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ForecastToJson(_Forecast instance) => <String, dynamic>{
  'list': instance.list,
};
