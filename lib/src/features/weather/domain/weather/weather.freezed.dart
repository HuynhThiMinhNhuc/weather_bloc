// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherParams {

 double get temp;@JsonKey(name: 'temp_min') double get tempMin;@JsonKey(name: 'temp_max') double get tempMax;
/// Create a copy of WeatherParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherParamsCopyWith<WeatherParams> get copyWith => _$WeatherParamsCopyWithImpl<WeatherParams>(this as WeatherParams, _$identity);

  /// Serializes this WeatherParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherParams&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.tempMin, tempMin) || other.tempMin == tempMin)&&(identical(other.tempMax, tempMax) || other.tempMax == tempMax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temp,tempMin,tempMax);

@override
String toString() {
  return 'WeatherParams(temp: $temp, tempMin: $tempMin, tempMax: $tempMax)';
}


}

/// @nodoc
abstract mixin class $WeatherParamsCopyWith<$Res>  {
  factory $WeatherParamsCopyWith(WeatherParams value, $Res Function(WeatherParams) _then) = _$WeatherParamsCopyWithImpl;
@useResult
$Res call({
 double temp,@JsonKey(name: 'temp_min') double tempMin,@JsonKey(name: 'temp_max') double tempMax
});




}
/// @nodoc
class _$WeatherParamsCopyWithImpl<$Res>
    implements $WeatherParamsCopyWith<$Res> {
  _$WeatherParamsCopyWithImpl(this._self, this._then);

  final WeatherParams _self;
  final $Res Function(WeatherParams) _then;

/// Create a copy of WeatherParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? temp = null,Object? tempMin = null,Object? tempMax = null,}) {
  return _then(_self.copyWith(
temp: null == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as double,tempMin: null == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double,tempMax: null == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WeatherParams implements WeatherParams {
   _WeatherParams({required this.temp, @JsonKey(name: 'temp_min') required this.tempMin, @JsonKey(name: 'temp_max') required this.tempMax});
  factory _WeatherParams.fromJson(Map<String, dynamic> json) => _$WeatherParamsFromJson(json);

@override final  double temp;
@override@JsonKey(name: 'temp_min') final  double tempMin;
@override@JsonKey(name: 'temp_max') final  double tempMax;

/// Create a copy of WeatherParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherParamsCopyWith<_WeatherParams> get copyWith => __$WeatherParamsCopyWithImpl<_WeatherParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherParams&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.tempMin, tempMin) || other.tempMin == tempMin)&&(identical(other.tempMax, tempMax) || other.tempMax == tempMax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temp,tempMin,tempMax);

@override
String toString() {
  return 'WeatherParams(temp: $temp, tempMin: $tempMin, tempMax: $tempMax)';
}


}

/// @nodoc
abstract mixin class _$WeatherParamsCopyWith<$Res> implements $WeatherParamsCopyWith<$Res> {
  factory _$WeatherParamsCopyWith(_WeatherParams value, $Res Function(_WeatherParams) _then) = __$WeatherParamsCopyWithImpl;
@override @useResult
$Res call({
 double temp,@JsonKey(name: 'temp_min') double tempMin,@JsonKey(name: 'temp_max') double tempMax
});




}
/// @nodoc
class __$WeatherParamsCopyWithImpl<$Res>
    implements _$WeatherParamsCopyWith<$Res> {
  __$WeatherParamsCopyWithImpl(this._self, this._then);

  final _WeatherParams _self;
  final $Res Function(_WeatherParams) _then;

/// Create a copy of WeatherParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? temp = null,Object? tempMin = null,Object? tempMax = null,}) {
  return _then(_WeatherParams(
temp: null == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as double,tempMin: null == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double,tempMax: null == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$WeatherInfo {

 String get main; String get description; String get icon;
/// Create a copy of WeatherInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherInfoCopyWith<WeatherInfo> get copyWith => _$WeatherInfoCopyWithImpl<WeatherInfo>(this as WeatherInfo, _$identity);

  /// Serializes this WeatherInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherInfo&&(identical(other.main, main) || other.main == main)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,main,description,icon);

@override
String toString() {
  return 'WeatherInfo(main: $main, description: $description, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $WeatherInfoCopyWith<$Res>  {
  factory $WeatherInfoCopyWith(WeatherInfo value, $Res Function(WeatherInfo) _then) = _$WeatherInfoCopyWithImpl;
@useResult
$Res call({
 String main, String description, String icon
});




}
/// @nodoc
class _$WeatherInfoCopyWithImpl<$Res>
    implements $WeatherInfoCopyWith<$Res> {
  _$WeatherInfoCopyWithImpl(this._self, this._then);

  final WeatherInfo _self;
  final $Res Function(WeatherInfo) _then;

/// Create a copy of WeatherInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? main = null,Object? description = null,Object? icon = null,}) {
  return _then(_self.copyWith(
main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WeatherInfo implements WeatherInfo {
   _WeatherInfo({required this.main, required this.description, required this.icon});
  factory _WeatherInfo.fromJson(Map<String, dynamic> json) => _$WeatherInfoFromJson(json);

@override final  String main;
@override final  String description;
@override final  String icon;

/// Create a copy of WeatherInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherInfoCopyWith<_WeatherInfo> get copyWith => __$WeatherInfoCopyWithImpl<_WeatherInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherInfo&&(identical(other.main, main) || other.main == main)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,main,description,icon);

@override
String toString() {
  return 'WeatherInfo(main: $main, description: $description, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$WeatherInfoCopyWith<$Res> implements $WeatherInfoCopyWith<$Res> {
  factory _$WeatherInfoCopyWith(_WeatherInfo value, $Res Function(_WeatherInfo) _then) = __$WeatherInfoCopyWithImpl;
@override @useResult
$Res call({
 String main, String description, String icon
});




}
/// @nodoc
class __$WeatherInfoCopyWithImpl<$Res>
    implements _$WeatherInfoCopyWith<$Res> {
  __$WeatherInfoCopyWithImpl(this._self, this._then);

  final _WeatherInfo _self;
  final $Res Function(_WeatherInfo) _then;

/// Create a copy of WeatherInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? main = null,Object? description = null,Object? icon = null,}) {
  return _then(_WeatherInfo(
main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Weather {

@JsonKey(name: 'main') WeatherParams get weatherParams;@JsonKey(name: 'weather') List<WeatherInfo> get weatherInfo; int get dt;
/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherCopyWith<Weather> get copyWith => _$WeatherCopyWithImpl<Weather>(this as Weather, _$identity);

  /// Serializes this Weather to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Weather&&(identical(other.weatherParams, weatherParams) || other.weatherParams == weatherParams)&&const DeepCollectionEquality().equals(other.weatherInfo, weatherInfo)&&(identical(other.dt, dt) || other.dt == dt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weatherParams,const DeepCollectionEquality().hash(weatherInfo),dt);

@override
String toString() {
  return 'Weather(weatherParams: $weatherParams, weatherInfo: $weatherInfo, dt: $dt)';
}


}

/// @nodoc
abstract mixin class $WeatherCopyWith<$Res>  {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) _then) = _$WeatherCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'main') WeatherParams weatherParams,@JsonKey(name: 'weather') List<WeatherInfo> weatherInfo, int dt
});


$WeatherParamsCopyWith<$Res> get weatherParams;

}
/// @nodoc
class _$WeatherCopyWithImpl<$Res>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._self, this._then);

  final Weather _self;
  final $Res Function(Weather) _then;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weatherParams = null,Object? weatherInfo = null,Object? dt = null,}) {
  return _then(_self.copyWith(
weatherParams: null == weatherParams ? _self.weatherParams : weatherParams // ignore: cast_nullable_to_non_nullable
as WeatherParams,weatherInfo: null == weatherInfo ? _self.weatherInfo : weatherInfo // ignore: cast_nullable_to_non_nullable
as List<WeatherInfo>,dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherParamsCopyWith<$Res> get weatherParams {
  
  return $WeatherParamsCopyWith<$Res>(_self.weatherParams, (value) {
    return _then(_self.copyWith(weatherParams: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Weather implements Weather {
   _Weather({@JsonKey(name: 'main') required this.weatherParams, @JsonKey(name: 'weather') required final  List<WeatherInfo> weatherInfo, required this.dt}): _weatherInfo = weatherInfo;
  factory _Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

@override@JsonKey(name: 'main') final  WeatherParams weatherParams;
 final  List<WeatherInfo> _weatherInfo;
@override@JsonKey(name: 'weather') List<WeatherInfo> get weatherInfo {
  if (_weatherInfo is EqualUnmodifiableListView) return _weatherInfo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weatherInfo);
}

@override final  int dt;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherCopyWith<_Weather> get copyWith => __$WeatherCopyWithImpl<_Weather>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Weather&&(identical(other.weatherParams, weatherParams) || other.weatherParams == weatherParams)&&const DeepCollectionEquality().equals(other._weatherInfo, _weatherInfo)&&(identical(other.dt, dt) || other.dt == dt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weatherParams,const DeepCollectionEquality().hash(_weatherInfo),dt);

@override
String toString() {
  return 'Weather(weatherParams: $weatherParams, weatherInfo: $weatherInfo, dt: $dt)';
}


}

/// @nodoc
abstract mixin class _$WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$WeatherCopyWith(_Weather value, $Res Function(_Weather) _then) = __$WeatherCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'main') WeatherParams weatherParams,@JsonKey(name: 'weather') List<WeatherInfo> weatherInfo, int dt
});


@override $WeatherParamsCopyWith<$Res> get weatherParams;

}
/// @nodoc
class __$WeatherCopyWithImpl<$Res>
    implements _$WeatherCopyWith<$Res> {
  __$WeatherCopyWithImpl(this._self, this._then);

  final _Weather _self;
  final $Res Function(_Weather) _then;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weatherParams = null,Object? weatherInfo = null,Object? dt = null,}) {
  return _then(_Weather(
weatherParams: null == weatherParams ? _self.weatherParams : weatherParams // ignore: cast_nullable_to_non_nullable
as WeatherParams,weatherInfo: null == weatherInfo ? _self._weatherInfo : weatherInfo // ignore: cast_nullable_to_non_nullable
as List<WeatherInfo>,dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherParamsCopyWith<$Res> get weatherParams {
  
  return $WeatherParamsCopyWith<$Res>(_self.weatherParams, (value) {
    return _then(_self.copyWith(weatherParams: value));
  });
}
}

// dart format on
