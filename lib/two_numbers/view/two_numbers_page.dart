import 'package:flutter/material.dart';
import 'package:oop_class_flutter_template/two_numbers/bloc/bloc.dart';
import 'package:oop_class_flutter_template/two_numbers/widgets/two_numbers_body.dart';

/// {@template two_numbers_page}
/// A description for TwoNumbersPage
/// {@endtemplate}
class TwoNumbersPage extends StatelessWidget {
  /// {@macro two_numbers_page}
  const TwoNumbersPage({Key? key}) : super(key: key);

  /// The static route for TwoNumbersPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const TwoNumbersPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TwoNumbersBloc(),
      child: BlocBuilder<TwoNumbersBloc, TwoNumbersState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: _operationToColor(state.operation),
              elevation: 0,
              title: Text(
                state.operation.toString(),
              ),
            ),
            backgroundColor: _operationToColor(
              state.operation,
            ),
            body: const TwoNumbersBody(),
          );
        },
      ),
    );
  }
}

/// {@template two_numbers_view}
/// Displays the Body of TwoNumbersView
/// {@endtemplate}
class TwoNumbersView extends StatelessWidget {
  /// {@macro two_numbers_view}
  const TwoNumbersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TwoNumbersBody();
  }
}

Color _operationToColor(Operation operation) =>
    {
      Operation.add: Colors.green,
      Operation.subtract: Colors.red,
      Operation.multiply: Colors.blue,
      Operation.divide: Colors.yellow,
    }[operation] ??
    Colors.grey;
