// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oop_class_flutter_template/two_numbers/two_numbers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TwoNumbersPage', () {
    group('route', () {
      test('is routable', () {
        expect(TwoNumbersPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders TwoNumbersView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: TwoNumbersPage()));
      expect(find.byType(TwoNumbersView), findsOneWidget);
    });
  });
}
