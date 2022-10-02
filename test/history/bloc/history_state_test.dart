// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:oop_class_flutter_template/history/bloc/bloc.dart';

void main() {
  group('HistoryState', () {
    test('supports value equality', () {
      expect(
        HistoryState(),
        equals(
          const HistoryState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const HistoryState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const historyState = HistoryState(
            customProperty: 'My property',
          );
          expect(
            historyState.copyWith(),
            equals(historyState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const historyState = HistoryState(
            customProperty: 'My property',
          );
          final otherHistoryState = HistoryState(
            customProperty: 'My property 2',
          );
          expect(historyState, isNot(equals(otherHistoryState)));

          expect(
            historyState.copyWith(
              customProperty: otherHistoryState.customProperty,
            ),
            equals(otherHistoryState),
          );
        },
      );
    });
  });
}
