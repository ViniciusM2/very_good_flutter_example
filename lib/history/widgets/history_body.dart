import 'package:flutter/material.dart';
import 'package:oop_class_flutter_template/history/bloc/bloc.dart';
import 'package:oop_class_flutter_template/two_numbers/models/two_numbers_model.dart';

/// {@template history_body}
/// Body of the HistoryPage.
///
/// Add what it does
/// {@endtemplate}
class HistoryBody extends StatelessWidget {
  /// {@macro history_body}
  const HistoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        print('BUILD');
        print(state);
        if (state is HistoryInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HistorySuccess) {
          return ListView.separated(
            itemCount: state.history.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_makeEntryString(state.history[index])),
              );
            },
          );
        } else {
          return const Center(
            child: Text('Erro ao carregar histórico'),
          );
        }
        // return Center(child: Text(state.customProperty));
      },
    );
  }
}

String _makeEntryString(TwoNumbersModel? model) {
  if (model != null) {
    return '${model.firstNumber} ${_operationToString(model.operation)} ${model.secondNumber} = ${model.result}';
  }
  return '';
}

String _operationToString(Operation operation) {
  switch (operation) {
    case Operation.add:
      return '+';
    case Operation.subtract:
      return '-';
    case Operation.multiply:
      return '*';
    case Operation.divide:
      return '/';
    default:
      return '?';
  }
}
