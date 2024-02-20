import 'package:equatable/equatable.dart';

abstract class MainScreenState extends Equatable {
  MainScreenState();

  @override
  List<Object?> get props => [];
}

/// Initial State
class InitMainScreenState extends MainScreenState {
  InitMainScreenState();

  @override
  String toString() => 'InitMainScreenState';
}

/// Age Loading
class AgeLoadingMainScreenState extends MainScreenState {
  AgeLoadingMainScreenState();

  @override
  String toString() => 'AgeLoadingMainScreenState';
}

/// Age Loaded
class AgeLoadedMainScreenState extends MainScreenState {
  AgeLoadedMainScreenState(this.name, this.age);
  final String name;
  final int? age;

  @override
  String toString() => 'AgeLoadedMainScreenState';

  @override
  List<Object?> get props => [name, age];
}

class ErrorMainScreenState extends MainScreenState {
  ErrorMainScreenState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorMainScreenState';

  @override
  List<Object> get props => [errorMessage];
}
