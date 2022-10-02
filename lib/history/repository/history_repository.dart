import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oop_class_flutter_template/two_numbers/models/two_numbers_model.dart';
import 'dart:async';

abstract class HistoryRepository {
  Stream<List<TwoNumbersModel>> history();
  void dispose();
  void refresh();
}

class HistoryRepositoryMemory implements HistoryRepository {
  final StreamController<List<TwoNumbersModel>> _history = StreamController();

  @override
  void refresh() {
    _history.add([
      TwoNumbersModel(
        firstNumber: 1,
        secondNumber: 2,
        operation: Operation.add,
        result: 3,
      )
    ]);
  }

  @override
  void dispose() {
    _history.close();
  }

  @override
  Stream<List<TwoNumbersModel>> history() => _history.stream;
}

class HistoryRepositoryFirebase implements HistoryRepository {
  final _loadedData = StreamController<List<TwoNumbersModel>>();

  final _cache = <TwoNumbersModel>[];

  @override
  void dispose() {
    _loadedData.close();
  }

  @override
  Stream<List<TwoNumbersModel>> history() => _loadedData.stream;

  @override
  void refresh() {
    FirebaseFirestore.instance
        .collection('two_numbers')
        .snapshots()
        .listen((event) {
      _cache.clear();
      for (final element in event.docs) {
        final doc = element.data();
        _cache.add(TwoNumbersModel.fromMap(doc));
      }
      _loadedData.add(_cache);
    });
  }
}
