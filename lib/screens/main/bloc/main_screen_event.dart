import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:name_to_age/services/age.service.dart';

import 'main_screen_bloc.dart';
import 'main_screen_state.dart';

@immutable
abstract class MainScreenEvent {
  Stream<MainScreenState> applyAsync(
      {MainScreenState currentState, MainScreenBloc bloc});
}

class ResetMainScreenEvent extends MainScreenEvent {
  @override
  Stream<MainScreenState> applyAsync(
      {MainScreenState? currentState, MainScreenBloc? bloc}) async* {
    yield InitMainScreenState();
  }
}

class GetAgeEstimationEvent extends MainScreenEvent {
  GetAgeEstimationEvent({required this.name});
  final String name;
  @override
  Stream<MainScreenState> applyAsync({
    MainScreenState? currentState,
    MainScreenBloc? bloc,
  }) async* {
    try {
      yield AgeLoadingMainScreenState();
      final result = await useAgeService().getAgeEstimation(name);
      yield AgeLoadedMainScreenState(result.name ?? name, result.age);
      
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadMainScreenEvent', error: _, stackTrace: stackTrace);
      yield ErrorMainScreenState(_.toString());
    }
  }
}
