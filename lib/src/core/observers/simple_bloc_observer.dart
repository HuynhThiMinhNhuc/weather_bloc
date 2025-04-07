// We can extend `BlocObserver` and override `onTransition` and `onError`
// in order to handle transitions and errors from all Blocs.
import 'package:example_app/src/core/config/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    locator.get<Logger>().d('BLOC EVENT: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    locator.get<Logger>().d('BLOC TRANSITION: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    locator.get<Logger>().e(error);
    locator.get<Logger>().e(stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    locator.get<Logger>().d('BLOC CREATE: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    locator.get<Logger>().d(
      'BLOC ONCHANGE CUBIT: ${bloc.runtimeType} change:  $change',
    );
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    locator.get<Logger>().d('BLOC ONCLOSE CUBIT: ${bloc.runtimeType}');
  }
}
