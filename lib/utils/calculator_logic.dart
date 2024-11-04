// utils/calculator_logic.dart
import 'dart:math';

class CalculatorLogic {
  String _expression = '';
  double _result = 0.0;

  String get expression => _expression;
  double get result => _result;

  void append(String character) {
    _expression += character;
  }

  /// Deletes the last character in the current expression
  void delete() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
    }
  }

  /// Clears the entire expression
  void clear() {
    _expression = '';
    _result = 0.0;
  }

  /// Calculates the result of the current expression
  void calculate() {
    try {
      _result = _evaluateExpression(_expression);
    } catch (e) {
      _result = double.nan;  // Handle invalid calculation by setting result to NaN
    }
  }

  double _evaluateExpression(String expr) {
    try {
      // Handle percentage calculation for cases like "50%*100"
      expr = expr.replaceAllMapped(RegExp(r'(\d+)%'), (match) {
        final value = double.parse(match.group(1)!);
        return (value / 100).toString();
      });

      // Use the helper methods to tokenize and evaluate the expression
      List<String> tokens = _tokenizeExpression(expr);
      return _parseTokens(tokens);
    } catch (e) {
      return 0.0;  // Return 0.0 if parsing fails
    }
  }

  /// Splits the expression into tokens of numbers and operators
  List<String> _tokenizeExpression(String expr) {
    final regex = RegExp(r'(\d+(\.\d+)?)|[\+\-\*/]');
    return regex
        .allMatches(expr)
        .map((match) => match.group(0)!)
        .toList();
  }

  /// Evaluates the tokens list with operator precedence
  double _parseTokens(List<String> tokens) {
    List<double> values = [];
    List<String> operators = [];

    int i = 0;
    while (i < tokens.length) {
      String token = tokens[i];

      if (_isNumber(token)) {
        values.add(double.parse(token));
      } else if (token == '*' || token == '/') {
        double a = values.removeLast();
        i++;
        double b = double.parse(tokens[i]);
        values.add(token == '*' ? a * b : a / b);
      } else {
        operators.add(token);
      }
      i++;
    }

    double result = values[0];
    for (int j = 0; j < operators.length; j++) {
      String op = operators[j];
      double b = values[j + 1];
      if (op == '+') result += b;
      if (op == '-') result -= b;
    }

    return result;
  }

  bool _isNumber(String str) {
    return double.tryParse(str) != null;
  }
}
