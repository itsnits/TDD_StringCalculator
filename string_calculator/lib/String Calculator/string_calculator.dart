class StringCalculator {
  int findDigitsSum(String text, String delimiter) {
    int res = 0;
    if (text == '') {
      return 0;
    } else {
      List<dynamic> li = text.split(',');
      for (var item in li) {
        if (int.tryParse(item) == null) {
          throw FormatException('Alphanumeric Values are not allowed: $text');
        } else {
          res = res + int.parse(item);
        }
      }
    }
    return res;
  }
}
