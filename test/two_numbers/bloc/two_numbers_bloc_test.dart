// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oop_class_flutter_template/two_numbers/bloc/bloc.dart';
import 'package:oop_class_flutter_template/two_numbers/models/two_numbers_model.dart';

void main() {
  group('TwoNumbersBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          TwoNumbersBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final twoNumbersBloc = TwoNumbersBloc();
      expect(twoNumbersBloc.state.operation, equals(Operation.none));
    });

    blocTest<TwoNumbersBloc, TwoNumbersState>(
      'CustomTwoNumbersEvent emits nothing',
      build: TwoNumbersBloc.new,
      act: (bloc) => bloc.add(const CustomTwoNumbersEvent()),
      expect: () => <TwoNumbersState>[],
    );
  });
}
