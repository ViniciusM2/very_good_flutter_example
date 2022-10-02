import 'package:flutter/material.dart';
import 'package:oop_class_flutter_template/history/bloc/bloc.dart';
import 'package:oop_class_flutter_template/history/repository/history_repository.dart';
import 'package:oop_class_flutter_template/history/widgets/history_body.dart';

/// {@template history_page}
/// A description for HistoryPage
/// {@endtemplate}
class HistoryPage extends StatelessWidget {
  /// {@macro history_page}
  const HistoryPage({Key? key}) : super(key: key);

  /// The static route for HistoryPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HistoryPage());
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => HistoryRepositoryFirebase()..refresh(),
      child: BlocProvider(
        create: (context) => HistoryBloc(
          repository: RepositoryProvider.of<HistoryRepositoryFirebase>(context),
        ),
        child: const Scaffold(
          body: HistoryView(),
        ),
      ),
    );
  }
}

/// {@template history_view}
/// Displays the Body of HistoryView
/// {@endtemplate}
class HistoryView extends StatelessWidget {
  /// {@macro history_view}
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HistoryBody(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Histórico'),
      ),
    );
  }
}
