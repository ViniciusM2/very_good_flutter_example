part of 'two_numbers_bloc.dart';

enum Operation { none, add, subtract, multiply, divide }

/// {@template two_numbers_state}
/// TwoNumbersState description
/// {@endtemplate}
class TwoNumbersState extends Equatable {
  /// {@macro two_numbers_state}
  const TwoNumbersState({
    this.operation = Operation.none,
    this.firstNumber = 0,
    this.secondNumber = 0,
    this.result = 0,
  });

  /// Operation to perform
  final Operation operation;

  /// First number
  final num firstNumber;

  /// Second number
  final num secondNumber;

  /// Result of the operation
  final num result;

  @override
  List<Object> get props => [operation, firstNumber, secondNumber, result];

  /// Creates a copy of the current TwoNumbersState with property changes
  TwoNumbersState copyWith({
    Operation? operation,
    num? firstNumber,
    num? secondNumber,
    num? result,
  }) {
    return TwoNumbersState(
      operation: operation ?? this.operation,
      firstNumber: firstNumber ?? this.firstNumber,
      secondNumber: secondNumber ?? this.secondNumber,
      result: result ?? this.result,
    );
  }
}

/// {@template two_numbers_initial}
/// The initial state of TwoNumbersState
/// {@endtemplate}
class TwoNumbersInitial extends TwoNumbersState {
  /// {@macro two_numbers_initial}
  const TwoNumbersInitial() : super();
}
