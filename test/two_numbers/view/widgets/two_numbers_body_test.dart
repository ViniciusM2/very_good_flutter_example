// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oop_class_flutter_template/two_numbers/two_numbers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TwoNumbersBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => TwoNumbersBloc(),
          child: MaterialApp(home: TwoNumbersBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
