import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'main_screen_event.dart';
import 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc(super.initialState) {
    on<MainScreenEvent>(
      (event, emit) {
        return emit.forEach<MainScreenState>(
          event.applyAsync(currentState: state, bloc: this),
          onData: (state) => state,
          onError: (error, stackTrace) {
            developer.log('$error',
                name: 'MainScreenBloc', error: error, stackTrace: stackTrace);
            return ErrorMainScreenState(error.toString());
          },
        );
      },
    );
  }
}
