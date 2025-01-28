class StringCalculator {
  int findDigitsSum(String text, String delimiter) {
    if (text == '') {
      return 0;
    } else {
      if (int.tryParse(text) != null) {
        return int.parse(text);
      } else {
        throw FormatException('Alphanumeric Values are not allowed: $text');
      }
    }
  }
}
