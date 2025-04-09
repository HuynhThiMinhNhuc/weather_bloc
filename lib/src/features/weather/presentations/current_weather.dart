import 'package:example_app/src/features/weather/domain/forecast/forecast_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:example_app/src/core/theme/dimens.dart';
import 'package:example_app/src/core/theme/palette.dart';
import 'package:example_app/src/features/weather/cubit/weather_cubit.dart';
import 'package:example_app/src/features/weather/domain/weather/weather_data.dart';
import 'package:example_app/src/features/weather/presentations/widgets/error_state_widget.dart';
import 'package:example_app/src/features/weather/presentations/widgets/spinning_image.dart';

class CurrentWeatherPage extends StatefulWidget {
  static const String routeName = '/currentWeather';

  const CurrentWeatherPage({super.key});

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) => _buildContent(state),
    );
  }

  Widget _buildContent(WeatherState state) {
    switch (state.status) {
      case WeatherStatus.initial:
        return const _LoadingScaffold();
      case WeatherStatus.loading:
        return const SpinningImage();
      case WeatherStatus.loaded:
        return _LoadedWeatherBody(
          weatherData: state.weatherData!,
          forecastData: state.forecastData!,
          city: state.city!,
        );
      case WeatherStatus.error:
        return ErrorStateWidget(onRefresh: _onRefresh);
    }
  }

  void _onRefresh() {
    context.read<WeatherCubit>().fetchWeather();
  }
}

class _LoadingScaffold extends StatelessWidget {
  const _LoadingScaffold();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Palette.kF5F6F7,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class _LoadedWeatherBody extends StatefulWidget {
  const _LoadedWeatherBody({
    required this.weatherData,
    required this.forecastData,
    required this.city,
  });

  final WeatherData weatherData;
  final ForecastData forecastData;
  final String city;

  @override
  State<_LoadedWeatherBody> createState() => _LoadedWeatherBodyState();
}

class _LoadedWeatherBodyState extends State<_LoadedWeatherBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;

  List<WeatherData> _getFilteredForecast() {
    const indices = [
      0,
      8,
      16,
      24,
    ]; // get 4 next days, 3-hour intervals for 24 hours => 8 intervals per day
    return indices.map((i) => widget.forecastData.list[i]).toList();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start off-screen (bottom)
      end: Offset.zero, // End at normal position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    // Trigger the animation slightly after build
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final temperature = widget.weatherData.temp.celsius.toInt().toString();
    final filteredForecast = _getFilteredForecast();

    return Scaffold(
      backgroundColor: Palette.kF5F6F7,
      body: Column(
        children: [
          const SizedBox(height: Dimens.pt56),
          Text(
            '$temperature°',
            style: const TextStyle(
              color: Palette.k2A2A2A,
              fontSize: TextDimens.pt96,
              fontWeight: FontWeight.w900,
              height: 1.2,
            ),
          ),
          Text(
            widget.city,
            style: const TextStyle(
              color: Palette.k556799,
              fontSize: TextDimens.pt36,
              fontWeight: FontWeight.w100,
              height: 1.4,
            ),
          ),
          const SizedBox(height: Dimens.pt62),
          Expanded(
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutCubic,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.pt16,
                    vertical: Dimens.pt16,
                  ),
                  decoration: BoxDecoration(
                    color: Palette.kFFFFFF,
                    boxShadow: [
                      BoxShadow(
                        color: Palette.k2A2A2A.withOpacity(0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ForecastListWidget(forecast: filteredForecast),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ForecastListWidget extends StatelessWidget {
  const ForecastListWidget({super.key, required this.forecast});

  final List<WeatherData> forecast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(forecast.length, (index) {
        final item = forecast[index];
        return Column(
          children: [
            SizedBox(
              height: Dimens.pt80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _forecastText(DateFormat.E().format(item.date)),
                  _forecastText('${item.temp.celsius}°C'),
                ],
              ),
            ),
            if (index < forecast.length - 1)
              const Divider(height: 1, thickness: 1, color: Color(0xFFE5E5E5)),
          ],
        );
      }),
    );
  }

  Widget _forecastText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: Dimens.pt16,
        height: 1.2,
        color: Palette.k2A2A2A,
      ),
    );
  }
}
