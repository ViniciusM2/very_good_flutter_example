part of 'history_bloc.dart';

/// {@template history_state}
/// HistoryState description
/// {@endtemplate}
class HistoryState extends Equatable {
  /// {@macro history_state}
  const HistoryState({
    this.history = const [],
  });

  /// A description for customProperty
  final List<TwoNumbersModel> history;

  @override
  List<Object> get props => [history];

  /// Creates a copy of the current HistoryState with property changes
  HistoryState copyWith({
    required List<TwoNumbersModel> history,
  }) {
    return HistoryState(
      history: history,
    );
  }
}

/// {@template history_initial}
/// The initial state of HistoryState
/// {@endtemplate}
class HistoryInitial extends HistoryState {
  /// {@macro history_Loading}
  HistoryInitial() : super(history: []);
}

class HistorySuccess extends HistoryState {
  /// {@macro history_Loading}
  const HistorySuccess({required super.history});

  @override
  HistoryState copyWith({required List<TwoNumbersModel> history}) {
    return HistorySuccess(history: history);
  }
}

class HistoryError extends HistoryState {
  /// {@macro history_Loading}
  const HistoryError() : super();
}
