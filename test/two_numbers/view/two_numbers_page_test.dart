// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oop_class_flutter_template/two_numbers/two_numbers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oop_class_flutter_template/two_numbers/view/two_numbers_history_page.dart';

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

    // BlocProvider provides the TwoNumbersBloc to the TwoNumbersView
    testWidgets('TwoNumbersBloc is actually provided', (tester) async {
      await tester.pumpWidget(MaterialApp(home: TwoNumbersPage()));
      final BuildContext context = tester.element(find.byType(TwoNumbersView));
      expect(
        context.read<TwoNumbersBloc>(),
        isA<TwoNumbersBloc>(),
      );

    });

    // Historic button navigates to TwoNumbersHistoricPage
    testWidgets('historic button navigates to TwoNumbersHistoricPage',
        (tester) async {
      await tester.pumpWidget(MaterialApp(home: TwoNumbersPage()));
      await tester.tap(find.byIcon(Icons.history));
      await tester.pumpAndSettle();
      expect(find.byType(TwoNumbersHistoryPage), findsOneWidget);
    });
  });
}
