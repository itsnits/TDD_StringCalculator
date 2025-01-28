class StringCalculator {
  int findDigitsSum(String text, String delimiter) {
    int res = 0;
    if (text == '') {
      return 0;
    } else {
      List<dynamic> li = text.split(delimiter);
      for (var item in li) {
        if (int.tryParse(item) == null) {
          String temp = '';
          for (var item in li) {
            if (int.tryParse(item) == null) {
              temp += '$item,';
            }
          }
          throw FormatException('Alphanumeric values are not allowed: ${temp.substring(0, temp.length - 1)}');
        } else {
          res = res + int.parse(item);
        }
      }
    }
    return res;
  }
}
