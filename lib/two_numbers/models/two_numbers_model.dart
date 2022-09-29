enum Operation { none, add, subtract, multiply, divide }

class TwoNumbersModel {

  TwoNumbersModel({
    required this.firstNumber,
    required this.secondNumber,
    required this.operation,
    required this.result,
  });

  TwoNumbersModel.fromMap(Map<String, dynamic> map)
      : firstNumber = map['firstNumber'] as num,
        secondNumber = map['secondNumber'] as num,
        operation = _operationFromString(map['operation'] as String),
        result = map['result'] as num;

  final num firstNumber;
  final num secondNumber;
  final Operation operation;
  final num result;

  Map<String, dynamic> toMap() {
    return {
      'firstNumber': firstNumber,
      'secondNumber': secondNumber,
      'operation': _operationToString(operation),
      'result': result,
    };
  }
}

Operation _operationFromString(String operation) {
  switch (operation) {
    case 'add':
      return Operation.add;
    case 'subtract':
      return Operation.subtract;
    case 'multiply':
      return Operation.multiply;
    case 'divide':
      return Operation.divide;
    default:
      return Operation.none;
  }
}

String _operationToString(Operation operation) {
  switch (operation) {
    case Operation.add:
      return 'add';
    case Operation.subtract:
      return 'subtract';
    case Operation.multiply:
      return 'multiply';
    case Operation.divide:
      return 'divide';

    case Operation.none:
      // TODO: Handle this case.
      break;
  }
  return 'none';
}
