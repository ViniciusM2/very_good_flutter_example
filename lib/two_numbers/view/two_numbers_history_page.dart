import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oop_class_flutter_template/two_numbers/models/two_numbers_model.dart';
import 'package:oop_class_flutter_template/two_numbers/repository/two_numbers_repository.dart';

class TwoNumbersHistoricPage extends StatelessWidget {
  const TwoNumbersHistoricPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico de Cálculos')),
      body: FutureBuilder<List<TwoNumbersModel>>(
        future: TwoNumbersRepository().loadAll(),
        builder: (BuildContext context,
            AsyncSnapshot<List<TwoNumbersModel>> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && (snapshot.data?.isEmpty ?? true)) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              itemCount: snapshot.data?.length ?? 0,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_makeEntryString(snapshot.data?[index])),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
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
