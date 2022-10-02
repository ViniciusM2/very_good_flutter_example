// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:oop_class_flutter_template/two_numbers/bloc/bloc.dart';

void main() {
  group('TwoNumbersEvent', () {
    group('CustomTwoNumbersEvent', () {
      test('can be instantiated', () {
        expect(
          const CustomTwoNumbersEvent(),
          isNotNull,
        );
      });

      test('supports value equality', () {
        expect(
          CustomTwoNumbersEvent(),
          equals(const CustomTwoNumbersEvent()),
        );
      });
    });
    group('FirstNumberUpdated', () {
      test('can be instantiated', () {
        expect(
          const FirstNumberUpdated(firstNumber: 1),
          isNotNull,
        );
      });
      test('supports value equality', () {
        expect(
          FirstNumberUpdated(firstNumber: 0),
          equals(
            const FirstNumberUpdated(firstNumber: 0),
          ),
        );
      });
    });
    group('SecondNumberUpdated', () {
      test('can be instantiated', () {
        expect(
          const SecondNumberUpdated(secondNumber: 1),
          isNotNull,
        );
      });
      test('supports value equality', () {
        expect(
          SecondNumberUpdated(secondNumber: 0),
          equals(
            const SecondNumberUpdated(secondNumber: 0),
          ),
        );
      });
    });
    group('NextOperationSelected', () {
      test('can be instantiated', () {
        expect(
          const NextOperationSelected(),
          isNotNull,
        );
      });
      test('supports value equality', () {
        expect(
          NextOperationSelected(),
          equals(const NextOperationSelected()),
        );
      });
    });
    group('PreviousOperationSelected', () {
      test('can be instantiated', () {
        expect(
          const PreviousOperationSelected(),
          isNotNull,
        );
      });
      test('supports value equality', () {
        expect(
          PreviousOperationSelected(),
          equals(const PreviousOperationSelected()),
        );
      });
    });
    group('SaveButtonPressed', () {
      test('can be instantiated', () {
        expect(
          const SaveButtonPressed(),
          isNotNull,
        );
      });
      test('supports value equality', () {
        expect(
          SaveButtonPressed(),
          equals(const SaveButtonPressed()),
        );
      });
    });
  });
}
