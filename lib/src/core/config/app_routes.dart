import 'package:example_app/src/features/weather/presentations/current_weather.dart';
import 'package:go_router/go_router.dart';

final GoRouter routers = GoRouter(
  initialLocation: CurrentWeatherPage.routeName,
  routes: [
    GoRoute(
      path: CurrentWeatherPage.routeName,
      builder: (_, __) {
        return const CurrentWeatherPage();
      },
    ),
  ],
);
