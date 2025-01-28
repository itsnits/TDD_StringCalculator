import 'package:string_calculator/String%20Calculator/string_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('String Calculator', () {
    late StringCalculator stringCalculator;

    setUp(() {
      stringCalculator = StringCalculator();
    });

    test('Sum of digits in empty string', () {
      int result = stringCalculator.findDigitsSum('', ',');
      expect(result, 0);
    });
  });
}
