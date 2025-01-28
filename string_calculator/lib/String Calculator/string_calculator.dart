class StringCalculator {
  int findDigitsSum(String text, String delimiter) {
    int res = 0;
    if (text == '') {
      return 0;
    } else {
      List<dynamic> li = text.split(RegExp('[$delimiter\n]'));
      for (int i = 0; i < li.length; i++) {
        if (int.tryParse(li[i]) == null) {
          String temp = '';
          for (int j = i; j < li.length; j++) {
            if (int.tryParse(li[j]) == null) {
              temp += '${li[j]},';
            }
          }
          throw FormatException('Alphanumeric values are not allowed: ${temp.substring(0, temp.length - 1)}');
        } else {
          res = res + int.parse(li[i]);
        }
      }
    }
    return res;
  }
}
