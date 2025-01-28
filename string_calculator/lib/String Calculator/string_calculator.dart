class StringCalculator {
  int findDigitsSum(String text, String delimiter) {
    int res = 0;
    List<dynamic> li = text.split(RegExp('[$delimiter\n]'));
    for (int i = 0; i < li.length; i++) {
      if (int.tryParse(li[i]) != null) {
        int temp = int.parse(li[i]);
        if (temp < 0) {
          String op = '';
          for (int j = i; j < li.length; j++) {
            if (int.tryParse(li[j]) != null && int.tryParse(li[j])! < 0) {
              op += '${li[j]},';
            }
          }
          throw FormatException('Negative numbers not allowed: ${op.substring(0, op.length - 1)}');
        } else {
          res = res + int.parse(li[i]);
        }
      }
    }
    return res;
  }
}
