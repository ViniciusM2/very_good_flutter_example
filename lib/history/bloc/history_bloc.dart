import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oop_class_flutter_template/history/repository/history_repository.dart';
import 'package:oop_class_flutter_template/two_numbers/models/two_numbers_model.dart';
part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({
    required this.repository,
  }) : super(HistoryInitial()) {
    on<CustomHistoryEvent>(_onCustomHistoryEvent);
    on<HasDataEvent>(_onHasDataEvent);
    repository.history().listen(
      (event) {
        add(
          HasDataEvent(data: event),
        );
      },
    );
  }
  final HistoryRepository repository;

  FutureOr<void> _onCustomHistoryEvent(
    CustomHistoryEvent event,
    Emitter<HistoryState> emit,
  ) {
    // TODO: Add Logic
  }

  FutureOr<void> _onHasDataEvent(
    HasDataEvent event,
    Emitter<HistoryState> emit,
  ) {
    // print(event.data);
    emit(
      HistorySuccess(
        history: List.from(event.data),
      ),
    );
  }

  @override
  Future<void> close() {
    repository.dispose();
    return super.close();
  }
}
