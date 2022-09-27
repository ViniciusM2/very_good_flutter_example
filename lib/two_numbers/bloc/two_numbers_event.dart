part of 'two_numbers_bloc.dart';

abstract class TwoNumbersEvent extends Equatable {
  const TwoNumbersEvent();
}

/// {@template custom_two_numbers_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomTwoNumbersEvent extends TwoNumbersEvent {
  /// {@macro custom_two_numbers_event}
  const CustomTwoNumbersEvent();

  @override
  List<Object> get props => [];
}

class FirstNumberUpdated extends TwoNumbersEvent {
  const FirstNumberUpdated({required this.firstNumber});

  final num firstNumber;

  @override
  List<Object> get props => [firstNumber];
}

class SecondNumberUpdated extends TwoNumbersEvent {
  const SecondNumberUpdated({required this.secondNumber});

  final num secondNumber;

  @override
  List<Object> get props => [secondNumber];
}

class NextOperationSelected extends TwoNumbersEvent {
  const NextOperationSelected();

  @override
  List<Object> get props => [];
}

class PreviousOperationSelected extends TwoNumbersEvent {
  const PreviousOperationSelected();

  @override
  List<Object> get props => [];
}

class SaveButtonPressed extends TwoNumbersEvent {
  const SaveButtonPressed();

  @override
  List<Object> get props => [];
}
