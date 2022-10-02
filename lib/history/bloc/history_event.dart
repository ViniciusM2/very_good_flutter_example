part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();
}

/// {@template custom_history_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomHistoryEvent extends HistoryEvent {
  /// {@macro custom_history_event}
  const CustomHistoryEvent();

  @override
  List<Object> get props => [];
}

class HasDataEvent extends HistoryEvent {
  const HasDataEvent({required this.data});
  final List<TwoNumbersModel> data;

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}
