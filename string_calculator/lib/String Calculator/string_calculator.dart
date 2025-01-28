class StringCalculator {
  int findDigitsSum(String text, String delimiter) {
    int res = 0;
    List<dynamic> li = text.split(RegExp('[$delimiter\n]'));
    for (int i = 0; i < li.length; i++) {
      if (int.tryParse(li[i]) != null) {
        res = res + int.parse(li[i]);
      }
    }
    return res;
  }
}
