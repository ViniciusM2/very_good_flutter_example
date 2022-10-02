// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oop_class_flutter_template/history/bloc/bloc.dart';

void main() {
  group('HistoryBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          HistoryBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final historyBloc = HistoryBloc();
      expect(historyBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<HistoryBloc, HistoryState>(
      'CustomHistoryEvent emits nothing',
      build: HistoryBloc.new,
      act: (bloc) => bloc.add(const CustomHistoryEvent()),
      expect: () => <HistoryState>[],
    );
  });
}
