import 'package:string_calculator/String%20Calculator/string_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('String Calculator', () {
    late StringCalculator stringCalculator;

    setUp(() {
      stringCalculator = StringCalculator();
    });

    test('Sum of numbers in empty string', () {
      int result = stringCalculator.findDigitsSum('', '');
      expect(result, 0);
    });

    test('Sum of numbers in string consisting of only one number', () {
      int result = stringCalculator.findDigitsSum('5', '');
      expect(result, 5);
    });
  });
}
