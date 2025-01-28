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

    test('Sum of two numbers in a string seperated by comma', () {
      int result = stringCalculator.findDigitsSum('1,5', ',');
      expect(result, 6);
    });

    test('Sum of multiple numbers in a string seperated by comma', () {
      int result = stringCalculator.findDigitsSum('1,3,54,3', ',');
      expect(result, 61);
    });

    test('Sum of numbers in a string seperated by a line', () {
      int result = stringCalculator.findDigitsSum('1\n2,3', ',');
      expect(result, 6);
    });

    test('Sum of numbers in a string seperated by a new line and other delimiter', () {
      int result = stringCalculator.findDigitsSum('//;\n1;2', ';');
      expect(result, 3);
    });

    test('Sum of numbers in a string containing negative numbers', () {
      expect(
          () => stringCalculator.findDigitsSum('1,2,-3,4,-5,6', ','),
          throwsA(
            predicate((e) => e is FormatException && e.message == 'Negative numbers not allowed: -3,-5'),
          ));
    });
  });
}
