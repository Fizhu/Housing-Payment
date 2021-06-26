import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    print('bloc: ${bloc.runtimeType}, event: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase blocBase, Change change) {
    print('cubit: ${blocBase.runtimeType}, change: $change');
    super.onChange(blocBase, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('bloc: ${bloc.runtimeType}, transition: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase blocBase, Object error, StackTrace stackTrace) {
    print('cubit: ${blocBase.runtimeType}, error: $error');
    super.onError(blocBase, error, stackTrace);
  }
}