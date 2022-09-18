import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oop_class_flutter_template/two_numbers/bloc/bloc.dart';

/// {@template two_numbers_body}
/// Body of the TwoNumbersPage.
///
/// Add what it does
/// {@endtemplate}
class TwoNumbersBody extends StatelessWidget {
  /// {@macro two_numbers_body}
  const TwoNumbersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TwoNumbersBloc, TwoNumbersState>(
      builder: (context, state) {
        return Center(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextField(
                        onChanged: (value) {
                          context.read<TwoNumbersBloc>().add(
                                FirstNumberUpdated(
                                  firstNumber: num.tryParse(value) ?? 0,
                                ),
                              );
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Opacity(
                      opacity: state.operation == Operation.none ? 0 : 1,
                      child: Text(
                        _operationToIcon(state.operation),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        onChanged: (value) {
                          context.read<TwoNumbersBloc>().add(
                                SecondNumberUpdated(
                                  secondNumber: num.tryParse(value) ?? 0,
                                ),
                              );
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Opacity(
                      opacity: state.operation == Operation.none ? 0 : 1,
                      child: Text(
                        '=',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Text(
                      state.operation != Operation.none
                          ? state.result.toString()
                          : '',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => context.read<TwoNumbersBloc>().add(
                                const PreviousOperationSelected(),
                              ),
                          icon: const Icon(Icons.chevron_left),
                        ),
                        IconButton(
                          onPressed: () => context.read<TwoNumbersBloc>().add(
                                const NextOperationSelected(),
                              ),
                          icon: const Icon(Icons.chevron_right),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

String _operationToIcon(Operation operation) =>
    {
      Operation.add: '+',
      Operation.subtract: '-',
      Operation.multiply: '*',
      Operation.divide: '/',
    }[operation] ??
    '';
