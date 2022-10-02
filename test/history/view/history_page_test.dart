// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oop_class_flutter_template/history/history.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HistoryPage', () {
    group('route', () {
      test('is routable', () {
        expect(HistoryPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders HistoryView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HistoryPage()));
      expect(find.byType(HistoryView), findsOneWidget);
    });
  });
}
