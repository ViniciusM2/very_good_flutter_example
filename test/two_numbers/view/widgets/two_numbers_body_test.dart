// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:oop_class_flutter_template/two_numbers/models/two_numbers_model.dart';
import 'package:oop_class_flutter_template/two_numbers/two_numbers.dart';
import 'package:flutter_test/flutter_test.dart';

class MockTwoNumbersBloc extends MockBloc<TwoNumbersEvent, TwoNumbersState>
    implements TwoNumbersBloc {}

void main() {
  group('TwoNumbersBody', () {
    testWidgets('renders Text', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => TwoNumbersBloc(),
          child: MaterialApp(
            home: Scaffold(
              body: TwoNumbersBody(),
            ),
          ),
        ),
      );

      expect(find.byType(Text), findsAtLeastNWidgets(1));
    });
    testWidgets('Changing first number changes state', (tester) async {
      late final TwoNumbersBloc bloc;
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => bloc = TwoNumbersBloc(),
          child: MaterialApp(
            home: Scaffold(
              body: TwoNumbersBody(),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField).first, '1');
      await tester.pump();
      expect(
        bloc.state.firstNumber,
        equals(1),
      );
    });
    testWidgets('Changing second number changes state', (tester) async {
      late final TwoNumbersBloc bloc;
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => bloc = TwoNumbersBloc(),
          child: MaterialApp(
            home: Scaffold(
              body: TwoNumbersBody(),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField).last, '1');
      await tester.pump();
      expect(
        bloc.state.secondNumber,
        equals(1),
      );
    });
    testWidgets('When the next operation is selected, a + is displayed',
        (tester) async {
      late final TwoNumbersBloc bloc;
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => bloc = TwoNumbersBloc(),
          child: MaterialApp(
            home: Scaffold(
              body: TwoNumbersBody(),
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.chevron_right));
      await tester.pump();

      expect(bloc.state.operation, equals(Operation.add));

      expect(find.text('+'), findsOneWidget);
    });
    testWidgets('When the previous operation is selected, a / is displayed',
        (tester) async {
      late final TwoNumbersBloc bloc;
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => bloc = TwoNumbersBloc(),
          child: MaterialApp(
            home: Scaffold(
              body: TwoNumbersBody(),
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.chevron_left));
      await tester.pump();

      expect(bloc.state.operation, equals(Operation.divide));

      expect(find.text('/'), findsOneWidget);
    });
    // Save button
    testWidgets('When the save button is pressed, nothing happens',
        (tester) async {
      final TwoNumbersBloc bloc = MockTwoNumbersBloc();
      // Stub the state stream
      whenListen(
        bloc,
        Stream.fromIterable([TwoNumbersState()]),
        initialState: TwoNumbersState(),
      );
      await tester.pumpWidget(
        BlocProvider<TwoNumbersBloc>(
          create: (context) => bloc,
          child: MaterialApp(
            home: Scaffold(
              body: TwoNumbersBody(),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.byType(TwoNumbersBody), findsOneWidget);
    });
  });
}
