// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:oop_class_flutter_template/two_numbers/bloc/bloc.dart';

void main() {
  group('TwoNumbersEvent', () {  
    group('CustomTwoNumbersEvent', () {
      test('supports value equality', () {
        expect(
          const CustomTwoNumbersEvent(),
          isNotNull
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CustomTwoNumbersEvent(),
          equals(const CustomTwoNumbersEvent()),
        );
      });
    });
  });
}
