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

    test('Sum of numbers in string containing alphanumeric value', () {
      expect(
        () => stringCalculator.findDigitsSum('ab5', ''),
        throwsA(
          predicate((e) => e is FormatException && e.message == 'Alphanumeric values are not allowed: ab5'),
        ),
      );
    });

    test('Sum of two numbers in a string seperated by comma', () {
      int result = stringCalculator.findDigitsSum('1,5', ',');
      expect(result, 6);
    });

    test('Sum of numbers in a string consisting of alphanumeric value', () {
      expect(
        () => stringCalculator.findDigitsSum('12,ab', ','),
        throwsA(
          predicate((e) => e is FormatException && e.message == 'Alphanumeric values are not allowed: ab'),
        ),
      );
    });
  });
}
